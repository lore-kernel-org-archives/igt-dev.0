Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D43C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737D310E859;
	Mon, 20 May 2024 19:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sc0B5wHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759EA10E89D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231854; x=1747767854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ClB6gx5XvWJWVUf7mBrp/ztbkTewGqqajEr5+7d4OMc=;
 b=Sc0B5wHFHWKoRfIO8xAH9idDDt1zo1L38LJDJwoBlmP3lC7Ft5jyQw5m
 GbqJgAkwsOkwWd7wus6oAweEHKPmG23o4jjFUylciTYUOF99WOy5G6UAW
 YufL39rGA7V/8m3Kqn+OV914ZBh5wc7FXdzxbiPnzZRIMF0+r5j0pIffC
 /pzgDyLL+oHzpYVmxTukmADhQblh83maCFyTvg10o/ngoGMsMYz5rXccW
 79cydRAOyWN8NaSC6zjn2Oo6h+PcA7vAiDJoAymaB1du1n12jMJHCF1W6
 nRiS/qTeVKGuUEpVvI23XNHMFGLtC7NS1mZiDmpqIoj1EDVINTlrGTN9j w==;
X-CSE-ConnectionGUID: TiIxvBaqRLa0xcpHPk6Nng==
X-CSE-MsgGUID: ftkgbUeZTueJ8YkJ6w2J5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15330817"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="15330817"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:04:02 -0700
X-CSE-ConnectionGUID: RaBH/1+UQwqH1yWUWGv8BA==
X-CSE-MsgGUID: CKtgdtO9Q3+LlthXeYiulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="33199967"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:04:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:04:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kprfc5vq/xSB1IPgnRdvkPghm311R+1GCS6Wrj4AdyyiuwsqH3kI1IaZlH3ObRVXJLSbkeUYfQ9tqUSiKzwn1rxBJ3f9FbPaRxpA0ap4DZKZBRHV1ci8C8uEMnLjsmbzdTniGgkEDM+R/B6sRQQN2wvZ0uPfdnKojI4mgHnLWFWbfCK8rY6L9SCvNjulXIH1kI/grcLKncakYDQxOPK6SuY9TKij4TdsZ3mgQnX4uY9kCsCoJAVwoWk+iniOxnFRr5KlI0AbkuJZ7Jo4861WfzuNkvMFJIIwjkH6VPlF4tR9j4OLaK6JOg9AZHgUPEafV/xDB+PX4ExeLIzl9Q36Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdaQIZqAcAVXwfY16IXTnhQ75DTYJHdenlQ1oW33RnA=;
 b=m4QgGy4moxKFLKLdgic+3j5G+oijpUXjlGLbuiVnDNqujS033onw0Z0zE9ZwPxRM8otjSYr7zSwp24/hNPAHZidF/Gl3y8Z/KuIM6r3Hlz/1Nwg9NadOTnW26jheXWG3xwh/4JUDswF4slMprb+H2bE//X2hSzcD5wIRvBOv3JPji1Y4LYFo/nIpGskbYZmPc2NNtCcUhh7wbHQqzeBmgtG9livVPH2JKi3j2MNg8QIN/erWQ66gwP7fV5QXTvIuPgFcA3+icBGZu10eQRdfPUEzRvkS3A66zPxG8TgM0Yqyg5odLWuAxexIiTH5ndZpPCJPHK+qUyyBsZzoDStCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:03:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:03:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Mon, 20 May 2024 15:03:44 -0400
