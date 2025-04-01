Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A817C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 10:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C5310E54E;
	Tue,  1 Apr 2025 10:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBY0nDV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302610E54E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743501851; x=1775037851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hVQVLE2jdDWX87cWa0T8KaZnG5QISq2JCNC6i6t3SSQ=;
 b=jBY0nDV5tm7ck8DzIkdS1OYHVkHR1A+C0rsc22JtKVYGyHapyW+7ffBq
 svkT/JxymVaI7C1aFB3x2fIwxVRToijjjz2B88rdkXl6fyZsGw3jmstmS
 /l3t4bPaXs6XqZ291sv2NF6poOLnEdKWfP/a1SMO+Fp/JyJ4dmRb2lipi
 FhejR+GxMPtJgd6cAu+Yn93KMHp6rsdTSmRy7/XZcOoH4pG6hvZKMPNPq
 f4yi7n7J2P9ezQBKcQCNSRYwYeKd6BkKq6bSokrFzEjBJfOXHsiIzG8nl
 m5EvlB39dZqZJYTxJJH3kNZLfUhRY/b6noJXtDvjM6vGWMHCVgUM/Up1C w==;
X-CSE-ConnectionGUID: NQ/uIMnhTXW2dSQ1Hrix1Q==
X-CSE-MsgGUID: A9esTcu2TYmw6bXIUZls+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48609037"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="48609037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:04:11 -0700
X-CSE-ConnectionGUID: YfdVtQKNQwiEkf2sdyrq1Q==
X-CSE-MsgGUID: oiICLOlrRaC+bzHOS7F6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="163576331"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:04:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 03:04:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:04:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJN+ZTemVKPC0bXEMMmsB2t+9PFCVblPdP7ncKXqObZdxEuowmODumQGG6V4BvkdFPEYSr71MQiLt3QhwlYv5ZwrABwpxtECPpB1PSXLAqrTeeajGmhE7v4Lf49RZ4Z+ETybNfJoQ9SjD5z9kKEGYKpo1jk7Pxbb9QnhJXHSP9XDmvbDTv1ZabJzs1lu+Q82kuaSqoaIDgZOmdgquqNlLhnJdLj8YlASbr017DhX7UDaGPYreM8APnlwZtHC8o/xQIlqbuht3SirSXuv9B/7hura2EiVm9XbHEAclPTU1YO55CK/VAynCa2l5ukGQE72VD+eXBwnU9wtXPwdxTzC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki0xhf4iHHEcF4ZC15FkakLVpMT1twBTk42BiZZFWqA=;
 b=t03cj4ZO6z5/DE2BQ8c33kvjzG90oxoDI6fxTmJiReJ5lUF8ZMwwJNbXlSFvfZjyQCKczIA5YLtvqVTjbqILZchOXC4Wecq0XXqBJ6oBds62BQioiEJ0jDX2U4BDtgjUGEV+mwlo2xa8w1YO4E5tLLNegaj1VbUW6C2ttvXBOeYK3+1xWZKRmCJXbL/vWdP/vN/HMJmOsFOMrVaeap7Vd6qm2GkGSISxHFJQBBSyAbFilNaCZeGyiFuJQsdIJDHc3nUhIVhr2maoPbtMTK9yl7vnJ57GCNVzBWtYbPTk9avL02BQiZREXHvvTeBtPQh15cSOiGJ4HIr7NTHER01M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 10:04:03 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 10:04:02 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar, 
 Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Topic: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Index: AQHboAwIbvpIMtSXnUqb4PBvjpclHrOOmpIA
Date: Tue, 1 Apr 2025 10:04:02 +0000
Message-ID: <SJ1PR11MB6129B16B70FE136913766CB7B9AC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250328181055.642777-1-swati2.sharma@intel.com>
 <20250328181055.642777-2-swati2.sharma@intel.com>
