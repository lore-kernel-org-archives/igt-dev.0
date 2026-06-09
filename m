Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61728CD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 09:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BF110E1CB;
	Tue,  9 Jun 2026 09:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbZWk6mt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562310E1C7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780996251; x=1812532251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tE6uFUrIB3BFLxOwZ7Gpz1ILEwTvwjpl01GlziwFiak=;
 b=bbZWk6mtlRLWQJhS7oBLaA79Q1rVBYaAGVc0NPo8/1hhg57Dqo1nx+Gl
 w+hw4yZBgt4671Ej9rwk7GHPr6ZwWrJnq5frBN2PHUoKBEL3pJEUZu8v8
 VhRi7CqKZkXeobWvAL16zmHoDhC97uGSu94DsAKg0bLlozmD1SinznVUu
 Xv428YBgtzl2uMwrTVs3TVki0ExQsjgV8MpcGR9cQB2ktrSvck01/L+Oy
 uMFCC7snB8qzB8DmvfQRfPiST47BZcHLt/6RXjtWEjRuI9f2PlO6Btg8q
 jzEf42PyJniaJTO+IXcX7x5IkwYxART04WpW18cjgD94g9eNv8rQHq2w0 w==;
X-CSE-ConnectionGUID: 8ic+NqpKS3+H8Lo/7cypAA==
X-CSE-MsgGUID: SqAT//2hQh6G+S84cldBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92314534"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92314534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:10:51 -0700
X-CSE-ConnectionGUID: 9gSSIzHhRJSKgNm4g9g61g==
X-CSE-MsgGUID: mXEQapIeQXmxK6skrbRXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="244956292"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:10:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:10:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 02:10:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgsrIifx4kK479GHpEFSls3NVyfdRRG4j2U8CYbuAA4cimemqzFJxIE8wEccfzY6uuX8gcMIasBcTTZ3Q6wyQExM5QAKvPQM/3KeyRi1ykdfgod06dYzhhMuZXcIsPG8UYA+0BMUx1NmXz0aHQrCBbg2roujEEZx2zFp4KIFfQXsrjUBaRnPj8ulXUDVGv535PXThKZASHsKSfjttf+YgJO3mr9cr4YlKzScgrIw+tTx74x1MqHYKj9VSiKyRqV8K8cCBVt8dWqF3235YkF1MJbRpp+efywUO1JoCn7864ikkhgfjKqtgf5BpwE1Wt1Vy/xmeyl3a/OFXsE07deqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua//vEeMr2c4frh/92EppOLjrEngGJR/pgyH1qTQwjU=;
 b=EKVOy+1CPer8ni5r6L/3ILVOqw9fA+uN8iWVKaBOY6KmzfqmYlfFoNMxbUKrOa1CwALi1ZI8m1RxcpYjxGmNkX4tfQO+yT1M4sVMh8Sdr8/1jRTF/d7z2pXtzn48DXNVRZylps+LkmbrUZoDDcjvFSvr8UUxMXSID1sukTxqWQslIRu5oSfIS84ylr99oQLLXTzqKMbrMsYix5bh0mbmeHecqwW698aX7irW26XPi6woGDzkkM/mZeVmm+usgOuhNrSjIKCCHEbJ42NegzyDpHI7jD6GKU7/ygIM3owjBgrfjwk11yXJPks/u/Y9Kokxv1qQod6oJI3Okumg9wpBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 09:10:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:10:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation
 when mode is exactly 4K@30
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation
 when mode is exactly 4K@30
