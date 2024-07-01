Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D35AC3065A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 17:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF78910E4B8;
	Mon,  1 Jul 2024 17:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf5D+80X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1110E4B8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719855331; x=1751391331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FfqorwozCyrbW6Oh94h5FLk97sIvkW9Ldjg8q2LDuFo=;
 b=Nf5D+80XDhY1DNR5NkUjozNqub38ytJ18c78wcfN1us9Hhsez/Ru9hWL
 X3wocC6ScTK4CqUiDhXut2N4L7RecbgoB0HSLORO1u05P+8LIknWWEaty
 ijukmomywQY/LFLOOGQ4vBOpFpnqeXMrsCk3TYK0O6W54j2XYsQExoKhv
 /dG8fwrq8qAQ5elAG6icYyT3hdLPXQBbJWOl2M2Dcol91Eh6ue0JtMDox
 LKt87HdkEzUTMCmbR/vRrt8T/QWtrV9Ybv/S98PUkK18w+HS2EHwv4OfU
 yO54dTMxHNxmjCKSzTjUoEgeD9OLdqGSDFCzr8M2JKIhdAx4DdNi9ToNO w==;
X-CSE-ConnectionGUID: tEL7CH87SyGrCEh6YcKiDw==
X-CSE-MsgGUID: mocJiRDZTyyZZsq7bccucw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28395155"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28395155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 10:35:31 -0700
X-CSE-ConnectionGUID: csBCWN40TpWCPTFkmk3WSA==
X-CSE-MsgGUID: pLts4dnISbufq8nF/p1I2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45684896"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 10:35:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 10:35:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 10:35:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 10:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVu4GOJUe3WQDkMPaJo02QFk/6S/a6r0mMWAaM1O0gB5o6MJdAWf3er4ps+FoPhOvrQ8k4Q0WYLdZwQVf8x+fs+kUB7bjJfHj2UOFt84yQIy2YpwI6nbw4k9KhtB4P6eRBoNKyWpsV0udwj17uqzzVjXY0RTnjWZB3E38kB10EWxVcMzRZ0dvzFGft7dBJpYbGoRqqe24FVGBNQCIOgt/ckj0ZloYueTfvqJG4To595/tL64ehcx3/nExTEieRnUcaHekKXUAMWH7DQb9bKswJ5h8UNhyLj6VLs0zyfhBEvVO80K5v6vPPw25616Wc6CJ8mR9I8j042OY4Qx5V+3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib+aN7ifr5jvjtle7XQLmobiG8qdpki8xbKjlBswdzc=;
 b=Up6Zn1xKsgUx85QEfPa5kPiUsbMhMAbsCVg5DR1UM30Onn/hr+1nOu/kD7aVIDtZTFvaRfgEo+xjXpqCjvgHU2+XfdNfc7hhtRVxPM7h8NR741Uc5yA2WbvsQVfoFgALsb3l4FobZWem0OGke9HgRZwRbouDdxNugjRo+JS62lLFv4z42q5X8nU3t1DhMm1gsNHGnKi5iavoz2S8vKwW2rvbuc/DeYLuWEcTyafhg0kbf9p8COXSqhvEdOtca8yI0EcEKxp53gxcHtW627Dj1QJSVoxHRqKpr3QBLxXFAqrP1yb3SBSEvBA/zrLTRx9Rn4jcnScx+vYsFuFXcO5NoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 17:35:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 17:35:27 +0000
