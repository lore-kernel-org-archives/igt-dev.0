Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479F3D60D08
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011BF10E596;
	Tue, 19 Nov 2024 01:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3RhYUOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866F10E598
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979506; x=1763515506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUFkgS+SCFghpBLck+Xqz50CqHJM6uAGZx1Jz47KZjQ=;
 b=F3RhYUOljM9147fpz4cbyfDkxPyffRZqtXAo8IAkE/h1aZOQO1OaV4M0
 TGPPhTP+Zm5rGKHnCT5ZX6o+QGTyG7qEOeQu9l8tx6/0gDth466WOM35u
 D0fMidenQ3RT8caix9FeXO1YvFdEnx2b87fQRjjiGwop55Z1/Eti2iO70
 gavXXpHgG7PFym45KebLpG35ABUGVC8+J7HHapbFAnt5x+I6bQmbEbkdJ
 TPffqOgu+uxzSSW0kieKVgmwTgtodq6QssyyQCcRuTKeLqFAo6dl6439I
 U1QCe6LQBA7a08wKnbchgvSaxF8DYuRe22gka8wYkQWU+JPTtJPJcOhBo Q==;
X-CSE-ConnectionGUID: 9ZIKoI2dS7OyWCwfPzjmeA==
X-CSE-MsgGUID: zGpJyNeeRx6gg6rrDPup9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31809455"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31809455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:25:06 -0800
X-CSE-ConnectionGUID: io1bbPGbQxusLqulKRoUOg==
X-CSE-MsgGUID: P2KX/WYdTASMyWzxmPhsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94212194"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:25:06 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:25:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:25:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIwMmd5DJh4kNkfD4OnVnQJqyEt5s+DsZ1uKmCGjGKuNbvzqtvRVOv4FL3MyYbMMWiTlX8DQ3siJGAYZa12KYBYLN+AP59hvlHpJuyCfHCNsXtIkx3Jz3EIgzrDxK8ewMXaDgE257I0PIWahv2JrvIVzmZXSbBbyhMt4E2J2Evs/QObcBr6+TqHC/VVM3LC88TRWXAeA7HnHjN6aTIKgcd/aOCOXNLU9edbuuqL0+8r//68VDJhHBNIrzTtE7S9/F9FQCZnpFYKEnyQA40QlFMTK8V2N3e7/Bv2a01TeAEeRJohQqXabM9nuZCzY609Ro3FPHvH24lwS75lu05xqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wvy5QRJfcKpBx29118borGtUHsvAzgC0SMH64sgrj8g=;
 b=CkhLdPEW4Jodfh1kdnjhI4T0m2OXbz76tB1kc3uufhmC/OTL9ZVdTmD+aiytB2u9+3zYb4GLk4E5MXlpZq+m6ueM3PpYp84Tmoi0IBbZFh2Z+XqKXkUR4viUSEKOKK4exDMDs08uUm6ER+0LuUWbpwToLpTaD6e5+J1UixIExFwL8kPYayrWuigu6IPci1IynHu/AHdFiL6QCh8hrRWBO6Od9biGuktxnlZ1z4bK0sR9Rv/MKwpldXZJAYZoQDEffGarwcxW6guCmgKS7g5ocNnw1BEtyIQC12cTdpTgN0BhMOC7umqR0But6yKW1Y0MJDyZK35O/ZnTLq6LoSFPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 19 Nov
 2024 01:25:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:25:01 +0000
