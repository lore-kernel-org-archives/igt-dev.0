Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57616C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 18:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150B910E4C3;
	Mon,  1 Jul 2024 18:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp4UqLhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7610E4C3
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 18:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719857349; x=1751393349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eilQ64voiMXU8vhdemtyiEB+jBbje76pCnKB+oAD3Sw=;
 b=Dp4UqLhyt6MccAI8fPnJzf/3ztpsgzsSOacFJWcC1UerH2VvN5490qWy
 D3oY68TdszFiRsQWY+K99aAY8Kk92L2z0xjIgxPvM24EYKYdiXk7PlJbf
 31JaNu4++FQdIHXO5PwtJMXJV0SLL4u7Fk5HrZO/3b3BsexoUW/fjhOGI
 yyGpBppT6EA28llLLuWOxmDUpY+6BwivVQEIgnzpeu1Vvp3+1LNTycf1j
 Hfy0uB0a1uUWq2i4hYS3JEkvaaESIBK971P8Xcd0SXMMhkg+94Yc8zkTM
 cwHJ3M+rUML7f9H9Oxr+8jRSCy6iBvWtV7isY3PuljtImgdRtiWquhF1q Q==;
X-CSE-ConnectionGUID: tAhFmMr0TqSiN4tSJzzC9w==
X-CSE-MsgGUID: 0QJ3S3L5QOGBT5wuxtse8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27598995"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="27598995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:09:09 -0700
X-CSE-ConnectionGUID: QM4TKHquQWeIEsF+bJi+Og==
X-CSE-MsgGUID: b1SEZyLQSFKX3BmduWDgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76783749"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 11:08:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 11:08:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 11:08:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 11:08:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 11:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1urJtEuNwPuPHa5/Drs+UZGa6vR34ZzsFJXacdyM7i7q++x9LjQ/qOGkgfKbrj9qTtkWpyIU4m9O3tapo0xnD9QMRF9o02iQeUz9iCDZFSNXdgnPZG5/Cd4NPctfu7mcYUFRVl/bYT9MooE+XDh11X2YemAfdvMH28XJMKJv+muK83aD6J7+oTtECUKndypinOj78EKneyjYkZ7LueCvXEhsXLK4A+DIwLl/AmikMNRSCHwBATZPevZZoUNCe82yhVSSr1t5pmA2VzR32ulUiQLxB7J0lLMc34MXMxXcbb8DUkngF/ivwBrghmnFZZOAI8kX1SpaFk8UdoJY9FnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx0L39y8U7J+XSuhi1YACMEhK6NhIXo95EwCybI/IUY=;
 b=F76PcWXyIvvF2bXZBZgw1oNqBXaum4o0SOS1rI7RH4bj/rRzYQq9zu2fo8LGi7pVL1xeMObJwc/ti2XL8RLAGMvvADBq24k8INW2da89R1vs48xRdjL+PGewfLK5Wl7IsRNRKm9bixtmu4zk4Pqno3GfyNbqv3PORdTYW3/Tj805TbIFnObpYIkCeMdwSU5KpijdSH4pWcvBFx8uad+fepDH7Rfy2wYTfj8DfMtxWuieOqTsHUahnp1ALmZb/uAcEZegzY2Qx7hV0kad7zMjfMnmjud15RsbYlawqzCUP3OBV/W+aU++0MC7K83y9goMhve7P6BxRuXlykpoo89+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 18:08:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 18:08:56 +0000
Date: Mon, 1 Jul 2024 13:08:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/8] tests/intel/xe_drm_fdinfo: Add helpers for
 spinning batches
