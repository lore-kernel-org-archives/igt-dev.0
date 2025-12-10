Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AE0D3C521
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9C810E242;
	Wed, 10 Dec 2025 03:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4x06S38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E310E242
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337766; x=1796873766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNLTfKRiN25lIWtcY/G57wuwOcfgqKe9K/AwAdAfOak=;
 b=I4x06S383uIjFye7MU3hUCThSK6IEZ4JzzTKfx58Ejous1OWflBgkRKm
 /ZXru6RNcIHs334UgMJF041rqxw6Es3PwaGl8EOGWBjb8wUXISYSA3ttk
 bCtwS1R8jUCRec7cPdCzcAgL6RjNyV/wz9m5Vexfage0HKSShYFlxRfTT
 KmMu/aVxnJSufwWI7HcrDAuJt+rc73ZaevUVCLbmIev+ADIt1B8P5s9kU
 otgMoeRMrqrdEsiVhj40BVZDEH4mLzUus4DnSnacdMZjCZ+vkUwLKQVj2
 DZHTZ03IhcUbG+1S35/tJt6lfoAmtOH3fudFOEKE/BEC6+WnbS+YXQTZ3 g==;
X-CSE-ConnectionGUID: xz32ShRQTmeiE995DvwLGg==
X-CSE-MsgGUID: pT6s0V07S3uQvLN6RivcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70924931"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="70924931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:36:06 -0800
X-CSE-ConnectionGUID: GNKX0prpTR69QOh/BfcELQ==
X-CSE-MsgGUID: +KHpVMd8S+Og/+FXK75CLg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:36:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:36:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:36:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kc91NB01Cr8IivNG6CnnwMzIdafo01+b9NKd5z9iR7t/VpQ9IId4V/CAnLDC5/Mej6g7NZDCVZx3QlxL8CpVqPvI+of1IFBkf1N9yDTcGRXRZiaFdW31fEN5zy40yJs5jNlgLF5mOjn5RFDMTVWe+vUgXfdb47ueDLoL84Vz6OS3DfWvKkBHHcAnteuDqaXEvuyDZHGe9HqpxgHRRv9XVbjCxHwLA35vabkZp6VVbHMHawj0bARD3gH5IGhbNRk5oNfs0WcbBa+eiNhhTgmy1GtidTitjL8FhEL0qbUh2HWPfPvRrX6AO6hzu1x7+xLDRA9+1Sk5WHyNS/OYZLGqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fqZh/NRD0eHgjZ1RbK1i14u7v+0SSkGi/rf6REsmbs=;
 b=w8wka6zqhIbeGOlgDRT7QZeWeZ7DYvm9n7jurJ+5sqPk8OrLf5Yac5Xf/czrN/jU/K/LGoPBdDW2yFpvwNMqc3YO6bF7A2IrAhvs5k21vS3KshC1tAF6+IqBQSExiLzyCgFXeNtX/go3VjRHJ/57EJLAOELPQiG5JO22/+eJcVGQ4vrW/M3jU0JvRRrnckEsgpnIb1gAAFfL+uZcnCwEaq8ytApj3bp8dMAYxvakJ49zXZXDyqwr5+20vMz+6QeiZQ5c2aX/DQHRZZFkPWPeIDL3u26gVQnB2WFib63e9T+dCEYskGthbqlhn0PgaNOXDCXYdrPTWQFTMUv8vfDmag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8426.namprd11.prod.outlook.com (2603:10b6:806:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 03:36:02 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:36:02 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
Thread-Index: AQHcaYRl9j+/UmNiSU+VOHzVLJITnbUaORtw
Date: Wed, 10 Dec 2025 03:36:01 +0000
Message-ID: <DM4PR11MB63120883958813825E6D909690A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-4-karthik.b.s@intel.com>
In-Reply-To: <20251210032349.2781106-4-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8426:EE_
x-ms-office365-filtering-correlation-id: 02f84483-a242-4490-b713-08de379d3dce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?k9LRwI89mnAlOhq4k160a75UZMla9DgXaN737o0VIY0wT+W+1C5l/s8XOO+C?=
 =?us-ascii?Q?LLu8DdGQ9Ac1xP41lJqAQONOUrbfv9aZUl3x3AkgB/mvhxfB9sR0Wg/4MyGz?=
 =?us-ascii?Q?eFdZD8jFxR18jstmL5LGkGS3EexlM30SGoYTGI62ORGIY3YYNmRJftL7/kwF?=
 =?us-ascii?Q?Czf/GOvAVTSVtJDVHRmQaIUWsqwcfCunCT9o/EQsTaup05f8CArSUk/JuCy6?=
 =?us-ascii?Q?kaxzxdaqwQucymMhHabF+IbFg7FH2ubhdZu0x7+6eIiSqdXSM5lCnOPKHs7b?=
 =?us-ascii?Q?L1ZmJE+sCM7iTVS/U3zlCMs+u05JzkpoMQJ728KtYGgpURLCSGmiNot+Cn2y?=
 =?us-ascii?Q?OmMZ3THnvtTBunkOCFGuCF0bZt4ZcOKpIWvxdQV11Ih4TkbuHhRMPgFK7hJL?=
 =?us-ascii?Q?wId9oYL1pgLa14xX2KhpQEC92h1fu4dPR+eOOF18hSw1p9ZzaYq2FZ1mv54G?=
 =?us-ascii?Q?Za/V4+dyUMCEPK1oAKguAz4kq1f9OlNqpSCZ6tMyKXZLKADEGUKYZNcgSISV?=
 =?us-ascii?Q?IgbMXgKiBUj6uTDYHsX87dPWb10BPzMuG6oMhA0kwNtnKHFzFlaBB1Fy+fHh?=
 =?us-ascii?Q?rDZ7vWTiX5IuFJr0VO6u6q7qU2MtXfh73VKfAhfXS4zSao0w85Dy8g4z8IlK?=
 =?us-ascii?Q?GhOBLoZoKuu3xtbHtS6LxNgDlTf9J8X65pppcR0/TkWgDYL9CZfIbr1daKO6?=
 =?us-ascii?Q?uZJd3N2/tSHEugF9tktaeYTAo2Y/3+2aqAXJ8j3TcjxiqQoM5z/87YONYrPR?=
 =?us-ascii?Q?uqGn4hajaSrMHqOtZ79V1Luik5xbGMKOiGmfh1Vb7vN0OLPM7UHUd+dg+8I8?=
 =?us-ascii?Q?Qc7paSzx718NSphGFQZg5NAa6OnbigT44Ku3qAUG7RWd9JuDJIYoIGvNWBGu?=
 =?us-ascii?Q?fwx/axJezB0WLU1bdnFUQ631O85sgYbrqbqSfNS/89bSXZztDZA59+wEY8vd?=
 =?us-ascii?Q?8ki1T6a2C3/Y6xNAyMLJML4Zf7yAVo91Wex28aFhfzGS5Ccrplt8m7yvW8F7?=
 =?us-ascii?Q?FEp624PkdY/dcTMUDkoRI2Edot2uK/qRtKHVrt832Jk9UzfwNwAVeoj86UtT?=
 =?us-ascii?Q?vLEikkB4+IUZ4oG1NlkdfqWa/xpNXRoGpG8HzaJWVrKcliKOkD6H4eCTBnf/?=
 =?us-ascii?Q?yEy2uJN3p1A5fQrDo74LyBu02DUDZblfHRlqQpQeC/yB70xMaM605rXEyCkG?=
 =?us-ascii?Q?3TfCLOtOb1CV3LjDpJ+W/Ql/B+thRnSLE2uKUDqBhSGZWR2TWjOZeYAfWijb?=
 =?us-ascii?Q?0wcVPUHxdlo7KDqujMj4lcgX8uMUc/26kMx7TtE7206WB3yKfaA3NVmi01RF?=
 =?us-ascii?Q?/8kQLrndwLpJ6HNujqhqFViBRI6JhdjaYg0/dZH2rrMbAxq5rdevDZd0m49K?=
 =?us-ascii?Q?FgEnDaEfReuV5cbSMrWsDNCB+jQg96s2L0zr3iOoFIb9pj8sDQV8tgdwHsIh?=
 =?us-ascii?Q?D8DakxGsiZFpUvFw8D0eIgJkOhVerz4iw2bxGQRDqKc2RAn8OlZ3poiB4R4S?=
 =?us-ascii?Q?AncCiURlDkNR0JVyNm5m/SMv8oou3ATDaZWv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HMpeUbfs3PI19TA+SZ6DHtsmJe8QM9uQYps4vpxK9NXNJx+vzMrFUHg5ahHp?=
 =?us-ascii?Q?ZIWdQ6rdcUV3GBu/bJhLbO9OtZTUzNq4ZDFF/OtTr0QGCUiRdy8AV9ZR6XIp?=
 =?us-ascii?Q?nomltMIYUda2r2/zRy3UU/rS9a5TVScg8pvLG/krvAOzskrMDacli85hHS/4?=
 =?us-ascii?Q?59OseBhP/BQS8Uzw0m9nYQGdlyzk5Y31/9bzIN0kPbYJAK3gZNljuD0kGdoP?=
 =?us-ascii?Q?vVQjJe2KcYBwo2H7T2T8IK0gvNmV0KuIB/2M2sub9ANdf6z2pL+LEHz4KjPb?=
 =?us-ascii?Q?PmhminV9r2sh6XRW9TZUmniZaC5WZr30nXESDaaf8OYa7ZEU4Ldw4ADDII5V?=
 =?us-ascii?Q?0mzftt1rvbQtgNNIFtJfjV5Yy4xUWCAPOzqCowbeJxOFnissGm4gc8iS3u11?=
 =?us-ascii?Q?cc6Xl3V4otfq8Nu4+cOky6rViLtqJ5Z01kWkst+ZJhwjegFmqZK8QNQHBOaJ?=
 =?us-ascii?Q?EUWSdZNcayT4myHxKgmZlTk4VmySLQSA2nxJxQjYBbc4hrizZXdozgML4cxw?=
 =?us-ascii?Q?HXIWLuxypGI7QXK7PSjVU/hfjTPGuX0oPxa8FBH1BGdGR1N/4bCyT9jU60ri?=
 =?us-ascii?Q?93jACUvBfS7phGrYDpbS8TfQTLmOnwzORxgKOTMDbYBSWboqm46OXo1m6lTM?=
 =?us-ascii?Q?gMH8gz/Zp1MIxsx24dUohcmqShFkV3coQAjQW7Pjtio3LT4rehi4/G8aleWw?=
 =?us-ascii?Q?xeBZi3jTGGGW1xiYiSpTFAXEL+0+JB1FMySgQJCNUfUglLnzu42P9GGB9REK?=
 =?us-ascii?Q?sv0TN3T9Er6NvZ8LG54PBrB5va9tvxxR4IpjyvhlspltuVnSVYXPZ//JBRRR?=
 =?us-ascii?Q?JHKr65bwyA6Zj2NlFkYtAfSi/fXsSyR6LdsFsCZ2JhSJYXJ6RKKxs29sUeS1?=
 =?us-ascii?Q?5/di+1mPAu9oTgAJ89cOhrohBsc/mdVpPWc1E6ntjlQ28OpZMbjc0Q9SzAyD?=
 =?us-ascii?Q?kSB6sH2F54DIAy4M6tXKlLt8b4ekuessILPKr4mlgYDRh48ocaWoPJtRobgM?=
 =?us-ascii?Q?FPtWonyZoXJrF0RsyiQMbgAU2yDvRmyH5H22V6AWYOT6nh4T1oxDeQdHKjJp?=
 =?us-ascii?Q?ZMdPdYDjvE8ASqhhuXYrddJs6hTEKtLdMIqMW/cbi9hiIU4RzyaWpLCLoeLF?=
 =?us-ascii?Q?3j+XTEXiHhQIJWwVwMUlk4XT/MUS9K1aMvYrhZ969km0srrC17+jjHh6bzQw?=
 =?us-ascii?Q?ukJg9+HQFg9ZglaFxpUZcuqftNf09J7dGvHQb35ciarfZynuwfU/0SaHpJPE?=
 =?us-ascii?Q?etj/RQmhYtAZOh7Mc9WcNfeq7tBt4cmIQUR2xTmOI391Wm7lSRVach98eg5p?=
 =?us-ascii?Q?2bddrpFiGT7eolc5FSuHmBvUCZXnwf5Y/j1wjp8SZ/iAsHhpNODsE6IQ6W0s?=
 =?us-ascii?Q?Sp8D2DEv0JUUVPmFrcMR0WJPARfp3IS6/t65At7Mxim3aFASPc2ZHgOamC0X?=
 =?us-ascii?Q?zbNx1tBieant3did/iQ9YZ3BPNJI9n6wQI0GVzyYlvcmy8/G1pi3GlUjOc3I?=
 =?us-ascii?Q?Kdu9SqX2fNKisMYt0Fg1IIhO7/CIMVrIE+jTo3ep4JearokjyZltfghDnJsA?=
 =?us-ascii?Q?J+wxCid2gC9mJUyp+Hk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f84483-a242-4490-b713-08de379d3dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:36:01.8810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwFzkVtYirf0NAmy0Pr1s0GgxHfOKRff+zMxGquwZqe5/k4iV5VP9cc0Yrd2RrjdYbdu4ShPZZNNR0JRxW/Yfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Wednesday, December 10, 2025 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
>=20
> Use the lib function igt_paint_test_pattern_color_fb to paint the fb inst=
ead of
> doing it locally in the test binary.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_hdr.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index ab0ec47cb..a5912501a
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -146,12 +146,7 @@ static void test_cycle_flags(data_t *data, uint32_t
> test_flags)
>  /* Fills the FB with a test HDR pattern. */  static void
> draw_hdr_pattern(igt_fb_t *fb)  {
> -	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> -
> -	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
> -	igt_paint_test_pattern(cr, fb->width, fb->height);
> -
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>  }
>=20
>  /* Converts a double to 861-G spec FP format. */
> --
> 2.43.0