Date: Mon, 1 Jul 2024 12:35:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Message-ID: <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 9581885e-adfe-4c86-2091-08dc99f431f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NwQ8DVNGUmyRbjgjjEpacPt6nhxbym7P4Wz/CrwHHfjS/R0YeJ0L6M+RJTYB?=
 =?us-ascii?Q?PPLZ/NPeUMKJSd9IhledZuywQlG25VIrwZ1DDUPTxuazpQrMT2YOkn66rSP+?=
 =?us-ascii?Q?e5jozB6yC6ejG/wfnU1cTq05w3U3G/umEKraCgBuyzbKYUfYyFgcesvu00Wp?=
 =?us-ascii?Q?e7ViTulbCUSIMXfK/1uUJtOtdEmDlYHaB7DUx0ICsXI14UyqVIIUE2Zz2+ea?=
 =?us-ascii?Q?/VMvynTh1duHf3Go/J91AGoDbVtpM8QSvlSJp9CeZ7aBVATaNJHnzWYy467T?=
 =?us-ascii?Q?IU4E0uXExbtk/m/LEvOqSVZl2gAao7643ddXNqYDnHyw0UEcqoqXuP2kvlIp?=
 =?us-ascii?Q?Z8B3cGsSamMfS23ZjdW5o3whzy/Hz3/xX5dhLHfz9VkOfk3qPDDBOuKyqQT6?=
 =?us-ascii?Q?kBebZaVnr1qnNPo1/jOuLmJD171cXsyvxL2kEdzXOf5K1QE4IIZnANrfwY92?=
 =?us-ascii?Q?RbO5ubAVbsQKbLGcVEKc2TfTX99pAD6ZQJgOfe6OfF6hOS7fJxzLLGyp1K8l?=
 =?us-ascii?Q?BFv1m3x042upv8M7pj0Gs2pitkSqAzjpspQ8j7XFlzxn/B8Iv9GZt7ennV+8?=
 =?us-ascii?Q?C1WrnU2bb/B/6zh8RvBaipgqPyPbCWN8P3tdiJa+38v3Wg9FX7/mpu6lEmy8?=
 =?us-ascii?Q?W2lQgLv9ri20q1OkSlTl1s/8nLtmU+XXnMy5PwNJ/Wg/tdqNRZJxgT+m9SCf?=
 =?us-ascii?Q?qJXzaZAxY/JuOGn7TJB8/1T20zkRghKNkXhdKtQFyIY1KB8TBrC9ZW7QeEvf?=
 =?us-ascii?Q?d/XKivf1Qp5J/fzod/LWtEZi3x8tkm+7KTbEuGaNN/rKl8ZUatpiRjowycsv?=
 =?us-ascii?Q?QZwRU5VmDgZBAgpB7c7XvHwuZ6dU/sozwdkW9p9voHHnf4OYs1FvAR5neNAO?=
 =?us-ascii?Q?ikDpi9Zne0RZkyfPYbBYekcYG64VHsb9uF5SJzcOUtPwUGSlUXgSkWgAasOd?=
 =?us-ascii?Q?tHnNB103NaDCV5QejIviY6SchNQzECQYC1g1Lk+wQMkBlGKQqa2V1lXsa6uB?=
 =?us-ascii?Q?LVx+ez4NM2xV8JBPB9jG2TnDGz/kQfxcl3Nglb8O7y5Vj3iHZTCrPzQbX3al?=
 =?us-ascii?Q?BWBngmCmP87Os/gPvelweY3V0etKDXTG9J6iUWK21r8yBYJEFVLQXND0m49q?=
 =?us-ascii?Q?Rk/gOroHJmz23+4rvjw4a3yDSyz2l5MBUcergECVD+06tcd9kDjwwXbH//nP?=
 =?us-ascii?Q?ZX7TsUDiPoX/1S7BLDyZi21m4IWPFL6t22SwUjO7RuwEdL8tVHfapvV9Baye?=
 =?us-ascii?Q?11A8jsSN0rqdH8zD7/mwr8gNnyDQhCE7tOhw7t9Xx0OkxF//ZOrW6DfOw3Nq?=
 =?us-ascii?Q?8GLE5xwOVsoen+Q2pq+vpTXpccdoq6Tm+2r/kNiQVjxYJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wp0x07iTT43eFEaUGAgfLZ7HcqKdnZYPsZ9eBksXU1y2/7OaRgkCiSkMxgMG?=
 =?us-ascii?Q?/6/+jjT7PEUaCZfp20aT8D6Mw1WeomzjjVbu+vsXIBUIdf29SfdKmjem2wtj?=
 =?us-ascii?Q?Hq4PTB9Y6uzlQyKlKzIdLRxVxVLUcqItUw1PgCqofwaQfFLU5m1I71AQCZhg?=
 =?us-ascii?Q?K/r2D7LHsu2aTwFxj40aJ/rtfC3xpdYGlsO6rfIkP3yZVU6gXUHYayZpWNz8?=
 =?us-ascii?Q?qhfmKvZtX/iHXNIGt5bIX/Qcmfqlsobyrc8+FXPhZp1GRWDChdMp7bAMUzlP?=
 =?us-ascii?Q?VZQyXNchnF3rPXbxfRBSEm3x1j5mWWMABpjU9kg7TIZ6ZkPghAroOiU2h6VB?=
 =?us-ascii?Q?MVGpifWqUdylCDKb3tSnSwGZ9VX4TPURXKLasjFG9L2f1AySEHOj/av2Opuy?=
 =?us-ascii?Q?Kg/YN+AE9PWS57R05kEhROC4SYzuDfsMgJx2lYfFMJlYnhIEXyQW5aikHLcq?=
 =?us-ascii?Q?A1JjTsXcaET5v2PDJ9VY6LAK4dvfTc7RDBX6vIuw4Q4FiJqoXqrNYMHnrX7d?=
 =?us-ascii?Q?OS24dPFTc9e6Ur8QsTPi3nJ/welKG+orpRo7Gy/r3dD9l3XSiojm03PYH9SZ?=
 =?us-ascii?Q?LC874ZIm/73ptnB1yt1o441lVRd740T0ZOZJ2EgCoBdMshJWmITms1t7AW10?=
 =?us-ascii?Q?SUogickwe4emrDaErt1Lx5vILI3Jgs6+dPmdphSBaYKWjL15ZS/Kn0PfGiLy?=
 =?us-ascii?Q?Y9g3kNUfB4X58JXhUQLbFxRrQ3DLIYOUwoNMa+hugugW9T8dFnclbvJ8Ex4E?=
 =?us-ascii?Q?cg62PHHGdJ69mFfnGEQlt5t3Ib2LN9e69IPbt7r7twXYhdgFRFW3UTZ4lc0t?=
 =?us-ascii?Q?jIWQR9tKFQIraUC75ffCLFz1JXRG5HXnz94TZ5dPKdSELOZwUw021Q7GNqkv?=
 =?us-ascii?Q?vr33sIdSckMnxkU3+MOk1WpO9CVD1rZjBWIYYlcTKHEEaTAI3JJ+vpiuLOCR?=
 =?us-ascii?Q?cMrPc0PkRUXLwre6I8w3KW9z1vgzejm7vkAKO9LbEy92e1EnZ1CD1R7FnVut?=
 =?us-ascii?Q?6Q462cCNzQ8FHw1POjmM8wqKPcs6DFD2htuMLBWdhVWDslqU8ywK1cHSSKIV?=
 =?us-ascii?Q?r2LaVwS8NxkTeIYZISkA+gVog5W+yDkTScfP3t9fI3KA1qgBLNK40ABrQr7q?=
 =?us-ascii?Q?kA6YBe1KecjrsAR0Gh1MuQ2NKAej1q4H5kYO+5ehmJV1rYc7Bq/37clQJu+S?=
 =?us-ascii?Q?zM0Oq6P6RlGDN0fZ8VPx2VcHnjA2H4yTyOypcKweQnGNRoNLg4RIT4omzinT?=
 =?us-ascii?Q?i044GiN+FbPmLlpnO3MiFY3GNy6zZIhI+xyr4HkfnOVBQH3ZcevXzy1jqgig?=
 =?us-ascii?Q?H6gBSEQUStFMk4gt8E7Z4wrU5Cm7oGyjO2TjbjctwgP1JqEz0aTP3PkDQKXQ?=
 =?us-ascii?Q?AoKOdv+c6E2V8ZZQCb898bhF5B7Z881+WTNxXl/ZKApq39okgGxkoAciSOOA?=
 =?us-ascii?Q?XHN7ErB/ILt7fS6TGIxqeGWrRPqNKO2YNGBR0/SOPk3mYSbSzZdfDFNaVu6E?=
 =?us-ascii?Q?G7bL0ZMkDva4Cz+HgsJA8jRvhFrgbHVj+oA3JcpMbmfIbqfEhmoQHSjY4UlJ?=
 =?us-ascii?Q?/mFLMU3NyJqR5bRf8zhyp6uQ1vvbrQKmncfUNmptScf6/xR2GpR+flvpNiD9?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9581885e-adfe-4c86-2091-08dc99f431f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 17:35:27.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1q006I6q0yr+8o7IUcsOsnGlAG/H7MAxbdqI48IQ3Kg7F57mGRwkMz+i9Wt+BrlZPl4rJrV4WVXb8TxHtyN4gW4hDtGRLDIrziUnujmWDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