Message-ID: <pjy5cp5xx3jjgimdzpb64z3z3p2i3mlpwqakgfp4fs5o3yjjrq@o4m2cznbtkt5>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-4-umesh.nerlige.ramappa@intel.com>
 <hh7keiq3cvkqznczez5xqqxycci3yn3x5w7i6f725qt7f5fqgv@s5fbq5lqzlug>
 <ZoLnGiiGVLIeerxj@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoLnGiiGVLIeerxj@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fa7884-ad95-4ede-1ffa-08dc99f8df6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BgWjARof8zZy+L3ot8LT+WG53v3mTZ2WsTrISZhDxbRs6jjwDq8y4yzBuoaV?=
 =?us-ascii?Q?iilTrfd4hzTn6E4ha7klrnqyPVQJQNkp3TNbQUERsJ0CDoYBbiCW0f7y17za?=
 =?us-ascii?Q?klgVq4/U8u++wessWyEaUOvmVt/Fp89KTK0wAJCm+FlTZ5Xli/Tk7ycoykoU?=
 =?us-ascii?Q?rsiX4CU5CsDxXLl8q5YwrKbgTrfZDmKWKSxvfljWTAAZjL36MGD/V9nBNKI5?=
 =?us-ascii?Q?kvcVCAFqdjKRBtT0mDvetjFRYwp745U2PYrbXChjv+QFvVn8SLhxDH/Vro4P?=
 =?us-ascii?Q?GNX24rVUbtbJhMbVG4tBTeId6BAcqnTtn9hi/UZuHa4tlt5da2NHIJtuyqLy?=
 =?us-ascii?Q?jmT8cyWf1GqxznwiGXsp5fdUKUwE7vbetcpHcXnLD2RWXYTaghnx539cgJP1?=
 =?us-ascii?Q?b/h95Fq30hSpp7uQ8e94fOfYPmnNa49kdtDhMPvWvSAfg/Hlp7mtbXPx6U6G?=
 =?us-ascii?Q?Ui32WNeaE/fE3OS3//olsDKbqpMXifNcgr5AtnMBxBm8/+wrzCQQ6YN6ooud?=
 =?us-ascii?Q?TGe44gsC8CY+e26A6btOXgOi8StOsED0o8wXbAq4Sd6q5uDyDjvn+aPkBn8y?=
 =?us-ascii?Q?rReDf2YcQsVFnmeoqsQVDcGgvJgWbOxe/aij5BCakCDKfB86vERArga/xuaM?=
 =?us-ascii?Q?VqdmxsOuM8Mda8rwywSZODROLl26IRHBK3kF0YOLbBJors4ctY6TWQoPlBN7?=
 =?us-ascii?Q?pC/4RehJVahk8Huu4UqVN3sM/fitZa3HqejsL2y415eEQy2YgmQLkpIN3ArC?=
 =?us-ascii?Q?llP+SVUlhGKVbSOyzs78i4FLrydVmxD0ndZsRhiy2YZoofLRwvzvFqdcskVN?=
 =?us-ascii?Q?tcAorT7PhKpqRZVjbxJfIkvKPSY8DX1tOw3mX1PEIT89qiWtsUSwcPwoQ/aE?=
 =?us-ascii?Q?d1vIaWUyQX9M504Wv37LQlu6akudJdxdhKxjFysFr7Q8GfocFov08yGTFgWU?=
 =?us-ascii?Q?juG3lgvy1EqcKZDGhz7lO3cb3/hsi6yQj9+Tm4v13xCBeMqY+Ac+ei6s+jsh?=
 =?us-ascii?Q?pgss+w0I5zo5MVLyCHN8XFqJiioEoyau/HE2SSDBuBX58vPiaaVkIjb5k7tq?=
 =?us-ascii?Q?UW88FFJDBev8iEdsPSggoLZ4OJDTSWBHD14LmFx6szqZA+l3i2j/6Yxrd3p+?=
 =?us-ascii?Q?9MztFZ9LCE3pwbZmZKoGTECOiuXF3dcvye4lPW7Kyy2zxQsKM0Wf2Wcj9T7p?=
 =?us-ascii?Q?EMPDo24PdlAZDiizbSRgwcvV94FDkN3uCBYcVWxK6Qv0om8jvs7dkRHBDvmJ?=
 =?us-ascii?Q?mLnzJfgu+r+CqepP7cYP2HgPlq/bTMfaDzmqRuaao9EZ+03MFVp87sO6zwXJ?=
 =?us-ascii?Q?kzhAJK00NPEplIioKY9017CwkP5QVE7ssO+DcfakAsOEfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRB7w8V3Vk7QKNwSslX672d5bG4B+a+iMeXf43w3m/TfJa36J0f5baz6JCpP?=
 =?us-ascii?Q?8hxhV9lfDPy2eSIFgdsNuX1mq/6/aa88pd8xx3GZ98vYbIoMxIwTk6YYavsN?=
 =?us-ascii?Q?XbvX65WEJ04trIX1AWJ57CbpkQLwxgkJsxGhHXxuM0KYWHTKfW39YAv260RU?=
 =?us-ascii?Q?O/0+Z9daofPuC0X6IRFrlLXmPSA2xkwa+FEQxu0Gpkxg5+LRjmsyAd3SQsb4?=
 =?us-ascii?Q?mJf5D8DICcgcCurNdaw+oizWSH6q9CdrMqRLyOtgHPr1TN6NVS1aqWpVTiKT?=
 =?us-ascii?Q?xKDjIfWNeBE2xF5G3Psn/7MWABtlwBwJuSPLKtcqJCQIvQzAiRFJHuxHquP7?=
 =?us-ascii?Q?drIPnnTvf8EF4UJR3gKlfLUGtlbb8nb9ZC0H5aDI5X+4rC4gcbeicsOwWlft?=
 =?us-ascii?Q?bkCqAApl3i2bRnU2hnMHrRRm6Q07iqC/hLiE4ABogScSPtR8pqAuHCj29M0Q?=
 =?us-ascii?Q?h/rFeXcGudXzpNaPYa7EQ5q9PYRTl12ZMf5DRW2WSmWlfaU+04aeyIg5jXZS?=
 =?us-ascii?Q?bO9X495+5zlbawIxXbnkIgH+dLC0gBZN7CoW+gDHTx8PN+TkjeF1gPGzMZuq?=
 =?us-ascii?Q?hZxHbCR7yY+AepFaYOpk3R4bY56M1i3zsczM4H/kgkUjKg/qN3yNYPdTniOQ?=
 =?us-ascii?Q?a/cT4O/nGh/dqSENdlLNTrEILlsQpBeiEXMcNNg/gIFahZPiQVcdZ9fK3rSl?=
 =?us-ascii?Q?ALs7XgFX2ptN7y1D7Y0ojYsavkQ1IY1HHHjohhnpHfTIzYRAPsonKlAm4ivF?=
 =?us-ascii?Q?X22NPEbKbG7gacEYM9ha7DILfRFDgiccAg293QcfbYA6q2QFjGtBOFdNBgdc?=
 =?us-ascii?Q?+cujTXofKoL1QlJa5Z9TYlDcD+69opWiloUI9UbEt8SeWJ9DqRg/ShCE4zbj?=
 =?us-ascii?Q?ZaFvmqfd2V9ORuXEclX7EX3CSSTOvgY6ETWfS5HBgCwYzDMogDJfcZlupZpD?=
 =?us-ascii?Q?oqS6FCwKt/9G0s1loyuz8newE9ltpjEonxHfBZMw3chLzPdrJVv06h4m5hXI?=
 =?us-ascii?Q?8zGhtYtUiaf1acsufLzY5tDl1dytNy7PZPtP3uP4pu9rjfn7UoGzs63fZvZt?=
 =?us-ascii?Q?pT4ZpBoBdF3dWrc87i0D0HiVzc0n+//JpLmM4REtlLfB6IOj67ykC95t6Me7?=
 =?us-ascii?Q?G1KohbxeULWX6xuToKnduFWVyITz6I44TIQ8FE+QRNgfA3hMEP4dDLFOGNYy?=
 =?us-ascii?Q?f3vPvIN802VISqZ0NGuhZHk/YHT/Tf4m3/BwkviI2Dyc/OOVIEOmBvTICIed?=
 =?us-ascii?Q?5b1XeIsQdtGalLngI1v2kfGh2BBvrfGN12iaapV41XCtyHFrI+pI1Jpeo3/9?=
 =?us-ascii?Q?KJMCTAIujvENcCNmzjigyo7Zy5n3gdPIpiDuTQla+/YpqoUHFMYUba6s6BrW?=
 =?us-ascii?Q?lqqylkjv5dEgRVG4O86m/qfkHk8gyO8H0r+QPE5iy9Dxlrkkbq97Fwh/YVh5?=
 =?us-ascii?Q?ukPvS1Ga4TWf5QrAU0j1XitaGr3kJip/G4CEaqPtbVHrJiRHy7ylIPuGgKGG?=
 =?us-ascii?Q?NjglA1GbByzyuQfZulNAftfhpjb9rKjsQ2Bx5+iQGconXxtbMv+ivTs2+RuD?=
 =?us-ascii?Q?x25QaPMLw25DhDL0C0QtWq8kA3sRYxnh8CVlQ74J7CaIN7HM6F6NR4JQcNDk?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fa7884-ad95-4ede-1ffa-08dc99f8df6a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 18:08:56.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+OlB747XBUbFeFBq+JeNlEbVFhlsDZO6UaR1XJmvIUT8nSF4rjth7hhn55DjzUkAG5rbLIeDxZHtv7Zo5lB7oqMV/Y8jZlymblvfzwWx3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
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

