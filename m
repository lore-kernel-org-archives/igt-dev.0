Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E4CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EAB10E187;
	Thu,  1 Oct 2026 11:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGhHPDOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBB710E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853255; x=1822389255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KpXRiOGUzlTS21GwNMddb0jL3uEGYa7i5sh6DCbl8lM=;
 b=XGhHPDOqZMDMV8/vXYiJm4xOmx5wOULkl4ArRd1jDomnTPU1igsDDbKd
 hQrR0a+LwEHSurPbJmzepxlsHcC62eE/HQy1X+sNSRJO1Fv6VlfLiPaZi
 ke6PqbDWX8ha9mJIgWggc2tmvz5Y3wPcbcu9ADSOcqWnWKl6lus6blRxP
 GIw1ba2DcJt9bpcrkGOkaOVyqnIWZw9YXYuV7MZc36xJuCUi0Cj6cJaOv
 uefZsfrPcC2QvWtP91UAj1HZz9/FqG+kwfW7lSGFAq3kspUx2DyBQCyva
 OOSqA3LgPn4Efwf6SFOKnJfOWvArtxr31Zz83oqEQ7kLfiMtGPuV5zzrX w==;
X-CSE-ConnectionGUID: qV49eYpARkSPt2LxcFUJXw==
X-CSE-MsgGUID: qpBlK7BjTAe7UhausN6Mqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94318729"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="94318729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:15 -0700
X-CSE-ConnectionGUID: WdjgITjpQuu0TOc/vR6MLg==
X-CSE-MsgGUID: LpUIKYGCS8+HzDeih71nEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279742988"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clGLGnPs0XroWdU58vurgVNKf1ki+P3BgVaMfnQNokaToxZVfdwso1wEnDxIsyJsU4pHKkyr3/CDagljiWEdNtfLoiFxnXdl3vZUQFjfMQWOSrfMN+iH2x3kE2/AM7zbUH+PkRY7xEDpVPHKXzJ+M6abJXB6kfGM/hNW6eCtexEX4B972za6cQiLBnlvYHQOpBul08lxEosBU0o/lYtoORUDpn58d7LMuI5IO5M8xGfiYqUxLLZ0E60Y5d/+zMB5Iy0C7HIalOLwDSLaL1bU5/xjBJoxqJwU0r7qqb6QpPvmb8MeW0f4CO4N1dCtNsTNO7rPBJq7iuAbrrxf22LXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4Z1JHCRiDhKyTpo9zt+qu8zlxMNfsmzj9efQV8BUDE=;
 b=mwwWx2g+tHeTV6IM3wtuYrZan3PvaRF9R2KYaJ/3osN9NTT5XNif/sJmyWzedYP+h+y1AMl2zvTbiJKwCPNuR/fuwOPbXIzV/KTn/O3qQsFeultAJY/NEhk/DkHFaKmLQNkFkPcrspFTCtZuaWJMAOhNJNDav7Ix4vB2id2jWkqcPp2DiU3wwzUHWKUzAaRPoZRhVAtab2k5hcx8ebp8Exdr+9OO+zz0p2/zZ2W0TXBdOL5q1CfhROEkOY150vSCQW/1TUVW6JOoYoIBlzUjdvGepQ25pFfDWuVIDt4aAmrM2trF8vN+W6Bgxy/to2WdOX+lfkphInkP8XVLAfxuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:04 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:04 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 2/8] tools/gputop/xe_gputop: fix missing igt_aux.h
 include for clamp()