Message-ID: <20240520190347.242249-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aae247-d579-4d3e-23a6-08dc78ff9990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VVwJmLkOX9VbbCVmbed2xqVjnjy4NPm1JsxvB4KEeFUPz5V8LnVgcU1ZcYOF?=
 =?us-ascii?Q?1URBtrQBckwPWApcUGCJxtARFnJjrSeSQ5B5ki9q2ndu7ZoZcQz0F+nYiKW0?=
 =?us-ascii?Q?ALAOzL6I68sxtl72Hd4wsFW+HG+N0o4RinZdvXq+R++agMt2OXrSjZbbcPfV?=
 =?us-ascii?Q?6DjBBdRff9WFw4nMxCQhraCLOb6VdshzahEUbKpuICTTPy3a5ajV51NxBduH?=
 =?us-ascii?Q?RcVBnFcOBnUpRoXVWFjE78jP3Oa8j52fEC4u6ybGIzHyCmpTU6ixXK8mLjfe?=
 =?us-ascii?Q?ExZFZYIjFWIHt3dr4B+uKtyOpnhBsmmqpL+3RF6m4/dHBHdorDWYGQ6zOXp2?=
 =?us-ascii?Q?dYNSsEdrXnq3y0xwwp51CPiP+oYRBdSUjd0ha4AUGEhm3U42bf9muDGiMG3Z?=
 =?us-ascii?Q?mcVibPqHFeJAaOSVafK/mtIInMxEGTYdS4FIHj4S3cg61/RoQ3eGZLpD+JTk?=
 =?us-ascii?Q?myyIJUCfAVD4uGyRj8HKsp5RVoqavro7hg+eG0xPWjjcGsD7Z22ZgymjzI0u?=
 =?us-ascii?Q?RezUdu277g8mqinCreMZhFB9LupIDRk8nUMEemCaA3lvmZDFA8RdUeFjVs1Y?=
 =?us-ascii?Q?GRry/YV1kJPz4PnIas7POx7mTEOYOcYGhOCptnwWg4PWcCOzv7xmfAJckfZc?=
 =?us-ascii?Q?bZ14DNE1bC5vRiuNWMBNXtZSVU9RJKnpz4qn9/7VOcXaGJKie2n2SwbeL6D5?=
 =?us-ascii?Q?WDk/NOOPcBtQKANuGD6oWgY4JOUFJT2KNXvQ3iEXFAcB3FCWGjtLkeinQWCh?=
 =?us-ascii?Q?fMyEXuBnrTpKOSzTCVIeItsZRbThFVzTTy9nL/zmCSioJjICPfL/MbUYD6af?=
 =?us-ascii?Q?DI+M5cGIeLZHB/XdC5/frsYPAPoLaBOvXXcAGOF/w3rPTR4+lAsfN/1iuLXS?=
 =?us-ascii?Q?ZVLQapIHnSJPTGd6pbFzjIRaElWIbdc77c3X2Eo9YvBLBHxeisOaW5ULu0uC?=
 =?us-ascii?Q?Nw5x56GJB00WRc2S4mS+34V+vIyjWjXwBckxvN6GzOG7ChaYSl99Z2kngg0F?=
 =?us-ascii?Q?NDk5i2o4KUdfGZajFlv60iuxS6OKpxQAAJANx+bFUCypWYYW8AqUf8CSAuuu?=
 =?us-ascii?Q?AG/MXKJJCLn+NF+goLJ2MnVlNLdlIBHX1Fl690LUcbgMXCzC69DEs9d3L3dL?=
 =?us-ascii?Q?RT3a5KKEZV1sndQZxyBMXaIGLL05S5Ad7r1NHIPh64hhkLzrO3OgdpfZ5yzh?=
 =?us-ascii?Q?FjUIoJtooDQLdCZYbReBthXGP9YxlPn3hGPamXYmz2xy5/zZ9lAG7QmwafkK?=
 =?us-ascii?Q?8Rm3ETqGOKTFv99GrulQEizaA54wj0M6nIJlwxKfXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DaBXhf6TZpdx7boov90v3NmGPNOGhaN1jov/TAlvYLDLIBKlsNiWbeJgT1st?=
 =?us-ascii?Q?ToZARjlDtUEMCdskoouLEHIpYz0nOox1KNJxbn/Hi+VvZ6HIR/ABQ1uE/BiV?=
 =?us-ascii?Q?wJqWE9pjTxcHRFoRExGskDPZ82ErejS1FVpfcH9TJi+y3qfSodDj+GS4h2xi?=
 =?us-ascii?Q?JXytQOtZFfZDXzJIMjCN3z9x9x/sbDEpR2RUw6zGCTY/vTK964GKf/PRXZNu?=
 =?us-ascii?Q?6iTcMxE52veCKoKm3gWw6Uj/jMuv7N4XlAt4W15TtlolsxawyjieIpGBwYJc?=
 =?us-ascii?Q?PWxcXSvVVZT82RUD2nEyRjbmIwAZE86YgjKgwlNAgN0QyUOvbjErnde6WYeZ?=
 =?us-ascii?Q?GN1a5czqh9zBsS1bFEyJ/IziSikFSgSJMDEtupkS/4LzKwPrxzJDIlX9jO81?=
 =?us-ascii?Q?jitZK5V1SzzJAcpcLrNTwPU4W81CA2nEYCGEzu+mU4lLRGv2OSDjBRRoiYDt?=
 =?us-ascii?Q?BSTVEKB8CRevud/KPoukjQd91BlkJzHEhNBVl29KLFzhHmA/X0Nfi3RFyLws?=
 =?us-ascii?Q?Zv3VDcRJ+lGm9u7eayESvsTuP5EwL2i7q43to0ZgR89NUdae7sLLGlh0h2Pa?=
 =?us-ascii?Q?UdKc6zrn7zsSEud/pkGDh83wEX3/C53homw3WryM4+NEMYv4iOq/73lkKevF?=
 =?us-ascii?Q?FNBSHiia6e/sp7VM3AwoVBnvNUKkwdPkJsR1DlvlocmKP/LDibSXLOx5nNiE?=
 =?us-ascii?Q?28j+IunKYnlekuBQMcduNAlP0Wqhv00Is9tOnmMQcFqdXNcFbfEr57RDI13N?=
 =?us-ascii?Q?+e4hK81GzEAyJZAtJRrw3J/IBPA7rKQW/o4BJcIjXs8s2ZfgyH9MnnFitNhG?=
 =?us-ascii?Q?aWXLJRBTZn0Px0+4vfNS0rusAx4ZmkCdGh6tbi8qG1cKvEAs99gBtZVJkiCj?=
 =?us-ascii?Q?T9Ym53Em5nzY6a9x4qFidqtlf4JRrnTDJErS20S9UgjW7kbW+gOMquqYPTy/?=
 =?us-ascii?Q?+y3rd41NdRNQ2hIMp5ZWXiI95mWhzzcHfI1PGklTKzkz2us3w7hTlVlYsQoE?=
 =?us-ascii?Q?7TVnKO8KMYeJuHWz8fgzCybBQwbtteFfXtM7JnMpLFlLdxpgBxBqfyComJB7?=
 =?us-ascii?Q?t+eAUu1K3lYHr7TFtxcEivscFKZFrBQ8ctKRLEJ4hhVcD7GgC0NF2Snck2Xg?=
 =?us-ascii?Q?hbTtWK7yt8KGbhd6r2xZVwYe3RpEW35K8Znhyeva0VnL6i2YQNayj/kFa43o?=
 =?us-ascii?Q?3NpUfS0loqeLGcS+1lXl2bRJLDeA5I0AtdhocvjjLFX6wqw68q5vCz6goWy8?=
 =?us-ascii?Q?NuGQpLRGotGsmo8zUgDDlcPMo7Cw5+c5HWq5d+w72/o3BTDHJS4j55TXc4Rn?=
 =?us-ascii?Q?xRW5dkc8WFMXMeGZK22dcQ0tnARd0/d9/fL2FEp2nrus8UUdPjbcRJ16nU4Z?=
 =?us-ascii?Q?DqXGeqfYDbTL2EGQu3fFHFAsPv705rRkHJ3VZZHlUquxqAY3cu9tUL+N2GwO?=
 =?us-ascii?Q?Xj7E2qsPQ/COkf4CO2EOeKurYi4zimt9a2XeEeWN60J7yUjDJ/eR8CDFU0zW?=
 =?us-ascii?Q?aLorW/DRkd8CKc2myyuxeH+gdWcoDGdOqdgdulNTBvurLBABExf3E4BdVNVG?=
 =?us-ascii?Q?jwsomhrTc9xOimZ31wbNh0zJzBAhODKc9YaO3utigqyvb1BMK4+ZTh6S34sf?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aae247-d579-4d3e-23a6-08dc78ff9990
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:03:57.0468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHAq7rFrpM039tuWBv2RmuMRaLHOwL902TwwuSnDsj+mOvB+r0DOVV6sJrYkbgpHCixJfog8xNWMUNMFsaYZmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d301ad031..68e3dd1ec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -793,7 +793,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

