Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50789FEA80C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 05:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6C10E79F;
	Wed, 25 Mar 2026 05:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BclQ+RTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3010E78D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 05:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774417753; x=1805953753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n9iVBD5M8fFUxPJs4qGEL7V7Ky1S3HohfcZ4mk/TdP4=;
 b=BclQ+RTkrYpTVHw8PsS567tQtpI6T8RJ2MZEWufS5nhSwcnV6u4qQWPg
 Ja/xMSJ4rxlB0MXSheO6OY0waBvv+WxdoQmfOLJUVWoYYnu/tRhatlm06
 fr1lRQwllBQyeFcVSaC+dTBjRjLw7H+GASX7Wbe6GuMdBVGZQFWcaS9Pc
 Sv6p7WAs6naEm+mOhqy+uk045kVDMoz6fMfMbbrJvEbXEtDNSEcVGvLHH
 JEOhZ6DlnjS1TuboMdEVnfUR40Xl7gApXxFebAWI+b0iieF4YSXw201qs
 +/oHE45ZmbzjJPju8ylE0Gw06Hq78TS9DTOgIbGzn3Oa/La8DzrYTOzb8 A==;
X-CSE-ConnectionGUID: zXhHZGn6RA65L5hFncpyxA==
X-CSE-MsgGUID: htlg0LRwQSqpDrgYKbX3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75351148"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75351148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:49:13 -0700
X-CSE-ConnectionGUID: XE9q6mbtR9q/gn6aFRTo6A==
X-CSE-MsgGUID: GX3+PH90QgaNZhiyfyWTgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="223774181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:49:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 22:49:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 22:49:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 22:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRKTG9hY2i3HLmZlEoUulxX+mQ30tebPWoTgsXIGesJbADyYGICXFS95os4bLfzZzL6+v08mTNN5kkRBThu4a2tmOCQNYkT0zB2p98xmL5Rly8/TyrNoYJN7b6GMYfB76xejcbJbabikytJfbIWzmRn533iFQ4sUFmZ7WEqSfFfQBlfoCynAVPqXsArSA79ea6paEsjOGd3xDm347lVT9NMRe50ev5meGfRTev9L2B6J0gNjsUo9Qx5b9QROs9n5ZVXzTHY+AnVY39fbTmBxh5WWNnlNwhZvQ+Jg+P42na/uiQJxEx691DPQ9YdJW+3FCbVz8TE9XEHNFjVxr6qcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtcRtEdNz96hybcEGVXEVXFxNr5qNM/mNHvyxX1QDZc=;
 b=HL9Bls7jsxABTbI0pLhz6KY3Q9zgYdfLRKuqo79B/nf8TMAXrrv/YPsBlUnbD+7oSWRsX2EwIXVZLqmYI0kIkOM+mNt4jYE5wRIyXCU6ZxHgUZidZJI+JfONPUAcoScs099NWp/F470Yp6919tK66PJV3yj1XeXEfvp66kCqdEZd9wvT8HgNDlQ/xdNYGQInhQvf8fuZdY6b8Ho7hjCLTgl3mfFvYBerhIr2DB6NKt1qHlpjMJtGWg0rD7SfVKCsXMWAAPA6Eyi9HwMtGqGKMVh898m0w3NIwHMwLIPbms/BjH46835GcvE7X60ld/raZChn+CET/7eXh7KEzEI+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 05:49:04 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:49:04 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_async_flips: fix timestamp print format
Thread-Topic: [PATCH i-g-t v1] tests/kms_async_flips: fix timestamp print
 format