In-Reply-To: <20250328181055.642777-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB5934:EE_
x-ms-office365-filtering-correlation-id: e3761b09-f4e6-4fa1-8b27-08dd710487b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/pW/S/KdEPeWgGh0bDEe3VkEyikprzPol80w9EFZWgedCU+YvOS20yi45fjW?=
 =?us-ascii?Q?yq+/LyhF0pMLfVozUV8gvUZMc9sOsQ4SfrvRRdHAFFx4Lcw+DQq6Ev2a75VA?=
 =?us-ascii?Q?Qd1xGWGny+PhGXLr0jfjIbHjfOL8Qtb5n2xKDw2voChgDOa3Yha3Nc+KXAln?=
 =?us-ascii?Q?zrin6PUdYa/tV5I4GIi46TqVfBy+G6hfJhUWEKxannGMaCy1LAU1S7T+K7qF?=
 =?us-ascii?Q?CqDufZ3JvDtDksq55aWp27C3Qi7i0CpUk51aX0RHr8M2ueliRRubKIkLk7hH?=
 =?us-ascii?Q?VvW0eMkFfGxNEVM1RRw1FWLwq/wGaoYoGL4jBdUryNqAyg2/iYzZCIuzAehd?=
 =?us-ascii?Q?fhCIvt2AY8hMvPoXnnzPmxgXxkIqKwRCgcXl5hGDh+MBqf+d2P0CfRF6Upkn?=
 =?us-ascii?Q?rl8u+nASrLYfDFs7MnvUmT+3QutVSm0/lc3Xt5kGtoMYnEiToW0W0fAK6rjs?=
 =?us-ascii?Q?rzgQ0u/5+EkSarVmawtTXb4Mc8N6Je9wNsIPtDJ2B62fWWcB1t/xZaNqK4aV?=
 =?us-ascii?Q?j8bh0YsLH2uUVugRRi+bEWWAcchP34pGRmxzz6jaOjE5ws+XfAkLZnPBiDTD?=
 =?us-ascii?Q?EE7H6AwGcH4CuMDP5OIH4Y+3WLklGwz7Gca/F/rmAnzcZoWzCMcRbKfi6S8K?=
 =?us-ascii?Q?4v5wWwvaCfNEKXK/SnUehXVVmNfJTs5JMsI3KFW9WIs+OTjat6P3fBlIK7qz?=
 =?us-ascii?Q?nIVJhxF9ZK3jBQlRGtSxPZ1oZCavFOPavjlf6H1Uy6lFOF2xnaTJMYzRfdcz?=
 =?us-ascii?Q?FeMZVgBY54Tq4x8MSLht6VAp9zGeizAtqLDDKyQRlqZuNcfJ11zR5Nf+f4cY?=
 =?us-ascii?Q?nQKvOUa2WYlmrI1eV0Wj5lAM4sDNaUXHcUD6i8giAlaxGzZaslGJRV/NitPe?=
 =?us-ascii?Q?VohN6I6YyUy/4/iDC42XxOgWQ7fMcLMwqq/RPmoLaF5DwT7nCvT77Vf+YT50?=
 =?us-ascii?Q?n4gjCCxHGVL3tjpReoIuulGqTre6LMDy1zmqAhIJKf7qZrTE0VgsmekLD6we?=
 =?us-ascii?Q?2Gwk9TkwBpgs3qMrGAxLkbZvEpxe/uBspiHnNhTVEzTTWNdSUtmlT+DDfMSK?=
 =?us-ascii?Q?ucLPj0aoS9V8giAxlfBwoBVLbuBL/8ADpVBK/FslmXOfvy/ByhxWm9mpJSCs?=
 =?us-ascii?Q?06vGtX/56x9CyiRl+PdHMJA3kSXUiaZXUOHCWNZWiI5no+kjTnauoKfCZ3vr?=
 =?us-ascii?Q?Q5XgHUTb8XwPSNQpAnUpLYQmVgBZWjJqlcGVOMUBxhN7aViD+6p7WJjj3xwv?=
 =?us-ascii?Q?AsqIMbToimF+2JaUpA7tYvCKdKXzwlk8yR/kU9jrJ7SsnWl0TN53NeTbs/tS?=
 =?us-ascii?Q?yG3Wh4fS++6jjdbVaM++H+bnglq+3JKgvh8jrsF+CItJPbBgTVMouWRBjtj0?=
 =?us-ascii?Q?KwPPSBAnIVt7RUMHTQIV1DPplfFMVTZiFY88ATIJmTusnEmohy9rI1/cmjsL?=
 =?us-ascii?Q?fFLxCvnGyUVHU8+BsoO5M8DYIqSlrcR2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wUyqh+92wFJArIqCHxG2+08FKM2XheW/v1JaYfhRmbwvlUnCADi8r37o4OJG?=
 =?us-ascii?Q?ymvE1QisfCROI8fHiUCF+dC8YEHbfTBVF5bxvTFJPowfHpeDVIlHdxvYdJRO?=
 =?us-ascii?Q?DSl7xBiqZIJIyA22J++38lclVa62++x3wx0gkObhlC2MH0jw1bY1Y/GUmRaZ?=
 =?us-ascii?Q?kd+t4MZBbgbkzMttf7rCTCZCaFD5LxvqkWshniJQ98hAV1DQvsJfJ7mYbXZP?=
 =?us-ascii?Q?fQGxHHEhFnwFESdi5wxkB6JxXDLPiW4RlDT4ZkRLukPIT5PWY3yXsOBGwqY2?=
 =?us-ascii?Q?ytcA11MMP1N439fnUFv/PTK+SEd4o4HkmbJoIkJW1dNO7RiG+4Gl5RuZZzYy?=
 =?us-ascii?Q?7j8Ux46qvjxsDbZX1tw/NZgue9NANRygUjWxsmCz1IHPh/P/+S245w8ZcVxt?=
 =?us-ascii?Q?IwQSrRysAHNLjR/oW/4Tr0HZMYpQzGAb3xnDcQDIhAP7Zt/I52VikQ8N2hbc?=
 =?us-ascii?Q?UjTcE8V8tXZuGtj+5KOjFgzXC4wU3V54rHDyPpOPR3ai2ZJ9UHF/P3uG4+xH?=
 =?us-ascii?Q?DsnCuqLFqtEMo1SZJLYoJx+Ri6vPiyN7c7H7RNDTR5iW/QLGtR1TshRZ/Vtj?=
 =?us-ascii?Q?jt7PE+sK6FPCnu6iBG7k35v9pbyI5VdCCb083chOeK8WM3uqRIAmoBuQtsfK?=
 =?us-ascii?Q?svVIWHbjmFnAbg0R1bqjOJbngXx8n/tBNe9Z2tPSNY5h62AfH/sSGx6rRe3R?=
 =?us-ascii?Q?zoy7fcsBSBNtoi+EH2/1iPJBX9EsVrs3O7/XolPhuvqSilGUYigk4oOkLQGa?=
 =?us-ascii?Q?zaD0J42lkMF27NKfnkXHSPCfJ8KjZQio5Ny+FM2n/YYSC2nulQ3Qq5nTSidF?=
 =?us-ascii?Q?Z3d5ALXMx/hWs3joO6/TuUHAHoj7Jx6HDb/DaR0LuzJovu3jACzJsBT7QQ/7?=
 =?us-ascii?Q?J3/6nKi+lg5uE9GvmlVChjeCyfm7dTd4Goim0UAMZA8lyKB4ihjUVa8DJlXE?=
 =?us-ascii?Q?tnFxcawLuC7wlrawJ80zo/puz/y2n0kky6ZZLNXOmYBh07AUkxvDuziqASHL?=
 =?us-ascii?Q?fxGj8GH0yZ7mNNGXohDMQKo9GKi3pLL2x1pqxxc0IdRJiWJczf6MFe/2fp4j?=
 =?us-ascii?Q?ENGd8aCvdeaTc76ggqpD69kcjAUiywFAHF5CPwpjJE+BjkaFjbPuplWwNLuZ?=
 =?us-ascii?Q?M/zuCgR6q9g9kB/IDLug2DXwmthkJyBLjAIxDxJol4OGBk9Qnjt8sMiLiXHG?=
 =?us-ascii?Q?Gq2diMlFRvc/z6MVIVGzAQbe5poQlaJocn7ZMZMlobOqucLCvXDB+lR2swqO?=
 =?us-ascii?Q?SsfgCfjDFarV2R38bIEPaJ/JndIQA1M0SPsiGmLLfH58EIdlJMR4pLd71wgD?=
 =?us-ascii?Q?08Dr61tgnwvKkkp5Qh+rhB2NO/PVYJlUFF1jWd5dYrUuL5TBsBuxTcZFxaS7?=
 =?us-ascii?Q?0D2NC5MaALW/5sqUJM7xXsPJZYuRHK2YI6yfFda/HTaXdtwQRrLk+eb2jwWn?=
 =?us-ascii?Q?JKSNrUaV/CojbMxTT+9wOUXFTdrSxsmjcGmHHOEZDiWXocOwecwczn3G6mzU?=
 =?us-ascii?Q?ACRjqOJvwjWfgoBPGvN6p+zArSSOiEiM1OSJ2dtbQNosPuwRD8mxuhZV6SDO?=
 =?us-ascii?Q?/oU06f3yRfo6ExfC8k0FZiGBhtdz9h1eJ/D0XM38DymoI5g2fkUg7RMB6tcC?=
 =?us-ascii?Q?bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3761b09-f4e6-4fa1-8b27-08dd710487b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 10:04:02.6495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBfX+vnDb4qOjALwIX+kNFBoLLJbBlAus+6u2TiwEpO1eOnkMo/YmFzasgfVxTxdyUFsYBKvywH0TUGDD+6HT/qOcqI40tWwBo37TwGMd3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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



