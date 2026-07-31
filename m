Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F7C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 09:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BA210E1F3;
	Fri, 31 Jul 2026 09:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLz2VElY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE6910E1F3
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785489272; x=1817025272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/+hmD2Tt4XSVGthoDIgeoa7CXnQjkmUbKL2LcY1tb1s=;
 b=LLz2VElYH5/Bv6okbBed/jMQ4iK244fnps7anzGZmcmEa0B9kO702N8n
 06ISYrFHIrP4/FatjykHSjGZGdevkO61yjDU9z23ggcGBi06/+sIECF1d
 dKcA7ve2i7P5gbEizh7uD4I1xcHX64ZA+yH2qhHvgVYgUmRLIuKy6WsbM
 7OdoWGuGLxDXxU8KGlL3B9Yr3Et6zpkeL4MlwItg6RNVeJ8WZOw/wXcnN
 lWsJAGSmMZl9etkao/ZkGyEHtJHKe3O0EuzyPMsKtZL7qfGfNEXpJ9ttl
 Lv3GNiE7RhlNePbG6ntRhexk88ZalT57Z39Kl7ONl3vpAmIIzhg1Ginhw Q==;
X-CSE-ConnectionGUID: uxAd6b3WQquOkve/IVi+Gw==
X-CSE-MsgGUID: wBiEH3QrQ0uzbUXjJN9zdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96701372"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="96701372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:14:31 -0700
X-CSE-ConnectionGUID: 5MCGkLTGQzK4PnJ07VB3/w==
X-CSE-MsgGUID: BVjE9mJLS4ybMBt48azFeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="261141170"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:14:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:14:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 02:14:30 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4gVVRy4eb4VjtnxRDhNhV9yoWl06njYIuII5Ruz/4VAMmDI8Wjpcba2wuFhmaPnalO5o3oRI1kmjrB1FKCeMbs648dxurQ5/uTNUMjuQUyyN1LdCFq2jEpgb+wnROHWzEKtLnbUXxag4nj24oPBQBAlHgklAATC8SaB7F94IldUKts1FGDT9+OlLMepZkf6/C+cbG7uSWycez/d+3TkjyDK+OysTzqORnghpxcwNW5m/clw5r/7u3/SHQJoU+zuTpIF+NlT27aSy84np0YmD/2aFdMQ5K5UEWuBJ7+sNSupSXbQg6C/Xa8Q3LA7m2xKaCuKFCSdkSWpwITCZX2Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qiTST5WKnq/8y8wJHlfG6NGaveqbeYx4Uc8AgeuN3A=;
 b=Dcjc7YcbF36gPoGJkCXzH6bZ0RgtfBcnZLT4uK36o1m+l0xUqZAMLsoZVI0hROPjh1knPVXstHCe2ZLPcm+7zk/uwXZibzVJj/wnSn8KeE+RQQ8qnkyzG1JePzXS3Ujqnh3w5DFrbvoVDtR+irZAEj/G2+O824gxF6bSycSMIVbm6zH753IgJ3vPqTzqn+7fVcza3fePjWW1a6C7ivkUBCWmN+OwIb7KFzTFUvb9cw66ZdMJZAOTA4tudk5XqDYdGxbIXrMMg1WXgc8HR0ZhWS4latrLdyvGTrWiiJ6ldAQfRjx2/z/cJNQbGqTUg6O3lWMs5AZpWI3SRlEf/dauCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS6PR11MB901434.namprd11.prod.outlook.com (2603:10b6:8:528::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:14:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:14:23 +0000
Date: Fri, 31 Jul 2026 02:14:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] tests/intel/xe_exec_basic: Add timeline syncobj
 exec tests