Date: Mon, 18 Nov 2024 17:24:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/9] tests/device_reset: Stop unloading audio
Message-ID: <20241119012459.GZ4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 90de95dd-22c3-4300-99b0-08dd0838fd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ZWzpJdLHAaUmwnxBV17VGWMroStApztr59l+qm9GRa6IbdhWoQoKGFRjHy5?=
 =?us-ascii?Q?p7yZ3XdvUmONDtbRk9iMohFlbqvaIp3rjOAftgMz+MhctJPSeZko/I8OMwWP?=
 =?us-ascii?Q?YiSoFZdYBR4WhcjapKxYHEwQbYNMswZUXSmg1YiAsXVS8ym52/wDER0BG1cT?=
 =?us-ascii?Q?19cZuQfBZA3KZYsgwn0ORyzHfv3/m0m6Db+O+yUEa6JZZcLfAl1HzFAVXh/K?=
 =?us-ascii?Q?sNf7cVN43ufBIW+lIAzPs7/U1aP+MZ2MVQy4f33S8Bqdpd4Op9Fy7zYEWZXV?=
 =?us-ascii?Q?C5V+n1EfKiK41VdRdTul2cQE38ISOowhSdsQONxSHgGRxP0vG6N7blvC+1fB?=
 =?us-ascii?Q?lifLBpqrUgF+T4pElaEtZadbMgA6HCdCDjgknH06g/sc9qoyc+PCQVV/8n2E?=
 =?us-ascii?Q?KqKIBLpwZOMroFnZ9/82QE0kPQ1nablbSHjrQJoLZIb5ERR5I/qhnR83f3CP?=
 =?us-ascii?Q?AGaph1g80XdbXJtgi+ILxRmfIs1sjy3npVsEn99XEB9pl15FC0GtQ2fGbNi3?=
 =?us-ascii?Q?Lq9w588iP3dEQPpcHVBP2EIIIEAULT94r7Wr7jHMxrjpZJinPGMfnWWt22wr?=
 =?us-ascii?Q?XntNHlFrGEURcXvrvkcZkAfXHh5qRuzJ0doC0tKusGF9fVWuiLO+BguoaWPJ?=
 =?us-ascii?Q?U7fClJkoqvy6w+O8Nk4LMEhQLVKkK1/GGZJcgLSX+pA+4E+T29Qkb63Dwyja?=
 =?us-ascii?Q?CA53wJn3V85ViCsP1tTjV8uC/X5N23QerINwi2VYkogGcvcxVF/tOPDFrmUG?=
 =?us-ascii?Q?62XLV8I/zkPf+fmTo1N8ljb+qpylX8I55lF6REn+6qSLQ0CVClMg2C9nMLMh?=
 =?us-ascii?Q?f4PWhD+v2W9xpwUF8xEFpEP07wkIhR2dwgwIcOQql52vYwvlAB1UW9Yn/r02?=
 =?us-ascii?Q?wqe9pdCBTDNSJv2Z9cg9KM7kV2GNSd6xrkYQoYa4dVo5WxsGLdFy3CABedTa?=
 =?us-ascii?Q?T42G8cahHZhQzOgjvtTssc1N86yAQEChv7cn1ojsgsn1MIQgW1TuTCXWBiQ5?=
 =?us-ascii?Q?et6/U1LjwTop8PRPy2RaDrPyqeeALt0dbOM4COuWpfyAWuRE+G9LeVO7bv7N?=
 =?us-ascii?Q?NSvkP3M/ajmNl1JHSofN8mDMlJ0HlmWLdXktEijzrkZG1ukCZhomwxSFAJyZ?=
 =?us-ascii?Q?Qn0b6l3Qm3jBAgwdK6Ar+/kreRDakSnlBB2dfREisl4unEOKCAq3ZRI6EN2n?=
 =?us-ascii?Q?ell6sirS10r8l7PxJB23to6bpVVljQgylu2GZL3lRtyK61b/qJI/PNwaz/cq?=
 =?us-ascii?Q?LFEa146/MG6g2JbwrIOYSoHjGeOfWwrOrLXcKsTPYELMsqVMrAb32gcKeOa/?=
 =?us-ascii?Q?eSThuGNQixK0JGwNzxHNAmvC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rkCh+eg7+kV/hSEmYe0PQ6yWm3IS81NFG2J6gTk8rOR7YHwEA12eKP/EEWCV?=
 =?us-ascii?Q?oJteAlVez/ik7w27ZbEYQmAjJyAVMBSCiZR2sOKNRmRCEMtIjoz9pMAM5MRJ?=
 =?us-ascii?Q?6RkbW21SKQ7SmqfqpXDjVHCZuc5kBaTxTVtwuZ7d+/lIxKWxdGIyPb4E+Orq?=
 =?us-ascii?Q?wQrftAROKPKpjmNetKA6yXHzJikn2JFhiXviNMYsO6g7qtG60Y5z2zo5cPMx?=
 =?us-ascii?Q?c4lYcjOXyUxG/ZwQLsc9XQD8JZvnXg/shpUag0CR1y54XUckTAJK7Okwxnt2?=
 =?us-ascii?Q?/oter0y2bkEKbdJp/3bibGxnqbyyjMpglucwqLAIWxsgUA4W2Q9yoqWMZpZT?=
 =?us-ascii?Q?IuEaIFe1PHpc2Umkwy6fB9BohKY7QXV38gsnBeYFJDIySwHW3NFX9QAI1AkW?=
 =?us-ascii?Q?S1VhnObZbwpUvqithX1y8+obOyF3fek40zrdqppaR7hMwlTLCBU5zAbsR25N?=
 =?us-ascii?Q?cnkitqc+LhKx+fL4vGwbX7nTfRSyJwArwWBtDNO6yMBlHrZJUE8GRbEFVbod?=
 =?us-ascii?Q?5Wl75mt0nYd2TlVYNNfRE2ilPEpA3apkPTx3ttRMLQOMxvExTBlWgeIlGufY?=
 =?us-ascii?Q?WQhDelNvC7tX2KYs/0oOSSuWzK1WsBTyfb8qxT+1/pCMt71afmAJ4Q1tN1Ew?=
 =?us-ascii?Q?77o6C/FrYCC0fgr5bP1t6f7kyzop78C8Vmf+f4CI9Mi6lOl9cwSa5NEs11Sw?=
 =?us-ascii?Q?JvUP+Wsd8Rtur4xDZRTVZ8g1kn/w97RdsyWDAD+pIya7sfDTeVgN1uAWkfco?=
 =?us-ascii?Q?ZWav1gw0iyCUdirzZX9mxpmwssk0yjTDv+ErmLNahDzkNNhu56YfrWR7p8q8?=
 =?us-ascii?Q?BGIn9Dq0VrUJrBJo4jamMfJqd2VjeCOOL4JNwTxKSb3HfhSDW4G0YnKPT+n1?=
 =?us-ascii?Q?sEsoEpIEk4CVMjm7KBZRDqczPbcFU6ehqvcsE+4iGtmgdef87UN1xCeu760Q?=
 =?us-ascii?Q?hqeHT3T0F3LUUQkXC6V4rGkbVdgOk8aKgg5bo/FbRtiuqHm7EkHmTEZuobpU?=
 =?us-ascii?Q?dhyLoGnqb9lg6plnhTUdZmLOQlm0ojyiVyG9z2LEM4C1t5wZOhAyUtVtGYDI?=
 =?us-ascii?Q?+iwtVCgAb2KJhErgAz5DayWCE32C1Bl2vFLSOuS8a2/4VdvyOYb1X8csq7oM?=
 =?us-ascii?Q?rL60BHoceafYQ6dOQS0tSjIWp/rUKtw4qx9XV6Ad8Gyiin+9fyiT/pos1d2C?=
 =?us-ascii?Q?UdQfOkDW2GL+NYMH7eHMOTEnfMNE+uS4dbOcxdIeaaGGiwX6hY3ClkknwPh8?=
 =?us-ascii?Q?KFigJJsJ2auMPBUmmmYMETd6QOTNIjVztr9nKB8VfGGxbhsTcY/OuIvOu/f4?=
 =?us-ascii?Q?+OGKOTZO0ehTqEUWKEbMeMkCsuyNkfbG3DXUkrxQ47f9Fw5XqW2MpptxUC0t?=
 =?us-ascii?Q?Gr1GLcHcL2SF9zI+fldxP1BtWccPLNCiENz9lXJfH+/w6pdqT11kjZtjGEA7?=
 =?us-ascii?Q?AjVPQ2oo6JIEHHruqZ4g8Yx4ayVC8v9aaba9nuJBsBmmGWTEZaKjIgz3y19l?=
 =?us-ascii?Q?WlFLsV+cOPOHni1lRRvKUDJz82fuHxH20jImDrSgcK3DMNaKPffRcBJL8ZNg?=
 =?us-ascii?Q?CNvXRp2ZKbMtxawDrCdaKpcGOX3EPIBxo5c/Vz+JLy7DI7uVS1AwpBFZFzhk?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90de95dd-22c3-4300-99b0-08dd0838fd43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:25:01.7755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoFT3lH77ml32J4jIb1JqS7ZQcvQr+hcD6lSRwAzYFneIM+uoJd9QYzSqNE2DdKEERTY+QeIets7ARE1jF92WMf8qMmDCh5wWAUIrDSBqxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Mon, Nov 04, 2024 at 10:18:42PM -0800, Lucas De Marchi wrote:
> Not needed anymore and test should succeed when unbinding the device
> from the driver.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/device_reset.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 40681931c..668ba8526 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -64,7 +64,6 @@ struct device_fds {
>  		int slot_dir; /* pci hotplug slots fd */
>  	} fds;
>  	char dev_bus_addr[DEV_BUS_ADDR_LEN];
> -	char *snd_driver;
>  };
>  
>  static int __open_sysfs_dir(int fd, const char* path)
> @@ -345,9 +344,6 @@ static bool has_cold_reset(int slot_dir, const char **reason)
>  /* Unbind the driver from the device */
>  static void driver_unbind(struct device_fds *dev)
>  {
> -	if (is_i915_device(dev->fds.dev))
> -		igt_audio_driver_unload(&dev->snd_driver);
> -
>  	igt_debug("unbind the driver from the device\n");
>  	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
>  		   dev->dev_bus_addr));
> @@ -359,9 +355,6 @@ static void driver_bind(struct device_fds *dev)
>  	igt_debug("rebind the driver to the device\n");
>  	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
>  		       dev->dev_bus_addr), "driver rebind failed");
> -
> -	if (dev->snd_driver)
> -		igt_kmod_load(dev->snd_driver, NULL);
>  }
>  
>  /* Initiate device reset */
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