Date: Thu, 1 Oct 2026 13:13:55 +0200
Message-ID: <088e1a883b8d88a27a16000d6616d43d0858cff8.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bfb9af-9008-4eea-2657-08df1fad19d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sGyHJ6rGuPMYGwEOsh56Kzx36qYVzn7QMbUQkZx3Zj1191aYY+WIeD0ViIHjqcj438EGzjgqIThSuXLTn/ZugLq2PAZSrRDOCNUaLg2g+mdXR5aQfOokL30lxBkZR4KphoC8A4ucTugeN221oFoNGrS2lkaJx/JKFbWW7dEwl2BtEU21VlO5CIHn+2p3S6t1/0Jafo6ym3Mzq4yrMqZyHcmzTgtjiAwPpWQs0AElR28H2wuOG0Ob5rHGOcghVJeD+HiuUtOxAhHy276ba+Lj5DrxUT61Cm0Vavuy5AVfyMhaTE2UhZG40waMFLl1Fu8LacWOBRBtVBk4gIfIigKGpr462dqxWsgFRSWPIuV+VpDhd/9EFGIoloeVpGUiKr7xCqevaHYKLmNYmGWWJ7oy9tvw7Q7JJkUti+xQMyKmXEkqkMnn9sE78zQ3DyWnKa1AIn8kfuyc2E/uo9e2Pm5m8PN24kP/8l5G98hDa2vCWowuVfuD7dhrmkp6Il+tCgwWIHoEtwWp5G5Jbka3hvLD636t26IiIMvDiOvJHr7QJHB1aROb3X3ddNanGAPElb08S9FE3Eq5eWY7vfAgcJ/38cZO3FCVLs9iGq8FynIQRYQe1vh5LKOytsKu6mKKmsrDZWaeoRtquy/yhjmedAl90+apvseqEWE1/cwFR02/ZF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em12aTJLckJzalEzZ0VpblA5aFIxbnJGcDd5QmMweWswVG9XdkNmeEhqQ3VE?=
 =?utf-8?B?dDJxQmZ6WldJdkE4bkJ4TkJCOHZPZGpzZlN6UUwwN25rUW5PWEg3dmZ3N0tO?=
 =?utf-8?B?Zzd3VEczZ1V2RThmMWZoanpJVzhhWi9qMTNpNnhZNEJNdTdpVmx6ZlRmT3ZP?=
 =?utf-8?B?UzBMSC9memw5MDQ1NTQxWUZNWFZ2dkRNRXpnMXZiREhMZituQmxaTS96OVdX?=
 =?utf-8?B?MnZTYm4zZUtEVnB6dnVxWEhiVjBxa09IVjNNTzVRWEtGdEZCSXpTazl4VUx1?=
 =?utf-8?B?bUkwWTdhNlpLVXpQVE1sWnM2NlRvUnlkcmcwWlJRNTVpU1B4QlRUcU1YNFlS?=
 =?utf-8?B?dU80bW1YbkhXNFE2VXRGbkJhSTVVbDdjbWxpYlNwdjB5clFweVhMdFlSL084?=
 =?utf-8?B?Q1JNc1BPYXY1UFhlMGdHSEl1VXFHZXV5cHczck1mR3NoVi8wWHVvOWRFYnZk?=
 =?utf-8?B?a1A5elRSK2hsL2tOZXk3ODN6VUduNEc0ajBIQ1ZqcVl2TW9aVkF4UEFtVjhV?=
 =?utf-8?B?d01NSHFoQ2ZTSWEyNSt4VFl3aTUxMkpzTTVOV3BwNnMrcW05NFpXYkZPUUwy?=
 =?utf-8?B?NGxBVzg1eUU0SWVORzN1MUk2MVBxekRuQTMzQnRLZmJqa1VIaGxJRnNBMjBB?=
 =?utf-8?B?bTlML2hydG9oZkZWbzg2U1RtN3AwcTY4eVVuUEhVM2VHanFtSVlEa1diaTlz?=
 =?utf-8?B?QUFrdlN4Z2RaOXl6UWk1elFNNlZUME51TGpzeUppSlVid05LL0pabnllSWpz?=
 =?utf-8?B?elRFWDA4d1BVcUJtOU5aeFlYdlRFKysyOWU2blBENWJSRkd1WnMyOEtVUEpN?=
 =?utf-8?B?KzAvQWNULzFSak1haW93aW5iYkI5VmFESDhlUUt1UW9GM2hvYnIrUks0Z08z?=
 =?utf-8?B?cUhFZjNPaytpV2tMNXFQK0RsWUtBcjBMaFZIZTQxa0NONVNVVEV4UUY4SFJV?=
 =?utf-8?B?bkVMZHR0ajNZbUw3UkZoVXIzU3RtTGtMcTF4bURSaWZ4NFRWOGxRT3BlbEly?=
 =?utf-8?B?bUhlZzAwSEEvR1d0TmRFcHlvUkp6ZkJQWklzeXVGS1ZZY3Rxc3JVZGVXTCtt?=
 =?utf-8?B?Q1JxSU02a0dHQXpXVk5acFl5YWc1bUIzUkN6cXdzbDRjc21BbUhjdnZyMmFu?=
 =?utf-8?B?N0JpRDZDaHJIaFJvaDdkYmM0aHl0ajF5Tnl1NlZVMEJUQlp6Ry8vSW5TSTJn?=
 =?utf-8?B?V1cwZE1CMjB0TE1aUVZiOFhraDZwU3M2ZDl1TDNSRVQ1YkhPcHh1Z25CTzBs?=
 =?utf-8?B?TXRJOExMd052QTJ6S0xqaG5tclpScDJFeHo1eHJwSnpMRUo3ZjRqYXZoWGlz?=
 =?utf-8?B?TndnN0dqRjNIcVRha1ZqVk90c05lSFVMQy8rWXBRVkltekpOSXVDT2p6dHA1?=
 =?utf-8?B?a25VdHl6ejJOemFVV2RLYnhORUVuZi9mQ1F4NktRdENWMUlUTWVoeFdEM2ZY?=
 =?utf-8?B?VEVrRVR5OCtaK0lJMHBIdFhrd2R6UUZRZmRxWno1SG9PQ0pkVVM4ZDRxVks1?=
 =?utf-8?B?eVJ1RDdlSnkrdnpSRFQzeXRHSmszN3NydnpUNG4wOXVXM3hKcWZRWDBZcGNw?=
 =?utf-8?B?OWJ2OVhVK1lJRlpUUWh0eG5RT1I3TkFrTDl5QVIvVDg5ZEdpSkNKS2xqcmpW?=
 =?utf-8?B?NXA0bGhFdmZjeFkwQnVGVnA2eEZhUiticnJjdFV2QVU4aWN4OEg0UHpPdTFs?=
 =?utf-8?B?emVKd2hTVVJ2UzVPL3NVMGxoUmxJczBYUG81Z3dzU0dPWm82ckNaRXpObFFt?=
 =?utf-8?B?d1I4a0MreUFBZXpZZkVDak05NHVnTkhDR0RINlI1SDFHc0JhbEpnMWgvNEZP?=
 =?utf-8?B?WndNNks0em9NTzZoODBjY3VlMzBweGhzejF5V3pIb1JtUFlOWUsvUi8ranZF?=
 =?utf-8?B?bGxjMlBaL1VqUHdXSytZRHhsMVVRRWUzQXA1V09KYThrZ2Q4STYwdWF6bFZQ?=
 =?utf-8?B?RkprODNCNG9PSThxNVpPc2wwS2dsaTA0eDI1QW9xbU04NFl3QW40V0VhZjRO?=
 =?utf-8?B?QmY3RXN6Z3ZEUloxRnhqSy9UeDhuakxueDlUdTdTYlFwK0VKa0lBV1pEc2xX?=
 =?utf-8?B?NHRtWThib3ZsT3JuQlV5TXVvd0Y5OFBLYzdQMXZDOE0rY2xLbEEzbklHa0lq?=
 =?utf-8?B?amRKakdQTVprb0p4OUpnRzNVYmZsOXFjMmFnOTA5NEduckFTVEVuc1VKZUgr?=
 =?utf-8?B?QWQrZlZYUkFoQjRkNFMrMy9YYys2bHJrS25GeEhoNmZXNzQwTEM0bXd1Z0Nz?=
 =?utf-8?B?T09MTS81eW1WUloxaUhEQ0Z2SFRINkZxT3VCTk9ZZTNGU01HVDFGSE1Ncm9N?=
 =?utf-8?B?cHI0TEtkN1JoOHNpdjV6cVNmSHY4dDVtREZFRmZ4MENpQ1JOcDJIQjh6Z3ZP?=
 =?utf-8?Q?wP50Qzhf9XaOwolk=3D?=