Message-ID: <amxnbPvazpIPZK6z@gsse-cloud1.jf.intel.com>
References: <20260622122009.3350724-1-jan.maslak@intel.com>
 <20260622122009.3350724-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260622122009.3350724-2-jan.maslak@intel.com>
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS6PR11MB901434:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dba067-ddfe-4dba-30df-08deeee41c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|4143699003|11063799006|5023799004|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Bg2HBhWV+cAPTz9yqxcMtvspwiiXLG3NyWa34bwwzpcoIYmSOeEoyiYvPpMgD7FisNS3NwViiuLXAANQyebqbI49CuYcc33u8thueXze+hvQ9umfV6XVo0bM3TmwC5FwyTRxlvDYhkXK92oCgt1sElf3bowKlRzn1rKLKUpm8VFcRyjnUpn9o+7nQT//8aMEWLD6oiOMsxdvAi3exqml8ZOE1onG9mpn9PogJDJuT8S79BJZgKkbHWUHCjeVHnGPfb1S0WWFRlo5QP01LKgIpWBM/MYm5oD1s1iRdz901upi7XFMl1ESrR+G/Tq7NucnaO1NHHeiUECWt0jONmcD5AFDzislx//dNGRgwhP2eWGVjGB0pBJsQs1IchEySB/knhZG+D/7hSvwuA7W+zQ3QDKstjw51hjy6zx9G4S72pTgDyS5/hjEpVATP24PmI6AwqFdvz084GHv1kwFRAIVCU0nEHpLiu92JnQDZd99//BsnF6sF8T/gRiyJF8AQKvL7j+HRZg0fIsJgtj9nrs8UznUWyePpReR5ceiFAEemGJxBSaqD43WpmjD0JYE6TSdK+d3qJhtmbvS8zqOrIFOVVj4RbKb+8QPx+Yl8BOr+0RtspaxImblIgU7Qd//I1ZJM1+KTbwYUa6NptbMwbmXt7GptknSpqYbt0bBds2k0iw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uY9z2K/MNMG8Ivzs2AbfmwC21U+JmsvBjn9Mu4uKxaKN8yinvHq3/noV8FOM?=
 =?us-ascii?Q?oIf1UMv9taQfrdBRTjdrpj58TGybEgxf6MToxu38GSpdiCcUrQJGe4mmXdlO?=
 =?us-ascii?Q?Knb+PeZXrmApsShGIAt/AhGZWsr44of2q98jTGAQYc0f3u/J0ChbLGY0KcE3?=
 =?us-ascii?Q?1tdhN2RhzkXV8CI2SGve+49bHDk3SK+A2Dy79NgAU2qpWkVFcjGPk4EHzSNW?=
 =?us-ascii?Q?iY8UyN9w3J9CTgDCHE/E3aRAnr94FBTxBqeeCJ5Q0iJeuVunZz0JkZWKicIW?=
 =?us-ascii?Q?LiTd6c/AM+aK//ka1jXxoMPBq/rauhuiSQ2MIn/M1X3i5LfDz+l4DxZB5nIl?=
 =?us-ascii?Q?qT/s2oHIfRPNl8H4Kh+2gCC7tHB2eEDj2BStKrCNGAIIQtMZFtNs9LsHpkPa?=
 =?us-ascii?Q?aRB9d4Z0IIPJIGe4l4Ir5atpZqVksZbVy5VYS9lh4kAq7F0wQZTLFRhnMwwz?=
 =?us-ascii?Q?+pTM5k+UMCekxTwa42non+ZQ7QJf8TA7NwMBIwh6vpAaPw6inEsHyVTCryQR?=
 =?us-ascii?Q?Ytf9yQdX9ZVS/n5qIDL98DMgBzRwlfKCcFhqQO1d5YVRfIL+Lhtp3LE9wjcu?=
 =?us-ascii?Q?5/QFTCncgpPARCXnKABumh8cKuhhrjf/WHqzbJ34kI/9RQ+BhAbIPeZQTHfB?=
 =?us-ascii?Q?4RgH48FBL9aHmMMFZHVQkJw9re1q6CdsTET1X8idEv5LjvyG/CkFLHa7wjUx?=
 =?us-ascii?Q?4wangMOFeBZL/g9qt2mZaVWnFwMoxKehakog8RGruTglfn+Vqnv8YDFKjfIL?=
 =?us-ascii?Q?1AZZX5SnovVKhREWpgFt40LDgpYenyqRZ5DdkwfW2jHwJ5iJF/9+savdBj2u?=
 =?us-ascii?Q?abbskNfIJRGdTElCulcPL7X9+4lm2r9jt6BjdGLjeIb/w1Maxx5LYZZofLZ2?=
 =?us-ascii?Q?GkPq4oScn0S7rmNvqeD0HyrZ9xsdJNsP0HbNHEIv1lcNP8a8jBLwpxCnAIcj?=
 =?us-ascii?Q?fVsFDb1oKctUJ69QogHpv8k/UPP/mHk7BF5YvsZUQG8G1pi2dxnNTZzzHk5d?=
 =?us-ascii?Q?L3aMIsHPkvd8g66FDXQFDameDhVgMu56lSZ34r/vvEAoSXLa8++Jtxdj5BmF?=
 =?us-ascii?Q?mKZye8x0tl1i3uSTzi/F79lXSzwCTjH4JSSVlycZ7Hph/sUW1aO5doC/iUfP?=
 =?us-ascii?Q?AGsKGI9Vn9Q9LNlpUQqBlnE+WEswbEEA1uaXMM1Tn5nSfW29Inb8X/JWOTqp?=
 =?us-ascii?Q?6V8XwJl7S0xHe1xKz2+VWQUpHHbdZLruBhnL5wmop8uZmy83OlSHNBUAiQHU?=
 =?us-ascii?Q?eHE6xpW8QapeO368P6nPbGyTltlofVG/8VFNikj+e6vNLBX1a7NlbQB4374V?=
 =?us-ascii?Q?vc5cZqB9qdHyXqoAYDkW/KqYhVOGdKL1JkPzdBOYaXnhS0mOAU0R6EIdFdOS?=
 =?us-ascii?Q?5BZPD3kwFETVS8hw+30mWjDgBSrymNIIIBU+WeqswHyz2XA6mLj1L1TwjrTZ?=
 =?us-ascii?Q?3YW3aDZ5q6w78zhb4H4vDWzgXo2jVoBs/NOtPXOTzaCPGc9Y3yq+/oGrKTmy?=
 =?us-ascii?Q?johp9eiuul3M1/1a+9SAFxlceTP+5C1RJSDOStEz+/msXVUTfLta8CfjHNIg?=
 =?us-ascii?Q?PU9iWGoKOPQyKez2BMJZbaf4z+ntC8dNoXdt03WRbCRUQRPQWRCZ8Zi0crn1?=
 =?us-ascii?Q?ULf5hge92v+kxkbv5CaQknxenzUCKiQrX3c/UnUE1QjUSajDnKDHmteB9eIR?=
 =?us-ascii?Q?TIx0NoN5tVFjlO49yK+KK5vHvE4dwvkT7mMcMTNgVt94AKGXY9Ad30RnlJq4?=
 =?us-ascii?Q?p4rIcajCYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: IGxpk/zZVGjYsbUd5YEbMXhSx9mWH9PlAGTkm+TrZyG7zuo6PK4ZMA44QvOrsWyK0y8cEmYQX/Yow4mjCQpn8F4rTZOfIH7rdp//17GvlnZczEy9Ww0UBnbBE9Ot7qGjmcZQf9on1FzHYm+8rPcgQGh3COWeZ9L9SSUw9z5Rz8eWdzfGFcKCWw7bai9QL2xOK8h8zEb4aI17ghLDg+2giOd4m5ZiYIvi4X2yfaYSLeMk8Vx8/ATZa+1Y8pVGZIU+ceDAnORlmitiTZBizV/yr4VIBc6op57v5jOy8Y4vvbHMVoBzC0sOlAYbn1cVjr6tLDjMyPfTy0JNK3Z0xXa3xA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dba067-ddfe-4dba-30df-08deeee41c65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 09:14:23.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0nzevg33G3BtbXaXzcTCIh75dU/AYLYcl4RMc3NrEAhMHTQDHiPtyavhJVYAoI0a5f5TBUumlTZFcc6L812dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB901434
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