On Mon, Jul 01, 2024 at 10:27:54AM GMT, Umesh Nerlige Ramappa wrote:
>On Mon, Jul 01, 2024 at 11:57:14AM -0500, Lucas De Marchi wrote:
>>On Sat, Jun 22, 2024 at 07:00:57AM GMT, Umesh Nerlige Ramappa wrote:
>>>Add helpers for submitting batches and waiting for them to start.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
>>>1 file changed, 135 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 41409b2d2..27459b7f1 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -51,6 +51,17 @@ static const char *engine_map[] = {
>>>	"vecs",
>>>	"ccs",
>>>};
>>>+
>>>+static const uint64_t batch_addr[] = {
>>>+	0x170000,
>>>+	0x180000,
>>>+	0x190000,
>>>+	0x1a0000,
>>>+	0x1b0000,
>>>+	0x1c0000,
>>>+	0x1d0000,
>>>+	0x1e0000,
>>>+};
>>>static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>>{
>>>	struct drm_client_fdinfo info = { };
>>>@@ -316,6 +327,130 @@ static void basic(int xe, unsigned int num_classes)
>>>	}
>>>}
>>>
>>>+#define MAX_PARALLEL 8
>>>+struct xe_spin_ctx {
>>>+	uint32_t vm;
>>>+	uint64_t addr[MAX_PARALLEL];
>>>+	struct drm_xe_sync sync[2];
>>>+	struct drm_xe_exec exec;
>>>+	uint32_t exec_queue;
>>>+	size_t bo_size;
>>>+	uint32_t bo;
>>>+	struct xe_spin *spin;
>>>+	struct xe_spin_opts spin_opts;
>>>+	bool ended;
>>>+	uint16_t class;
>>>+	uint16_t width;
>>>+	uint16_t num_placements;
>>>+};
>>>+
>>>+static struct xe_spin_ctx *
>>>+xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>>>+		 uint16_t width, uint16_t num_placements)
>>>+{
>>>+	struct xe_spin_ctx *ctx = calloc(1, sizeof(*ctx));
>>>+
>>>+	igt_assert(width && num_placements &&
>>>+		   (width == 1 || num_placements == 1));
>>>+
>>>+	igt_assert(width <= MAX_PARALLEL);
>>>+
>>>+	ctx->class = hwe->engine_class;
>>>+	ctx->width = width;
>>>+	ctx->num_placements = num_placements;
>>>+	ctx->vm = vm;
>>>+	for (int i = 0; i < ctx->width; i++)
>>>+		ctx->addr[i] = batch_addr[hwe->engine_class];
>>>+
>>>+	ctx->exec.num_batch_buffer = width;
>>>+	ctx->exec.num_syncs = 2;
>>>+	ctx->exec.syncs = to_user_pointer(ctx->sync);
>>>+
>>>+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>>+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>>+	ctx->sync[0].handle = syncobj_create(fd, 0);
>>>+
>>>+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>>+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>>+	ctx->sync[1].handle = syncobj_create(fd, 0);
>>>+
>>>+	ctx->bo_size = sizeof(struct xe_spin);
>>>+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>>>+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>>>+			       vram_if_possible(fd, hwe->gt_id),
>>>+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>>+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>>>+
>>>+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>>>+					     hwe, 0, &ctx->exec_queue), 0);
>>>+
>>>+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>>>+			 ctx->sync, 1);
>>>+
>>>+	return ctx;
>>>+}
>>>+
>>>+static void
>>>+xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx)
>>
>>I don't think we should create these wrappers on each individual test.
>>If a wrapper like this is needed, can we add the proper abstraction in
>>lib/xe/xe_spin.{c,h}?
>
>The wrappers are required to be able to control when the utilization 
>is sampled when a batch runs.
>
>I thought the general rule was to add stuff to (IGT) library when 
>there are more users of a particular code. Right now this test suite 
>is the only one using this breakdown.
>
>In future single engine utilization exposed from GuC (busy v3) will 
>make use of these helpers to build the various tests for normal, 
>virtual and parallel submissions. In addition to sampling counters 
>before and after, these tests will also sample perf counters when the 
>batch is actively running on the engine, so the breakdown provided by 
>the above helpers is useful. I can work on abstracting it into the 
>libraries then since we would have more users and more data on what's 
>needed for the abstractions.
>
>Right now, I think we should target test coverage now and then work on 
>the abstraction part as an improvement when implementing busy v3 
>tests.  Does that sound reasonable?

IMO xe_spin_* should be implemented in the xe_spin library. If you want
a wrapper, call it something else. Just dropping the xe_ prefix could be
it, making a future conversion easy.

However it seems that doing this later would just make it harder as you
won't have the xe_spin_ctx (that's also misnamed since it's not part of
xe_spin).

I think an abstraction in xe_spin for
xe_spin_init() + xe_exec() + xe_spin_wait_started() would be acceptable.

Anyway... I think you can keep it like this if you drop the xe_ prefix
here and related functions/structs

Lucas De Marchi