> -----Original Message-----
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, March 28, 2025 11:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
> chamelium_frame_match_or_dump_frame_pair()
>=20
> Add chamelium_frame_match_or_dump_frame_pair() to compare frame
> dumps captured from chamelium. If they do not, this saves the reference a=
nd
> captured frames to a png file.
>=20
> v2: -let crc be computed from compared_frames_dump() (Chaitanya)
>     -remove passing of reference_crc (Chaitanya)
>=20

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_chamelium.c | 46
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h |  5 +++++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> 620fbbf7d..c86773898 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2070,6 +2070,52 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  	return match;
>  }
>=20
> +/**
> + * chamelium_frame_match_or_dump_frame_pair:
> + * @chamelium: The chamelium instance the frame dump belongs to
> + * @frame0: The chamelium reference frame dump to match
> + * @frame1: The chamelium capture frame dump to match
> + * @check: the type of frame matching check to use
> + *
> + * Returns bool that the provided captured frames matches.
> + * If they do not, this saves the frames to a png file.
> + */
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      enum chamelium_check check)
> +{
> +	cairo_surface_t *reference;
> +	cairo_surface_t *capture;
> +	bool match;
> +
> +	/* Grab the captured reference frame from chamelium */
> +	reference =3D convert_frame_dump_argb32(frame0);
> +
> +	/* Grab the captured frame from chamelium */
> +	capture =3D convert_frame_dump_argb32(frame1);
> +
> +	switch (check) {
> +	case CHAMELIUM_CHECK_ANALOG:
> +		match =3D igt_check_analog_frame_match(reference, capture);
> +		break;
> +	case CHAMELIUM_CHECK_CHECKERBOARD:
> +		match =3D igt_check_checkerboard_frame_match(reference,
> capture);
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	if (!match && igt_frame_dump_is_enabled())
> +		compared_frames_dump(reference, capture, 0, 0);
> +
> +	cairo_surface_destroy(reference);
> +	cairo_surface_destroy(capture);
> +
> +	return match;
> +}
> +
>  /**
>   * chamelium_analog_frame_crop:
>   * @chamelium: The Chamelium instance to use diff --git
> a/lib/igt_chamelium.h b/lib/igt_chamelium.h index d979de4a2..8882e13fb
> 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -257,6 +257,11 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  				   const struct chamelium_frame_dump
> *frame,
>  				   struct igt_fb *fb,
>  				   enum chamelium_check check);
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      enum chamelium_check check);
>  void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump,
> int width,
>  				 int height);
>  void chamelium_destroy_frame_dump(struct chamelium_frame_dump
> *dump);
> --
> 2.25.1