On Mon, Jun 22, 2026 at 02:20:08PM +0200, Jan Maslak wrote:
> Add Xe-specific timeline syncobj coverage for xe_exec.
> 
> The input test covers waiting on an older completed timeline point
> after the same syncobj has already advanced to a later point. This is
> the shape that exposed the historical xe_exec regression when exec
> parsing reached an input timeline sync with no backing fence.
> 
> Also add a timeline syncobj output test to verify Xe signals the
> requested timeline point when execution completes.
> 
> Keep the coverage in xe_exec_basic so the test exercises the Xe exec
> uAPI directly instead of only the generic syncobj timeline helpers.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  tests/intel/xe_exec_basic.c | 223 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 223 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 5335bffc41..7b5318919f 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -31,6 +31,209 @@
>  #define DEFER_BIND		(0x1 << 6)
>  #define SPARSE			(0x1 << 7)
>  
> +static void write_store_dword_batch(uint32_t *batch, size_t batch_size,
> +				    uint64_t addr, uint32_t value)
> +{
> +	int b = 0;
> +
> +	/* Build a minimal batch that stores one dword and then terminates. */
> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[b++] = addr;
> +	batch[b++] = addr >> 32;
> +	batch[b++] = value;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert_lte(b, batch_size);
> +	igt_assert_eq(b, 5);
> +}
> +
> +struct timeline_exec_data {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +};
> +
> +struct timeline_exec_ctx {
> +	struct timeline_exec_data *data;
> +	struct drm_xe_exec exec;
> +	uint64_t addr;
> +	uint64_t batch_addr;
> +	uint64_t sdi_addr;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bo;
> +	size_t bo_size;
> +};
> +
> +static void timeline_exec_ctx_init(int fd,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   struct timeline_exec_ctx *ctx)
> +{
> +	uint64_t batch_offset;
> +	uint64_t sdi_offset;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->addr = 0x1a0000;
> +	ctx->vm = xe_vm_create(fd, 0, 0);
> +	ctx->bo_size = xe_bb_size(fd, sizeof(*ctx->data));
> +	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
> +			       vram_if_possible(fd, eci->gt_id),
> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	ctx->data = xe_bo_map(fd, ctx->bo, ctx->bo_size);
> +	ctx->exec_queue = xe_exec_queue_create(fd, ctx->vm, eci, 0);
> +
> +	batch_offset = (char *)&ctx->data->batch - (char *)ctx->data;
> +	ctx->batch_addr = ctx->addr + batch_offset;
> +	sdi_offset = (char *)&ctx->data->data - (char *)ctx->data;
> +	ctx->sdi_addr = ctx->addr + sdi_offset;
> +
> +	ctx->exec = (struct drm_xe_exec) {
> +		.num_batch_buffer = 1,
> +		.exec_queue_id = ctx->exec_queue,
> +		.address = ctx->batch_addr,
> +	};
> +	xe_vm_bind_sync(fd, ctx->vm, ctx->bo, 0, ctx->addr, ctx->bo_size);
> +}
> +
> +static void timeline_exec_ctx_fini(int fd, struct timeline_exec_ctx *ctx)
> +{
> +	xe_vm_unbind_sync(fd, ctx->vm, 0, ctx->addr, ctx->bo_size);
> +	xe_exec_queue_destroy(fd, ctx->exec_queue);
> +	munmap(ctx->data, ctx->bo_size);
> +	gem_close(fd, ctx->bo);
> +	xe_vm_destroy(fd, ctx->vm);
> +}
> +
> +/**
> + * SUBTEST: timeline-syncobj-exec-completed-point-in
> + * Description: Submit xe_exec with an input dependency on an older completed
> + *              timeline point after the same syncobj has already advanced to a
> + *              later point, and verify Xe still accepts the completed
> + *              dependency and runs the batch.
> + * Test category: functionality test
> + */
> +
> +static void
> +test_timeline_syncobj_exec_completed_point_in(int fd,
> +					      struct drm_xe_engine_class_instance *eci)
> +{
> +	struct timeline_exec_ctx ctx;
> +	struct drm_xe_exec exec;
> +	uint64_t input_wait_point = 1;
> +	uint64_t input_signal_point = 2;
> +	uint32_t input_syncobj;
> +	uint32_t completion_syncobj;
> +	struct drm_xe_sync prime_sync;
> +	struct drm_xe_sync input_sync;
> +	struct drm_xe_sync completion_sync;
> +	const uint32_t prime_value = 0x1234abcd;
> +	const uint32_t expected = 0xc0ffee;
> +
> +	timeline_exec_ctx_init(fd, eci, &ctx);
> +	exec = ctx.exec;
> +	input_syncobj = syncobj_create(fd, 0);
> +
> +	/* Step 1: signal point 1 on this timeline from Xe work. */
> +	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
> +				ctx.sdi_addr, prime_value);
> +	ctx.data->data = 0;
> +	prime_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = input_syncobj,
> +		.timeline_value = input_wait_point,
> +	};
> +	exec.syncs = to_user_pointer(&prime_sync);
> +	exec.num_syncs = 1;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
> +					 &input_wait_point, 1,
> +					 INT64_MAX, 0, NULL));
> +	igt_assert_eq(ctx.data->data, prime_value);
> +
> +	/* Step 2: signal point 2 on the same timeline so point 1 becomes older. */
> +	ctx.data->data = 0;
> +	prime_sync.timeline_value = input_signal_point;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
> +					 &input_signal_point, 1,
> +					 INT64_MAX, 0, NULL));
> +	igt_assert_eq(ctx.data->data, prime_value);
> +
> +	/* Step 3: submit the real exec with point 1 as the input dependency. */
> +	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
> +				ctx.sdi_addr, expected);
> +	ctx.data->data = 0;
> +	input_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = 0,
> +		.handle = input_syncobj,
> +		.timeline_value = input_wait_point,
> +	};
> +	completion_syncobj = syncobj_create(fd, 0);
> +
> +	/* Use a binary completion fence so the input-only case stays input-only. */
> +	completion_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = completion_syncobj,
> +	};
> +	{
> +		struct drm_xe_sync exec_syncs[] = { input_sync, completion_sync };
> +
> +		/* Wait for timeline point 1, then signal the binary completion syncobj. */
> +		exec.syncs = to_user_pointer(exec_syncs);
> +		exec.num_syncs = ARRAY_SIZE(exec_syncs);
> +		xe_exec(fd, &exec);
> +	}
> +	igt_assert(syncobj_wait(fd, &completion_syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(ctx.data->data, expected);
> +
> +	syncobj_destroy(fd, completion_syncobj);
> +	syncobj_destroy(fd, input_syncobj);
> +	timeline_exec_ctx_fini(fd, &ctx);
> +}
> +
> +/**
> + * SUBTEST: timeline-syncobj-exec-out
> + * Description: Submit xe_exec with a timeline syncobj output and verify Xe
> + *              signals the requested timeline point when execution completes.
> + * Test category: functionality test
> + */
> +
> +static void test_timeline_syncobj_exec_out(int fd,
> +					   struct drm_xe_engine_class_instance *eci)
> +{
> +	struct timeline_exec_ctx ctx;
> +	struct drm_xe_exec exec;
> +	uint64_t output_point = 2;
> +	uint32_t output_syncobj;
> +	struct drm_xe_sync output_sync;
> +	const uint32_t expected = 0xc0ffee;
> +
> +	timeline_exec_ctx_init(fd, eci, &ctx);
> +	exec = ctx.exec;
> +	output_syncobj = syncobj_create(fd, 0);
> +
> +	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
> +				ctx.sdi_addr, expected);
> +	ctx.data->data = 0;
> +	output_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = output_syncobj,
> +		.timeline_value = output_point,
> +	};
> +	exec.syncs = to_user_pointer(&output_sync);
> +	exec.num_syncs = 1;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_timeline_wait(fd, &output_syncobj, &output_point, 1,
> +					 INT64_MAX, 0, NULL));
> +	igt_assert_eq(ctx.data->data, expected);
> +
> +	syncobj_destroy(fd, output_syncobj);
> +	timeline_exec_ctx_fini(fd, &ctx);
> +}
> +
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] test only once
> @@ -348,6 +551,26 @@ int igt_main()
>  	igt_fixture()
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +	igt_subtest_with_dynamic("timeline-syncobj-exec-completed-point-in") {
> +		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
> +
> +		xe_for_each_engine(fd, hwe)
> +			igt_dynamic_f("%s%d",
> +				      xe_engine_class_short_string(hwe->engine_class),
> +				      hwe->engine_instance)
> +				test_timeline_syncobj_exec_completed_point_in(fd, hwe);
> +	}

My preference would be a flag to existing sections which says 'use
timesync objs' and the main test loop switches between normal syncobjs
or timelines.

Matt 

> +
> +	igt_subtest_with_dynamic("timeline-syncobj-exec-out") {
> +		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
> +
> +		xe_for_each_engine(fd, hwe)
> +			igt_dynamic_f("%s%d",
> +				      xe_engine_class_short_string(hwe->engine_class),
> +				      hwe->engine_instance)
> +				test_timeline_syncobj_exec_out(fd, hwe);
> +	}
> +
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_with_dynamic_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -- 
> 2.43.0
> 