X-Exchange-RoutingPolicyChecked: osvU6P/OlcHnZojDhbtstdTVhm5sijzMG7/ev7HUXm3q1DX6rgj7+Y3tuMz9lkZr7p+G02i032rPfH7FtMr0NsBi6fOUscTH6pgI+0rcUL9Q6cN6CrD9EQfq4gkhg6PV+GUXPyrE/MDACmBt++6b5GMBsOXF15DuK8T2dFWnBAdtUtAV1LsRXtLF3wmWvy6loiA/C6AxjVycDz7aJTI0N7j2clOGkF1xzecSw7/btFu3WSVyCIdUWbOfByUHRsxvkD557Mr/hQz5dVd3sh3LqV48hXf43XYWJf3QQHo+Yh0dutHtep7QsmOOQYe1D1K1Ob3yFhfbKGAaHqKGev9J5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bfb9af-9008-4eea-2657-08df1fad19d3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:04.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P28DWqxQxgPmrIru6WpRV36GG8VcziDDh9yR9cgYe2WIi/3bT3cQ0vdKoBu79B4kdwREfHZIO1DzTtMudGdMz1HJDLSr1X747iZ8w054gkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

pmu_active_percentage() uses clamp() from igt_aux.h, but the header
isn't included, so the file fails to build standalone. Add the
missing #include "igt_aux.h".

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/xe_gputop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 49d08536a..46d29419c 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "igt_aux.h"
 #include "xe_gputop.h"
 
 #define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
-- 
2.55.0

