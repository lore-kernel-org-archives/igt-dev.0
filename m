Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B7E9B36A
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 12:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F9410E132;
	Mon,  2 Mar 2026 12:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngVGtzyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636110E132
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772454152; x=1803990152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SuDHSSR8Xo7ZjCwcvmbtU/VM8NIDYi4abftf2Vmq0Xs=;
 b=ngVGtzyhpjpiu2V480D98FWfwjWRtMfOZIiuFJ5wtEGG6FMOcQ4uNExk
 WA81T/F5DVcBSwoP/5kk+U3XenSz7OzXeCXW5OAA8RoEpHgDSknkzq6Oh
 QiA0+fiwOAxD6LfozuyX5tiqjTWzHucNPFT/pAfYtNqWVUWZ6OYvoWPM9
 6y2yFTlgMMSNjqBOSJ250zG1ek11wDSNTemdiY9idxVtZzfj7j/FF0sHN
 zlIYpRgzgA3XtKD6JFOU0mRFTtzKlk2BcfnS7oyyyjwBeimE7h+XybF5n
 8HOg9mkSoSR54+7sU9vGXIgDyOMXggcr5BkCmwklFq3rSXsJW9pZuskFp g==;
X-CSE-ConnectionGUID: 7wVbw2jlSzWImZdTuays4A==
X-CSE-MsgGUID: /Z+5kH3CR7CYpcyC8h5YMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73644964"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73644964"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:22:31 -0800
X-CSE-ConnectionGUID: 3rfBGxRsQcm9fEPWFIzl2A==
X-CSE-MsgGUID: 55qWA4EZTCO83YYNWZM33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="221792653"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:21:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 04:21:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 04:21:42 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 04:21:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwUfCkAj3Zq5fo1VLynG80zLh7nnU5zDZim4mgi95VFiRYf+WN8PiGNaMJUHd0MFmR5wFjko9wFSy5//uYBraaB382B0iqin6dOhQySKXflYLEGBgWh4cziG7WL/h+HVus+WRA98bs5u15RjvkMlpwr3tmOGOYntp/pMT3q7x6jRrhlABg0CVkJ5edBPUMH685/attBhk2u5xkQ6piP70yaJiEYXiuitWfrxiFXIuGUPxt2PUpex4MH8yCD3+AhVqzdPj2Kihrz26X3VM14EH+ZN9uYuR7ITc+kXVdG52Vo98/BpYeYkmLVc27DOe0+vhZxA6jvK2tDhL/eLiV+Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q2PhKAfyeyLAa3jtHUL+7Tl/Z8OhDEF06EAxe6AIaw=;
 b=CWImBHjGZZD+PbZnZsC7+P1QYnSVhuzfbBe4NBm2+GS16v3x3DRhO18OhXOWQLq0JCgGYdsiFpjv4hoATXs9xbt0CfcQV+1lAE15i1nDxDxeBjBreZgn2EI0+2E+9VEREOl6jczEZvgLHjnIjZY7MG5qYwklk2bkzGXuM/up2XulelxV8YrCwltbIscZ497cHnUEEBbz1/MA9vFkl90ZPFsqw/Jw9ims0PVbVyPYAMmp56QjW97QA4Yblq1A3bcoynLx/TfTJkYHpsQgyBK8GZnRXlMp1PfkJMti+B0lOW5BNE8hiYT4NXjif378OK1j19zLHByNBKFbJPcRDTOYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA3PR11MB9015.namprd11.prod.outlook.com (2603:10b6:208:57e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 12:20:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 12:20:31 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Kishore, Sumit"
 <sumit.kishore@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test
 skips
Thread-Topic: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test
 skips
Thread-Index: AQHcqjc8oXZjEDb1UkWwb2SwBOjcvrWbJXMQ
Date: Mon, 2 Mar 2026 12:20:31 +0000
Message-ID: <PH7PR11MB60530C3E22139A4D5B884141E77EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260302112339.214912-1-sumit.kishore@intel.com>
In-Reply-To: <20260302112339.214912-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA3PR11MB9015:EE_
x-ms-office365-filtering-correlation-id: cff64d31-2154-41b8-14fd-08de78561924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: f8sJQojCeOLG/AhzSRobTReNQd1jZBY9wq+iaH5fWRh+57BmyzVOFsGiP1sflQ0pDL/AtNyFnGuhO/HIbh2IKoe0NTfzruA742jBF7qz6xnd80iAaf1m++rYyxjS1J/1BVyIylxWb/rxSvZ8DjMXQ15DGqhn19p83yNMpA1MCWqPQh2VzA4xOPvUu+bQ61PbrprOSz0K6+K3BaU91sIzpFF+M2p864M37tEYnjmNb19hhX6wg8RHm6oh1Hng9ABicJUMxTEGOBWdG47NnTxw32l0NmmrSiG0L6qcX4L1nFvMlCM/ipBvZX2cELgDzU3PcE/xhNhr5nsDE3LL6dyGwuXZedapF2wK3VWSpGU00z9i4ie3siyLdyZD4fl9AqpKAPQHKEZEop+4zNM4Te/mUFLoi4F5DIvY8tlMYg1eowFJ6U4UFkTDL3k8tVYevp3bKRGX2IHPh/l9LuHqVUtXUOJmO+5SX7jLFztkUWxlahYgmL5Tp2n7B42DxJ9MKviCEiJXtrbGspLsh0Zb/yuI49lbVqFT2cJAfki7ZxhgXUKj94lc9qFGnC9lYnhgmMnPOp6Z3zZRr6UPjJVQgYd7e6hqQYfgZeqbDk6yRqW99XPnRfnsmDIjnHI+Yy69rBWuMjLw5IacnJruv2F7ggsrrjAfY1UuMbKNPueX9uT7NuRRAubWe5U1ZZDU+TtJWEhGVZw45Cp5Vov0SW3oibL7omHfhOxDuGMpFMujRpljbdAi3uyV/oCEZ0yxQGndePepP+PK9MSG/tQzlzvMgP1nD6Vnszf4T79RRCdkbU3La2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1vkeRaYegni7Wb9KqurtYJ7KxQADHyMkg6ZNmBLTfVs6yezIUHGfIiyJrvl5?=
 =?us-ascii?Q?KPaQBsqnHLKMYmD+KCQ7eLnS85FPpBG/Gu3yPDfpReQjAiYQVQ+yvztvn/Jw?=
 =?us-ascii?Q?7XVWRMAc1WbgkMEjlIBQtLDNHNrBXsPFrhQ9DpyuTUfqy00WQ36D6YjtSi9P?=
 =?us-ascii?Q?KpisVMuZrXEBfcslAKgsEIWSVnEtvIFqlJkSW4atDxzdm2qEUFawNH5WXy19?=
 =?us-ascii?Q?BYq5CxqdHEvCCZdSnhFSEbDgfA2AkypWKAy0eDPniYd9GhawrdR43ArLwotM?=
 =?us-ascii?Q?Nk+Sydfinsb5C/eS8s4yISl7rMR9zyadsPxpnOZ7LWgEZhRs9wL/5nHokLB0?=
 =?us-ascii?Q?pDkWX+VDQ0ET6finK+lwVgog6xua5jed3iMIeHNMmfUDrUpwD7+cZpSGPLfX?=
 =?us-ascii?Q?RGfE5x9XFNUYnkDHPbLv+WMQaU9iUXDy9xppuup3mXYbft4rvo6jdT3qOq9p?=
 =?us-ascii?Q?fH/Cc/gjqqUOpQLb9+gJEakne+Fejchx6rQpQsE187a44iwZ5RmtYwn7zIKR?=
 =?us-ascii?Q?YM4Jb5h0aPxMiOIs3S6ugVsf39DxMGHqAIxu3TgGaaHZoGI4XrZ9m/qu+MNO?=
 =?us-ascii?Q?hdnCYY0rtGIcbgzzJbjEPzO0dlmtE2/7Gf4NKRb3rY5fCHOUi2yiYd/kuIWj?=
 =?us-ascii?Q?zC+py8aFwBv0wJV4M2zAjTgL9v4miyFjwyF/fevUlqUPDL5o4azj//kkHxXb?=
 =?us-ascii?Q?ji8oihF724DlMncjCPbmlZ8eEBfgTn42Ee1/Vanjo9d1Ft4wdUFgqRerJWDW?=
 =?us-ascii?Q?l4FrWQpGcOLNAsEV0zTzi4BlqOxU5/XUr50z3OQmFKjU9/PG1xeUUeqDoU6y?=
 =?us-ascii?Q?GA4bge0cJkE1hpBaaANOiLyqnvY5tI+NJnFU6CMkyUnDsl8fN9+aGswvyXIE?=
 =?us-ascii?Q?l2l5wHnRuIhRHRuXGP2r6yQU6DlMHgcdwO4vA2yChUAdmvZpV4naxiburUoC?=
 =?us-ascii?Q?LzDOoj7d4FN+o3vk+Qr4oOdGmGrcAQXV4EStOLcqK8K3lpNxf8T/gnOGgG8a?=
 =?us-ascii?Q?2esa0fxM18xkIodOfis5GReYEuENT2UtOHv6PRs1PFs74RvyeSfNGrmyqr8h?=
 =?us-ascii?Q?mqIMhqvI7HqPl1JO//9SP8gfZIeCkRNsYClQjTkUyMnzsOhWd3RPG1gH7b5u?=
 =?us-ascii?Q?8+dYabR+sxQUGiwZtyApe3/Vi0ne6PRdOxQS/eQhwbB8R7YUt6cWXRfWz8Mp?=
 =?us-ascii?Q?FU9chYftcldmNnibqKIS5hKQ0uM4GCjlcWNYhKaqeIdPyxV1h6dWkTbXTN65?=
 =?us-ascii?Q?pXgP12AjWXQiOuekOFS33ch1AXehXKKLjzLZRb4NCwmoXs4OuA8eZjtCijCi?=
 =?us-ascii?Q?42hdII4OVn8+kiLm8pQWEIdie3BbmfT4wa4uHf4p6t/ue46zn+vPHRZbQiYJ?=
 =?us-ascii?Q?SXnaMhyXGcYa7pUrRFI759R9hDq7aBoiNItO+n/5oNNraSUtd/mehsqLJqQh?=
 =?us-ascii?Q?Esn1g4veyRqmGGWOW7NwzsTYx4jL3ErK0zGvvEa9FvavIWzvCAdURnN3EG1f?=
 =?us-ascii?Q?b9YL5yW/am/5AjGccnaBRGo0AyWeTLIlqrBXk2CSCZZfbCvA1pR417S4U3gg?=
 =?us-ascii?Q?oaO+Uosm2p3+TyHNHG14OGqjKqlmBda0YMqYDbq4XTPJXSlpnXCMAO9HY3dl?=
 =?us-ascii?Q?72MKFN9kU76C5wBXtBahmK71kuO8mCCqy+8c8BR6RjOrrGHxejGHiUUb/KQT?=
 =?us-ascii?Q?keBM34Raja9ETEyt8wVU6+GHHHGrfTWvn7H3d8rt6PFxPzTt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff64d31-2154-41b8-14fd-08de78561924
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 12:20:31.7332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+bz7iocrtLx+JF5TW2xR/1rHeUtiD9Q6Uh4XEZu/N2303gmMpeV5hK7/hRPDs8Jgi97I/ELlz2vwA/J3AMvhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9015
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

Hi Sumit,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sumit
> kishore
> Sent: Monday, March 2, 2026 4:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Kishore, Sumit
> <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test sk=
ips
Title should start with a capital letter "Add" not "add"

>=20
> add debug print to display the reason for test skip
>=20
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> ---
>  tests/kms_invalid_mode.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> 5edffb649..8ba488812 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -266,7 +266,9 @@ test_output(data_t *data)
>  	 * sure everything is really getting rejected?
>  	 */
>  	mode =3D *igt_output_get_mode(output);
> -	igt_require(data->adjust_mode(data, &mode));
> +	igt_require_f(data->adjust_mode(data, &mode),
> +		"Skipping as %s has scaling properties\n",
> igt_output_name(output));
This skip message isn't quite accurate. Only clock-too-high subtest checks =
for scaling property. All other adjust_mode functions simply return true.

Imho, It would be better to add the debug message directly in that function=
.

Regards,
Pranay
> +
>=20
>  	igt_create_fb(data->drm_fd,
>  		      max_t(uint16_t, mode.hdisplay, 64),
> --
> 2.43.0