Thread-Index: AQHc93/3VW3OQlXO3kCkFPqvRu4fGbY17bYw
Date: Tue, 9 Jun 2026 09:10:41 +0000
Message-ID: <PH7PR11MB60530FBD28027726DB463931E71D2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260608195105.2616958-1-swati2.sharma@intel.com>
In-Reply-To: <20260608195105.2616958-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SN7PR11MB8261:EE_
x-ms-office365-filtering-correlation-id: c4973c8b-13b4-4788-40e5-08dec606fb34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|6133799003|22082099003|38070700021;
x-microsoft-antispam-message-info: mCY3x1FaA5KfVSE/8569BDUKOTf6dqoAnUaPL53JaKuLTTFDiQDJ5YmFeyLSAceDhv/1ihgr0hYJPO/aIpL/5gV4uWXkK0tyNDKznBp7ZaWLRhiskhDbyuMlZAx3+/36uAEO+FdQyIlXGkq2ud4TfzFTTpCdcBfEX2e6Vgibqm5Kvo/a0RCbpgC/MH4PaghI1zipnXCPoNMVWLZUiBR+Wl4ZObG1XlPlSo7O/TiltvLc+JfatpUh8tP1wITGKf14N+lqKJMq54VMcUz9E/1xveAl0atiURHsSJcXQcQv1MBmPNRJM03cZYMMuZ00zVmqgkGVfpch8LL6/43La+k37hk/FCTw/qA9Z6P94myD2YPF7Whp9JIRd54aHjrcs20jnkRuXHqpMgisq7cPDUVMGBHuWbuiq38GpElErZZPzfC+OMX+5fg9pU0tsegVcdirHjWTQbuRNxf5+A8++3FOJeh8D4ZB3sTMPG+ZAE+Cm9CjxFF8OLMMUMQrmZwDOR02sKfAo5FObKXOrQEbA2eQovAGh7dTFmGd4lXa9OqxCw17yKePcLIVaZFwu2ROUEOJ73PKfUd+LCPBJQEX4OJ7KwOwGEm6wJ3L/0T3+aRADXFVezgby7S+zS1l6OSeMXb0hM/DG4b0+xxf4QIiHfy6ObCBAukwg/ZS07mNlGRE2uParCZxh4KVuZ2bsFqbImLOnZybyc8eYCQAbcpz7Jhk6pTewlTQIrZ6QJOYx4i2JAJJjY3yXwdnVCKSaDCYRVJ6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(6133799003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0DC/RRmNq7TJ5VKRr4JxFQ1ROtAWepTxz1Nj5bWlwg9faiARK+TmmXtmY5ta?=
 =?us-ascii?Q?XTft7anIka60iurcANmzBrmT1DZd5K3QsKZlOkjhtaOamDglC73k0xa+o4UD?=
 =?us-ascii?Q?FQmH+72VURfL/wXv7jasSPUpZVYu+N61T/pemmWXF8RrAbNH2PcHSev3Jt40?=
 =?us-ascii?Q?cfn3MIhAkUCGFilWm8jNzoxCYHfbN2wBjiNHUAo03xu1yX7zQO4j0sXaDW/d?=
 =?us-ascii?Q?m2YrQQyysyZ/sUkCs1f3RCyicUMUtqbNcszUqJcvzGxA1f1hpFKOto/+WI/U?=
 =?us-ascii?Q?CNQcyLvEB6LGMZZD2LoL+hc+8II7t/mJD9dAJ9hnytDfd3EB4p6AfM95JRqk?=
 =?us-ascii?Q?16ga6SoLTWQi6x9/wwRKXn2VUeCauON6oRDuP6NoJlErcO98VwWlNUF5aItM?=
 =?us-ascii?Q?BB8eJBzHI2MlaJqtBMDyHmwugh6CgFwYbw+PmW75J1StwMhFjSZMAJh6P56h?=
 =?us-ascii?Q?sUU7wprSJSrNolELqWBTssxL6Ta096JF2rjZ7Z2O/8G58d/H1tgXbQsJuaRB?=
 =?us-ascii?Q?aD8DLyxQlFjiyUH7hVtEnOEvjs5i2kTEHSq+4l3s9K6GMFCHcHGD0vsMt6vx?=
 =?us-ascii?Q?jP/pwi3dq6rhhQb/cUH+r0tYupK0Fj2NxDaYcC8QCw8JwsLfVXaWC9P8BiyE?=
 =?us-ascii?Q?c5yifcM/TRgG1j6x0aOhQmPoQGln2LXJlY5m+fglO+u4A2F6bV9T1oL0ryuZ?=
 =?us-ascii?Q?fT+2++UupfIozKnnKL+VX49BLDVNS/WsYanULl8kSMg6yBYY2icM1NFarVU6?=
 =?us-ascii?Q?DCkl7LiqLT4ZfydxZ3eVBn88eNID87RmrRhqzkdQs0PA6j3vgwMUBzfklhlS?=
 =?us-ascii?Q?lhjXGqClk2pBmlELg6PwkXV11JnBKwrsUQPCuV9PDUzpqvQp7D9ASEjzaOPW?=
 =?us-ascii?Q?ttQZVosAieaNA7nWWk4F1BcHmKkE1ipkCEcFFgyStSJbAX1PvJ06fqe19Y+9?=
 =?us-ascii?Q?yVm+MvTEXTPCTVMnVnz7VuUrI7PhjUZkTIZNhe4Oj99Ii2Xg6qqIgZTz7Sp/?=
 =?us-ascii?Q?5zmDN/6R2gHZhPclskKGPiyYm01my02L4pfU1Ubufbtxm3gVkEEEnHQKfzE0?=
 =?us-ascii?Q?fcd8yH1xqZsddNRS+C+oypA2pENLg4qPCjcaBuhlwCyzDhbTHPGgY3NyCzSz?=
 =?us-ascii?Q?6r7GgRwjnDks/jq15nuZOvu3yspqqiqF0uqjWimUVtqSWYqMFmLfT8r9VA7p?=
 =?us-ascii?Q?LACIGSodRDcQ7ZOeQIBoe67wD49rQS1Zt4Oujr0UvKWz2JtOQHx6OrrLFYGl?=
 =?us-ascii?Q?lknrZHtiwwd1x6o9ec5tiQ5PATEeNbaCjORpkbLgbIu+1372bMp2bDE6/HXN?=
 =?us-ascii?Q?9eTpoQHh3rbpRa7muJnGIWec5lPxT8jhn80pIgGZ4vf59CdGquin2oYBRWVl?=
 =?us-ascii?Q?JIOk20zy/YyXH1hvw5e1w6no1ZDuJZqbS3PTmu0jA1koTUdvzMAmqtWe+Qkk?=
 =?us-ascii?Q?rXF5LBVFFgwIqAPM7lisV9vtbbha4ZIYyUAwrM4HkoPqUM/XEPOqnvdsaCht?=
 =?us-ascii?Q?afCG/xOud7EKV4qSOnkRkXTCdIv/ViP40j3pyu1EjoTQr0bdgr2my6oEqzqL?=
 =?us-ascii?Q?O2Rhq8laxkLv/GmbUZIdhyB1J/YIO9cGham2iVoBWIrWrOYq+oByoaRFmXow?=
 =?us-ascii?Q?MwqGdYqnqsvAv+tcw1gpm7kzeqfogHW1QFBadI6c/lD/zAE5Ud5DzY1ITlEg?=
 =?us-ascii?Q?QlUIo2g0+YA9T1Ekj6uU7W4Lzi/Nv3APdqrR7oo3MrQbj3gIed4qG3oMikvg?=
 =?us-ascii?Q?ZpDvtjhkEw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ODiPl7ayodfy2wXvOID8Jj6Y3gyDVq04xYYU2HwjpHyWm3KENXBHNj49iAelFt69RVhftz693LegLLlEDkj/FGrBu67SUpyPrKASb1VUO5SZofBTXdYRGwDem7nHqvdjhEBDbVfFczb4rk/OWpHV4X8S7V2AFQ1KpHMJrwhqzetHcw5tf24T8D5IERLUNPbYvBpK7Pq7iAcI53KQ0z89NgegLrpSSjxH5sEdTvg2kEmBpvGjE6tZ2kpi8ZBtBffI4cF81kl4Y1/XBcV4P/q/1auFLwyZLCepVxaiQiTjlphh8AH1e1XGmWvgR6OhCeapKipHldzz2hk6gIqtW8XtLQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4973c8b-13b4-4788-40e5-08dec606fb34
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 09:10:41.9267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xekOz+bbq6gOqbJFk87b0wgK9WR5ZdCYPC9V4c4uCGESsaXhu3lyiWDXNdBvfpRGNullKa6vthfRFWx5j2P+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, June 9, 2026 1:21 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation
> when mode is exactly 4K@30
>=20
> The is_4k() helper was requiring >=3D 60Hz for all resolutions >=3D 4K.
> This caused modes like 7680x4320@30 to be incorrectly skipped, even
> though their high pixel clock (e.g., 1030 MHz) guarantees a CDCLK transit=
ion.
>=20
> Fix by only requiring >=3D 60Hz refresh at exactly 4K resolution (3840x21=
60),
> since at that resolution 30Hz does not produce enough pixel clock to trig=
ger a
> CDCLK bump. Resolutions strictly above 4K always have a high enough pixel
> clock regardless of refresh rate.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_cdclk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c index
> e4d12cbfa..1e9c913f4 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -80,6 +80,9 @@ static __u64 get_mode_data_rate(drmModeModeInfo
> *mode)
>=20
>  static bool is_4k(drmModeModeInfo mode)  {

Since this helper is intended to accept modes above 4K as well, I would sug=
gest=20
to rename it to something like is_4k_or_higher() or other, to reflect the b=
ehavior.

And please add the closes tag if issue is known.
Apart from these changes, code LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> +	if (mode.hdisplay > HDISPLAY_4K)
> +		return true;
> +
>  	return (mode.hdisplay >=3D HDISPLAY_4K && mode.vdisplay >=3D
> VDISPLAY_4K &&
>  	        mode.vrefresh >=3D VREFRESH);
>  }
> --
> 2.25.1

