Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D83AC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 17:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE410E271;
	Mon, 26 Aug 2024 17:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeWj068K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1710E270
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691856; x=1756227856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j80G28n1YKvSA6V7C7wlsCAWytkEPHYvLQSdYfQtvXg=;
 b=NeWj068K8Bv9xSPzOa3I9jRPGx1KXtjtD8GpfZnhXCfUSnRjPwW0bTyE
 3MrqhYpNKyYKd8F2CALQR4dTF26ntH1s96hcRLqbtVp+5RwHClw3JJ1Q1
 l5X2sCAnM3SAYymkdgVcN4vI5QnQbFSPAl1Vekuoqv4uxC/6MiAmQ82H+
 wUCRBvy01gzxWrwwO2CDQxYUyiIkTw0Sg8AXHtpnMuF+hXwtWl8IJUH0P
 ujedwLStVFEycStCvHZSo0TBazO78emYJx+DQEMaL7dC12pPybngocoWd
 /pOGfL8L7fyNWraiftrrgIq4z7vLy+0GKQjhmBW+Y8UoyPDGKIn2fcMBN A==;
X-CSE-ConnectionGUID: JjhAE4EVRRuZwYuc4QlvSA==
X-CSE-MsgGUID: B7z8yTAJSoCM2eKahyoYaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23309155"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="23309155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:04:16 -0700
X-CSE-ConnectionGUID: s2MxAgN1TJGM9chehAtM1Q==
X-CSE-MsgGUID: o+yOJzC3QIm71md9xtK1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="66734743"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 10:04:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:04:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 10:04:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 10:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM0PBgIIvlUPFLKvvO//27464bwBYcjeJm/vmrwZ/eODoFjOOlL2sZ+W1/MLPbiWYHuGC3t/I2CtfkcvLGbgyNIO2WF+nCD2F/xspWU3ujNixJxkX98jt8v35OWQzmrT6p4tsuCPs6Sgu8VS1W6W/kXPAhzHYBCB1EQwVdpNS8bvhk5Lf4hYRTXHCAkHGO5yDm8GuYWR/6LLTvg7ucoCNvhg5CmrP/zqJuhS+Wrq8SvsFJLD0TFn34sYiNiBCf79WPAMHAbLZlqE4gGwCI8F8m86kvdTuMTvLFC6/Vx6a2V07MPNAMbEg2g/15mW+sEQ+gJ54tgdIsxjL82ieFWMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB6+qG0FktvrQDRrLUR2nWFd3IqdN1f6/i7/HQUrtYA=;
 b=eog1c24Z60t7Cwf5DWQEQHWtl3HJtW4Zi3QgdN4A4DA2YGLRa3QuezuI+gNBB7rFNClM054RJi34klByrHVPzdVsjlEYuSzS1Priv4iuH54FCNWskB82P7jgymNubub/33H8hun80SO37oKzD4P2kFiOjfzOkRUAIQH6/H7NwgYafzR3JORq+QIkKg94smBiRr3hGuYNKGo0epnbCGSeNeWrSO4wL611aegn3PSFMgyhebPh0EfRD+tOiCBp8uw1G2PbGHr2ROtk9MZOmeBl+owPsY6sugVp7iwS/Bywh8+IkCDriQj9hvDaKoN8e26iXI6bwR9+0iQ3bCeFc+qkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 17:04:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Mon, 26 Aug 2024
 17:04:09 +0000