On Sat, Jun 22, 2024 at 07:00:58AM GMT, Umesh Nerlige Ramappa wrote:
>Add simple tests that submit work to one engine and measure utilization
>per class.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 109 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 27459b7f1..852931d71 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -25,6 +25,15 @@
>  * SUBTEST: basic
>  * Description: Check if basic fdinfo content is present
>  *
>+ * SUBTEST: drm-idle
>+ * Description: Check that engines show no load when idle
>+ *
>+ * SUBTEST: drm-busy-idle
>+ * Description: Check that engines show load when idle after busy
>+ *
>+ * SUBTEST: drm-busy-idle-isolation
>+ * Description: Check that engine load does not spill over to other drm clients
>+ *

can we split the mem-related basic check from the utilization-related
basic checks?

>  * SUBTEST: drm-total-resident
>  * Description: Create and compare total and resident memory consumption by client
>  *
>@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>
> #define BO_SIZE (65536)
>
>+/* flag masks */
>+#define TEST_BUSY		(1 << 0)
>+#define TEST_TRAILING_IDLE	(1 << 1)
>+#define TEST_ISOLATION		(1 << 2)

shoud we document the mapping to the subtests?

>+
> struct pceu_cycles {
> 	uint64_t cycles;
> 	uint64_t total_cycles;
> };
>
>+const unsigned long batch_duration_ns = 500e6;