Thread-Index: AQHcu2cWcl3PSN1IhU66oBQehbgcGLW+upXQ
Date: Wed, 25 Mar 2026 05:49:03 +0000
Message-ID: <PH7PR11MB6053203690693522AD23AE8AE749A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA1PR11MB7697:EE_
x-ms-office365-filtering-correlation-id: eb758a9f-6f9a-4e5d-c0b0-08de8a3238e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: oFy6XM0g0qAeNfvdcG29uk0Kei2EoD0GlW8vgBRf5xDHUupFGMsEsEkRc2cpspahkjdC2zOh8coHaZTW+cGuTbARLyIw3BiGfFSYEX2faIlBCi6EnEvHkQCxtUp4qbkx8YkG6+xl0aHoT9J8oUG5Zy27zu/fv18eV5gJsQi6gF6hXgcd5DudehrnCKcHLItHF9rO0ejcHjh+L5I45mImiO0hB7pXa4p/Lf9jEYjdQ7rrW1bs+LXsS1Xj0TGfZT9k8OcZd4TIY9kRYr9MujpW6bjcIwgL4admCozUGg4eKXvHV4vvfY5kV3y4ygs0Fge04hNKbTw341QFHY1fcOyL0ZwHEyddrnh4z/kyJluoD5Le4JUINenHnCsIu+LPdrnsdrnIwPIMcCokpN3xxh6orm380p71pBHJf6/zRlM2N9/kkDccPqOJlGab8QbkQ4cqaax+W8deYkCIUxdRPkAjCvVee9kp1mY6yHQRHxtE5WvLi2gJsQ4WfA/6oNdi+0SQJNRwV2TeAHEP2i/P5lWDCtZHAeGaxG1y8UBFmrNR7RrGyCnCd2eIVjdNe+5AA5BQaSRN0vA02ydOXcl5QIDXUFhF6eaf50K5+qWh4QqoQGXSv6hNROb9VuhmmV9o1fJPYBZG+jvPNAHqRcgudTfkC65kH8dl/hqPAhoYYfE9VA6dpm6CbECeST6M6X8hkFxAGZ/f1kFm1vz5GXUXp4n/qlBXW7Zi0iibvsqtHPKzPF5lIZH7ceEIpBOQooiFf5Dn5q072c09vaW69Il2r/4mAnXv9auLQL9HkQTZEZhxDlg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RL74dXnAmxN0xufsUR7Uj3XFhy3vXWs0etuIpM4DUYu664rv+Ow/KoAzGQuF?=
 =?us-ascii?Q?Atu+iE+6H3koYaGWaQ2UoXi6Qio5RG0BVV8/P1JrF1/9brLhkmBcyfh12FVe?=
 =?us-ascii?Q?Gs/t6YIFUi0GIX4ZGowOC0TZ82VxAPSv+jKxHyvCv2AUEwriQ0XzWLuiDn3a?=
 =?us-ascii?Q?GOJfQuLOSGm+Cj4ymRMw8kFnRveVX5xX5FgdseMIxHmNSNuDP1Vsp50PWYrB?=
 =?us-ascii?Q?kfKTOEo5Ekh7sH/GE3PXvcv0bHmdPd+KVimYM0yY59FYNnLLCk2doyeDls7W?=
 =?us-ascii?Q?YowzlAGAjdNqDyT5XoxQ+cb9dn3vmQcSuTaDhDJq0AUSQ4h5pMzXXG/r8FTP?=
 =?us-ascii?Q?NH5V/T3wjxDkf40WDEaxzuVo1EGXQgF+o71y6iqvk5eWrdKa2lGuQloRr8B1?=
 =?us-ascii?Q?SXYhxM7/rbjkxA4gnhDiXFiusvrQve2Pe03xe3g4ulWmDQ0ih1dMTkdWFr1Q?=
 =?us-ascii?Q?J/P2F8DX1RGtZOw/R28wwWuo9IRDPZFtNC78IhBKkth83S1iwnegW7MVIrcy?=
 =?us-ascii?Q?izw3L36OuLM+haWs1UAOR8DEMyUSzcoWZBtWoWRi34nXupWziPGaDonaP2e1?=
 =?us-ascii?Q?Z6/xVagfmseAMQjJMA6I8jFn2aw2jzf5SipJIaA6F2wutagM2h0t+7NoaGAU?=
 =?us-ascii?Q?N+xtGeFzlW8ivm/4Qdo/mWP6s3Ueh66NCFKF/dPDxUR2onnUfZw2FWqGH1ZC?=
 =?us-ascii?Q?KryDg8JEud6sWw8YTIzaOUYPIfKPSh5tUXyxUus+67X7gRfRkRpVUP/5gKAa?=
 =?us-ascii?Q?RME0TxuaIk3wqGnst9uezF5J+sEH/ywj7rDv0JZzBNi7ewkWwpStf0UGSWB4?=
 =?us-ascii?Q?8Tjh/RFUswVolPz9wU5FPyIeHsS696kRoRQCYx02A396TeRHjaNDX/C3qIpa?=
 =?us-ascii?Q?iRYPtb89di2Qj11/M3QjnZkMr9+6NgPc7B3QmAHyfmBXtXnfzSMHkIE4HKms?=
 =?us-ascii?Q?1eLUhM9Ut6acqExuTjRbiBhTbj29LdzboQvwqkPfpQb9SRJfLvH4bbvK94LL?=
 =?us-ascii?Q?U10K31fx3S3Gc7e3EnL8WxPQgR6aWVvp5Z330B3ZZMxt8L+rgN+t7kWuF6KN?=
 =?us-ascii?Q?/GiZfFWQsXHrv0RUWenqc2Kw0y0Fh98rKywMJNDriXEbSIys8Lw6IAp9LNiq?=
 =?us-ascii?Q?WH7xQgTW/0aoQNGZJoyrgdAEvo6GUCtHovAp3waLX3Thj7Qu84C57atAk0Ue?=
 =?us-ascii?Q?nm7GZBy7jiuv8uz3QD/bGCwksswwZ38p9IaiJz/Vbn56W9GzmexkSKEMSA+w?=
 =?us-ascii?Q?rKnxOBJglj3qoiQTSkAs8kE4jHWooEQz4fiinlS1l1dnl5qnoS6XNRU2Mgmu?=
 =?us-ascii?Q?HqWy+ugErujWibnLdiXAQ8JFS2446k5u/D9P2uldETRPRcXzZcMxZ7cCPsxJ?=
 =?us-ascii?Q?s/RFsI06UOOk5teQYXXWLF1wRPOEGxJCjW/0kirAZgvecw8P2Ub9rpjjQcen?=
 =?us-ascii?Q?eSPh3wJgPVmIwFIpKspseRwqpZbs6kV8SC0UEY2PPqRxfgFJRJY2enzkw14h?=
 =?us-ascii?Q?WOig7hLyIAocZHUxusuaxJ3DGFjULC4Cc/9GVrs0ptctNeJQ4dZL4+TwtEZp?=
 =?us-ascii?Q?WQfB6s7AxVe8+LSp+IwrN1GxYX1qubla0etPQCTyaTtd2gvotFPPh6e1QjGZ?=
 =?us-ascii?Q?scBO4uK+obpclfjqOFZqUMWnbYzeS9IGGC8+eDsd3RW4mcks8A1WsXIEK24E?=
 =?us-ascii?Q?y88py6T5mBINrVh3BBtCuy5kyM1UStq+oAUQRcyx18XhFkAnVFF6/1sOsVJJ?=
 =?us-ascii?Q?ejxGUD4iXw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FcS5BkyBYSmWCJ87/2g4yoRPRNqtNYefZKtYSw+DGNLsZaqFsYR+WTGC8lRy0ctzrtqhyL/cw8nzlFINKrkZZQmk3EZwmg4+ApirpI3/Yqsfmli84kNGLremLNLxonDF3E8tnSenvNhVCz7cfMjOq0dh1cdsb0RV7b/v0u7+K4Y5cUvB5gm/NC6MXkfsp1+JxK/8WHwMkW+EWCYHFX2aTVPwA8ujTmJeVGf/4QJ5Mp3h+Sz+C0yvpvwlHjhGbNGNWoblRGQOZ2k9AmHjSaXYhF5+jKl+HpgGLNGATjWkqJbWoAB52Ni0ebTpqsiyLQ4cpIDqIhwTj18ZKgJvdMOb1A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb758a9f-6f9a-4e5d-c0b0-08de8a3238e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 05:49:03.9926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+Rin9gL5A4tilRz0KnWRkFgjfZ/WQrY9nyPa1LUysu0rByaUnmOYaNeTv4eg+loenwykbX2GUuq/kR4kq8VYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
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