Date: Mon, 26 Aug 2024 13:04:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Message-ID: <Zsy1ht0_jEgj64PD@intel.com>
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
 <20240819103242.26527-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240819103242.26527-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 32543273-e40a-4cea-0e50-08dcc5f119eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hznNr7y+t3zPbkBGtpOw7WojP8/2WcoNcMp073Arz6mtCO+sI6RWvC9vDrGb?=
 =?us-ascii?Q?ljhXFs3EHd907lbj5iIkT3O6qtgKbvGc8pO6qfcdfYidHujw1tnD3QUqdzRd?=
 =?us-ascii?Q?RrmVAZAXX2S9sgRfqq3kTm6+q2ljxYmchjRybuCQV0TMalwo87xX716N6VeN?=
 =?us-ascii?Q?83I2t2hn2AiUNS0X5b5L9/QH+C4gMnjx7QJjDq9Ksfu00MKOViHxdcreXJet?=
 =?us-ascii?Q?o4Oye9dhDPTefO5YQ2Dj2bhqsfbFETXmXRwCuaGhUl4dTBX0/hJm9x48ZwJw?=
 =?us-ascii?Q?qIl5GCD1YgAcM7jBj9ARAQz0Gp4R3r2+eVSnBBitZYEpUyPy1BqELdUIE4yw?=
 =?us-ascii?Q?bySRsBELjLuDyuDZLr2S0cE8uDZw4pPs8F9C9K++eIZ99kkN3YPw8fXs4Clx?=
 =?us-ascii?Q?G/gf0Wqmoas5Wz9jmmyH91zVUTYNs2La9KdAM1UMUN5/iwX0V/9pZupJGNCX?=
 =?us-ascii?Q?PMSnm+pZCBTrs+BpWHC7Ogaa4S5dLAnRK3ROwUG9iENNWfSFSqRt46WTFyf1?=
 =?us-ascii?Q?zC0ZCvvQ4K7Qo06x8p3lwDNfWD9WD+ke2CDSy4W/qIS9WhSjgGp2OyNMo3ID?=
 =?us-ascii?Q?TRIU1+iQ+NROu4oc7OK4q/Ks4tdNv3NN+areVE20o0yhIKXIhXljDxQawxM3?=
 =?us-ascii?Q?CbFLFlI9Kf3TvEFAhSpvbKYhXLpknDU3bxfENUq4sRL9xiYN0b/Db6vlnU8T?=
 =?us-ascii?Q?aJDH5YCqErT+BT0O/OeWZMEbG8UNC72u7p5g6xbpPfE3WfpV5pNI75czSAvD?=
 =?us-ascii?Q?1SPEQsep+Z2TCifp/dm9Y2g3cEufRhqtnh0SjA2zkqk0Np2o5+4zmwSDNGTZ?=
 =?us-ascii?Q?NuVySU+os1kFLGvcvT22UC+JfNScV76+c2YXoz9LD2zqExYSRYIvgy9UhHDE?=
 =?us-ascii?Q?i3Gl7x2cXNlM7SXNX4iwDC5aiXK5VP8bejxOyJG4KykubasN/cyozAnpDH6p?=
 =?us-ascii?Q?InvnEp77jOBYxKZYzoQpUGkMOii3aeeACs8G1rH2kkSIIoE393BOIKoz3drb?=
 =?us-ascii?Q?KwWKWoIONfIZ+yIFXP3ZYzG4iOPnGXrOpapy8Wp6zuKTAG6oYiWpsskrYOjI?=
 =?us-ascii?Q?2N7RLcDi69Rf4/Vf4Cnz2nLv2Ecrufqo++d5WrYfl09dL/TQjOAY5nz1MpGJ?=
 =?us-ascii?Q?i/qbz4Tbh6saAGYrM6VPdV3RHToomGDs6m6CQ/IwU0OER8kBxEYf3wl5aVcW?=
 =?us-ascii?Q?BT8JSJDOcKqFDmtfZF4bKbgW8uOc2AVL4yltjdTvf0DEIqBA9rHnzVH4aZW5?=
 =?us-ascii?Q?rxSaLhm/1OYb1OGWJNwA1gftOpdPelGdZwg/rFKBwwWNSclZtJl0H1zA1H4k?=
 =?us-ascii?Q?cCdBF1xmQaylwgXno3/qzruxIX5vKGqGfNAqZkW0KVzatw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O4txCBaK9tSk6OfzGtLi8KK4mdtC0YOO3U06u7DEMBFVrN6N4YxDy6ES8cDX?=
 =?us-ascii?Q?HJt6GMPrLF9JXtKGTxnlnvdyr6XO1XmG8XxJT0sEsmoGRrbnj84pbgT5azK0?=
 =?us-ascii?Q?7LYYsUPA7KPyFjNKSlcPT6j2FJATrJc42qB+YczTBaDDjJiJRMXbObPLASGN?=
 =?us-ascii?Q?QbABC4wWa4qEIwj3m2jOS8If+3eCAdlVSViIFKygL/ZGhktvkK6llK1aPmha?=
 =?us-ascii?Q?ZHYgXS8kqn5ABKnAkiSXxw1Ofd2nOAu6IRQAXmjFLCmSrk4TUl0fAoBEgRgU?=
 =?us-ascii?Q?j5GJS2mmuTcvhiS52E6UWZNPL5k5HoZzFFNwsNX1c+I/0/l+FXqJKD2773R8?=
 =?us-ascii?Q?m+ESL5TOF9tHLm0pL+WFFJ4OYU0hW2+K8ia2LspfSXVviNtQBD6HqrNnNYFd?=
 =?us-ascii?Q?h+kh/EmQ0DQWkNj3/g1K0uu/ADl+AMGhm8tHwvyEoLU2FXy4YULxj+87btew?=
 =?us-ascii?Q?Bf1ecwQFFcmlyaldkHHvVQWhYq/jgaOWieAv0m8sdES6LAxPbim0JBctqHTm?=
 =?us-ascii?Q?+WZbPIsW04yRH2d7dPbswqjsCLuoEcDlLqNlFwrgMcYHvjBc4vmGAvkCzfKn?=
 =?us-ascii?Q?d6hUlmBc+HNsipIObOJxAVkxSVIEDDgyxqFwciXJ7DdsG40DGQ59Ey6UjafH?=
 =?us-ascii?Q?JcUxjBeq9iHBq20aIs5UDzducYHSAzwzeKGfMTsbZeDE21YtaW1C+ow6DYA2?=
 =?us-ascii?Q?PU6QuZep0q4NlLp6UL8NXQoA6Z5mvj0CpHwE8URMH2yFk4/k/bU5XD5V3EIe?=
 =?us-ascii?Q?JaPJki9OZUUBed907l8NZq1EtoT34H1a9vZzAnXpOOWadtAqM9G5GNp26cle?=
 =?us-ascii?Q?OQCKehA2A9jKmxdNgjvU8gggtNv5FqrDGXhpcieLPQhPUwJ8C74WJBVSd2VA?=
 =?us-ascii?Q?QHjF9aYWD/EzCTCGvAwS1yLr9/vntOhVSJA+D4ooWMefOMDYVKi/ESo5DsXG?=
 =?us-ascii?Q?PeE5XNuw2UF+iREKZDXnZ2KiuP0Bf+/ZQMwLKdnYSCPM5w4Afsw9Pe3N9Y2S?=
 =?us-ascii?Q?yo7Jgj2AdIT9nY+Cw9wXfd6Mdw3MsTE5e/40SqCJCuB+1o/1PGE906PMpEvy?=
 =?us-ascii?Q?tqmww9CRTOXi7LUsLMH2yiV9Vz0CmPRN/g3h5neCNECfD0//vfjQU9GwX0da?=
 =?us-ascii?Q?GgeZRwAersOBVx/FrQcFdOLLU0HmODXTIbKQP4N+60t5bdEv3DMed581++4p?=
 =?us-ascii?Q?hW7qohRMJ5Xu0teOigjFvlgPLgq3POWs/qOKVs5y7I5G1ohdRdGG3CIQydIt?=
 =?us-ascii?Q?9IasZzQLBJHSHr+ePl0JSGzvM/zmw/VoufaAxvmlYbBsbTKlweolcodTl7iJ?=
 =?us-ascii?Q?nh2R6vEkD8lvwC4N6+QOIy0Z2zqvA/FI81eLazYI3m+b+sULu0RKcpS8BqEZ?=
 =?us-ascii?Q?+7w1SRbpwifVnH+M4+YVdJpY061CjGyflJWItl+oYcbRybRGZgMQLGApSXJF?=
 =?us-ascii?Q?uCVBgUMfbCspMpqKnlWi9XubysGJK7qpzf7JBQ8LVs2LwkUNMgWkcWxqsdUY?=
 =?us-ascii?Q?Hy1YQOdm2JLV5DiUiUadF0xe5P2/2S72WLI9MvVNIQ7l+tI3tsfdja+4CfYA?=
 =?us-ascii?Q?7Vx32SQOmrJ8yh8JTx7z1ScHMCVLk/kA56b1tlMnNsiCNCgiiVZa//khKEvw?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32543273-e40a-4cea-0e50-08dcc5f119eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:04:09.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Itxapj6m0mFF/HSy0h4FMcxrDm9ofedbS/MKMYUmm6qN7dB37vaSZ2cggXI/WDcOEnDjiC7Vo3c7gn5ZvLAIYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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