please use * NSEC_PER_SEC

>+
> static const char *engine_map[] = {
> 	"rcs",
> 	"bcs",
>@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> 		pceu[class].total_cycles = info.total_cycles[class];
> 	}
> }
>+
>+/*
>+ * Helper for cases where we assert on time spent sleeping (directly or
>+ * indirectly), so make it more robust by ensuring the system sleep time
>+ * is within test tolerance to start with.
>+ */
>+static unsigned int measured_usleep(unsigned int usec)
>+{
>+	struct timespec ts = { };
>+	unsigned int slept;
>+
>+	slept = igt_nsec_elapsed(&ts);
>+	igt_assert(slept == 0);
>+	do {
>+		usleep(usec - slept);

mismatch between usec and nsec here in the first sleep. I guess it's
easier to convert the arg to nsec and then always have the same unit

>+		slept = igt_nsec_elapsed(&ts) / 1000;

NSEC_PER_USEC

>+	} while (slept < usec);
>+
>+	return igt_nsec_elapsed(&ts);

wrong unit? you receive usec as arg and are supposed to return usec, but
rather return nsec.

Also, I'm not sure why exactly this is needed. usleep() from the C
library already guarantees it's going to sleep for *at least* the
specified amount.

usleep(3):
...
DESCRIPTION
        The usleep() function suspends execution of the calling thread
        for (at least) usec microseconds.  The sleep may be lengthened
        slightly by any system activity or by the time spent processing
        the call or by the granularity of system timers.

RETURN VALUE
        The usleep() function returns 0 on success.  On error, -1 is
        returned, with errno set to indicate the error.


>+}
>+
> /* Subtests */
> static void test_active(int fd, struct drm_xe_engine *engine)
> {
>@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
> 	free(ctx);
> }
>
>+static void
>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>+	      int class, int width, unsigned int flags)
>+{
>+	double percent;
>+
>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>+
>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>+
>+	/* for parallel engines scale the busyness with width */

s/parallel engines/parallel submission/ ?

>+	percent = percent / width;
>+
>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>+
>+	if (flags & TEST_BUSY)
>+		igt_assert(percent >= 95 && percent <= 105);

percent should never be > 100. Also, for >= 95 to be true this needs to
be the only client.  Should we check for number of clients and skip if
we find others?

>+	else
>+		igt_assert(!percent);
>+}
>+
>+static void
>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>+       unsigned int flags)
>+{
>+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>+	struct xe_spin_ctx *ctx = NULL;
>+	int local_fd = fd;
>+	uint32_t vm;
>+
>+	if (flags & TEST_ISOLATION)
>+		local_fd = drm_reopen_driver(fd);

so you have 2 clients in the same process... Maybe add this info to the
subtest description above.

>+
>+	vm = xe_vm_create(local_fd, 0, 0);
>+	if (flags & TEST_BUSY) {
>+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
>+		xe_spin_sync_start(local_fd, ctx);
>+	}
>+
>+	read_engine_cycles(local_fd, pceu1);
>+	measured_usleep(batch_duration_ns / 1000);
>+	if (flags & TEST_TRAILING_IDLE)
>+		xe_spin_sync_end(local_fd, ctx);
>+	read_engine_cycles(local_fd, pceu2);
>+
>+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
>+
>+	xe_spin_sync_end(local_fd, ctx);
>+	xe_spin_ctx_destroy(local_fd, ctx);
>+	xe_vm_destroy(local_fd, vm);
>+
>+	if (flags & TEST_ISOLATION)
>+		close(local_fd);

humn... it doesn't seem this is actually testing any isolation? It's
just reopening the fd and testing the same thing on the duplicated fd.

what I'd expect of an isolation test is, e.g.:

/proc/X/fdinfo/Y
	drm-client: A
	drm-rcs-cycles: 0

when executing on another fd:

/proc/X/fdinfo/Z
	drm-client: B
	drm-rcs-cyles: 10


so, check that read_engine_cycles() returns !0 for fd where you
submitted the spin and 0 for where you didn't.

Lucas De Marchi

>+}
>+
> igt_main
> {
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -485,6 +582,18 @@ igt_main
> 	igt_subtest("basic")
> 		basic(xe, num_classes);
>
>+	igt_subtest("drm-idle")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, 0);
>+
>+	igt_subtest("drm-busy-idle")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>+
>+	igt_subtest("drm-busy-idle-isolation")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>+
> 	igt_describe("Create and compare total and resident memory consumption by client");
> 	igt_subtest("drm-total-resident")
> 		test_total_resident(xe);
>-- 
>2.34.1
>