Hi Santhosh,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Santhosh Reddy Guddati
> Sent: Tuesday, March 24, 2026 1:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_async_flips: fix timestamp print form=
at

*Fix

>=20
> Update timestamp print to use unsigned format specifiers.
> change from %ld to %lu*.

It should be %lu.
*Change

>=20
> This changes fix the below wrong log formatting.
> (kms_async_flips:16619) CRITICAL: Failed assertion: seq1 =3D=3D seq + 1
> (kms_async_flips:16619) CRITICAL: Vblank sequence is expected to be
> incremented by one(-1572997043 !=3D (-1572997050 + 1)

Commit message can be clearer without this log.

>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 4a2930968..38de4a5e4 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -599,9 +599,9 @@ static void test_timestamp(data_t *data)
>  	/* TODO: Make changes to do as many flips as possbile between two
> vblanks */
>=20
>  	igt_assert_f(seq1 =3D=3D seq + 1,
> -		     "Vblank sequence is expected to be incremented by
> one(%d !=3D (%d + 1)\n", seq1, seq);
> +		     "Vblank sequence is expected to be incremented by
> one(%u !=3D (%u
> ++ 1)\n", seq1, seq);

Here line length of 105 exceeds 100 columns

>=20
> -	igt_info("vbl1_timestamp =3D %ldus\nflip_timestamp =3D
> %ldus\nvbl2_timestamp =3D %ldus\n",
> +	igt_info("vbl1_timestamp =3D %luus\nflip_timestamp =3D
> +%luus\nvbl2_timestamp =3D %luus\n",

Use space between value and unit for better readability.
Prefer %lu us instead of %luus.

Regards,
Pranay

>  		 vbl_time, data->flip_timestamp_us, vbl_time1);
>=20
>  	igt_assert_f(vbl_time <=3D data->flip_timestamp_us && vbl_time1 >
> data->flip_timestamp_us,
> --
> 2.34.1