On Mon, Aug 19, 2024 at 12:32:40PM +0200, Kamil Konieczny wrote:
> Allow a test to emit regex into dmesg to be read by runner when
> it will be generating results based on kernel dmesg. When it
> will encounter such message, runner will save it and then
> temporarily ignore kernel warnings or errors which matches given
> regex.
> 
> v2: check creation of regex in subtest run and bail out quickly
> on error, fix description (Zbigniew)
> v3: print error when compiling regex fails (Zbigniew)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  lib/igt_core.c | 24 ++++++++++++++++++++++++
>  lib/igt_core.h |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392..6eef25dd5 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3432,3 +3432,27 @@ int igt_pci_system_init(void)
>  
>  	return pthread_once(&once_control, __pci_system_init);
>  }
> +
> +/**
> + * igt_emit_ignore_dmesg_regex:
> + * @ignore_dmesg: string regex
> + *
> + * Emits a string for igt_runner to ignore next dmesg warns or errors which
> + * matches it.
> + */
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
> +{
> +	static const char mark_ignore_dmesg[] = "add ignored dmesg regex: ";
> +	GError *err = NULL;
> +	GRegex *re;
> +
> +	re = g_regex_new(ignore_dmesg_regex, G_REGEX_OPTIMIZE, 0, &err);
> +	if (err) {
> +		igt_debug("regexp: '%s'\n", err->message);
> +		g_error_free(err);
> +		igt_assert_f(re, "Error in regexp\n");
> +	}
> +
> +	g_regex_unref(re);
> +	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 06c5314bf..a437ff8ed 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1542,4 +1542,6 @@ static inline void igt_pci_system_cleanup(void)
>  {
>  }
>  
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
> +
>  #endif /* IGT_CORE_H */
> -- 
> 2.43.0
> 
