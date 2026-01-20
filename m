Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8EFD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82510E179;
	Tue, 20 Jan 2026 09:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emU870aJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6E10E3DC
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768900720; x=1800436720;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EenpmiSd4P/lgVVxo4HKi2vRTqG+5kOmZj11AqpYOsQ=;
 b=emU870aJGI8OLlJzhPhzi/3Acn3PNp9HnFRXmqqn+oUsX3mi0569Cxx1
 hkhupwJZc+IOIrTy29GeeDE+JF5N4WmIJWsrySnViCzPyqjxjwi+zfjnq
 B3zh/jhbM1ssB9/0wIy5TFp3eryTZUwO7e74q3T5Hmq+UWC41LMKkH7sT
 IMg8dVzfa6EY5XByMITPDt6v3ejxANj6DvTrFOgPGdSdIxBQIWOMwFE4S
 an5+TZ9FflTJSEUOCEEJyFouGuixRX20Rd4WrQEJy3b9vEiGbxT17g71E
 SF/2KCKczoLgfWmIkPn2ovw2puUlvGz8oC13elWEu7KMM78jTrEK+k/sd w==;
X-CSE-ConnectionGUID: q6hcaA3/QTKduynjcFZ54g==
X-CSE-MsgGUID: myLjqjJjS127j8c12Q0DpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70191520"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70191520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:18:40 -0800
X-CSE-ConnectionGUID: AfRlaK49QU+k3j6M286R+A==
X-CSE-MsgGUID: axn1fBH2S06+PskFXVQNfw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:18:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:18:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 01:18:39 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:18:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xd8ofEL3a8N8CiK4Qgp2dNhdN/AfUFjz06ePzbWqO+3dtcBN8GZTwMCXIwCtgSZiNpXHDtZWM7QfQMuPLkegU2f7sLEfe+yz2iJ9/pGYmWguasU0M91m/OJWdWyfPIL9BTrQx1t01ans20sKixvbC1EZNzgRs/404UlSAy7KMxc/L4UU8Rv123KLjTiu9Jh2LotnZCtKL5mkfQm1JEN68RRULLdfHqBsL3Kj3huR4uIiJw6PFOj49HF8q7nORNuewyqh1TMMb3+SxBLeRpwNCJk0i7hofDVqlOnzcBRBslwgt+8TXYR6vtQuwDRTHvbU/Yc7ESyCSi48F7Ry2WkMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h35ySVFKG1BUG2bICLIw9aG1n2B+1TQM/HwjT6BIi9k=;
 b=mmluXI9/Ir5zB4DQHH8sHANhVlmV08h/SIps9oXUNrcVgGZyx0RSewLk8OuLg+pAlMRGCTnfmMKcLecPMWEB4PFmpzN2FDo9amCGivGs4fVwOKIoQFG3hbHsEpXkejVXvrKIzoJApqOUN5cUh2p0Yz0R0fxmHGTtNcQVniSV4cSVY22JZ3eknC4zDHteSUnoIAdgBoAeYTgvjiQnj5VwjAWCgE/vm1Qat4i1A6PR4jjrzD15PlMa8PfxLKL0hjwz4D0IYT4vLLdNKYije7GwBfj9nzi3HZr4abcscFEvUQIw7WVyg4MzAfE/3KcXO1FbMMHdHyFO/iHB2zrOzZ5aVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:18:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:18:31 +0000
Message-ID: <0037a53b-3374-49e7-b28c-3fa88cc1e200@intel.com>
Date: Tue, 20 Jan 2026 14:48:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update display blocklist
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260120090632.144336-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260120090632.144336-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7caa14-7fc2-4984-0866-08de5804e0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cllCWGR0U2dhaHY0Znk2emw4SEVOalphYkNxTkxLa29yNUl3bmR0WXdrUEh4?=
 =?utf-8?B?dWg3ajVxRU9vWWJYblRnckpoL3ZKamkyOU5XTFlDUktaNFd6VUhaQnpOQ3JZ?=
 =?utf-8?B?ViswUmp2d1pXSTVyU1ZXNkd6Wm9FT0dKNjI1RklqK1J1RHZOSVBJTFBJR0Yw?=
 =?utf-8?B?U2tsRUU1REswK1BQZXBiTHczWDlqVGUrTFR0WmE0SDZwZ3ZZUDFOWGVXRWd0?=
 =?utf-8?B?SGxpWTBDNUVsTWZvd0oxSW9Cc1JDRlJ2S1hnVUpHckZ4WFdQQUMySFB6WHJR?=
 =?utf-8?B?U2crZWkveEFGSk1HQmM0SnpqWVNNMjRrUlJxbWozMjI1VWhPQnpjQmtKRUE4?=
 =?utf-8?B?dTRhUGE5OVMvdmkzUVhudVRsa0NZVEZ1RjdxRkxobDRLSGRrWjlPWjV0L1NS?=
 =?utf-8?B?NWV6bmNFRWJwYWFCaDBDcG1HTnpxSHBpWmROa2pmeThZd0NrKzIwSFBxRGJZ?=
 =?utf-8?B?WFZnMHJvTkZQT3BjL25WVDJaT1lHd01LM3lFZkRMV0hkc2dJbDRrY2ZwR1h1?=
 =?utf-8?B?bXhtRWI2b0dQSzFoSGtJQnE0ZEQxSHh5TkhZc3I4UnB1SjRubG1uci8vcDY5?=
 =?utf-8?B?NElRaENkMWZyUnhSVzRxVnFvOTk2MGlwUzQ2UEdPYkRvcHBtbDNoZDRvVDI3?=
 =?utf-8?B?Wmc4UHJvbkp1ZlVMbk9wT0FiQUtzZmp6YXprTHA5Ui9wS0pZZlU4RnNtcFR1?=
 =?utf-8?B?OUpONmt4TXRyRC8rOEFqWStQR3RyZnRVbHhWZDVsbWhONjJ6aXZOc0lMeU02?=
 =?utf-8?B?WnAxVVk4Ly9YeFp2a0MxSTJRbkMzV0YzNUNpWG50blhac0JjczVoSVY3T2tG?=
 =?utf-8?B?T2xIWXg5Tzc1TTVtUEd4V1EzeFVoZ0dScnRrdWV2aG9QTTl5aXZYR2xyMm04?=
 =?utf-8?B?RS9oN2NYSW45TlZ4YmZpS3ZBWGRldzNRSHI1ejVERG1tdTA1WTNBdEQ1c3dx?=
 =?utf-8?B?VWlvSEhQQzVGUEtBZnFpVER4T0pTU3ZvUjlIa2lDeE0vYzA4QXRzZFY1ZW1M?=
 =?utf-8?B?YTFYVTNHeTRJdEVaUC94eUV5WDB3MzBKNWQ4MTFNemxvNWd3a3FPUWgwNU5U?=
 =?utf-8?B?ZFdTRGQxc0R0TGt2WUdObTB3a3lCdXRhZzRIT0xzeU9STHpVQXRUM29nKzQy?=
 =?utf-8?B?S0RaN1hWS3I2MEUrdGZlQWtnajRqeExPRWpLZm15MEZCK3ZVaEU4citsV0xl?=
 =?utf-8?B?UU5IS3J4bTlncEowaEtDTTNIWHE0S1dOVlI0djNDQ0tzL2ZlR0hVVFJpaEFj?=
 =?utf-8?B?eVhudFRJVi9obEgrVGtIdXVTdG5qTGRqbWJJRC91aWw4bmNJWUlRNWxKN3Ur?=
 =?utf-8?B?ZU1yeVNkU0Zya01LQWJzcGlHVDVhbUdaWmNraVRJOGNQcWFHYnNRdmlGYU4r?=
 =?utf-8?B?UG9OTUY3Y3c5QTJITHNLZlR3WXUvTkZ0bDNqczZ5V2RHNXpXMDJlVi9Icytw?=
 =?utf-8?B?Ukh5Mm50MVJ2U3RaeDBNaTZBZVhiQWNmTjVURG5Pc1oxcjdFSnJYUVViY2Rk?=
 =?utf-8?B?UHdnZkhSY1RQa0tZNkl3Vkk2VU1Gd2tvbHFZQ3NUMktHdmEra0lLVC9OTUl6?=
 =?utf-8?B?SkdiYms5cm5BUHBEWFB3YVppY1RpSlNmMXloalZJa0N6OXZDbDFZd3p5RVJs?=
 =?utf-8?B?elJTREYxRWtkakxJQWw4N1MzVkN5cVNUY2tteGlsd2c4NVlyOXJQT3FPYnJU?=
 =?utf-8?B?eS9PQ0h2UHhLaElEVXJrdVZkY0lVamhCWXE1Q2pVNVkwN3JYOXpoMEI1OVlO?=
 =?utf-8?B?UU55MkZlNlBHcEFwWDg0WFB3OE1icU1KNll0bWVkUU5HSVdWVDBoejlJTTFP?=
 =?utf-8?B?NEhFcUQ3cVhoeVU1czJlbEhtdmsxNDJnVkdFVW5PbFhXZytLOFUxM0t2T0Ns?=
 =?utf-8?B?YnEreTJnSHBXWnJvaVRTTXRCQWJLOVBwc0hYQkNnOXM5enl5OHM1dEo4UGUz?=
 =?utf-8?B?S0RqS1UreStEWGVRcVNCSENmRjZkWDdUUm83WDk4VmhGVSszRW91d0EvWFgy?=
 =?utf-8?B?VENBTmQyT0YvUnlqNTdZL2dveGFVRHVHMDNXNlZCcFh4L0pCZjRBZ3NRNFc2?=
 =?utf-8?B?TitueHJoTFVuUUF5OHFxQjNwdHVxVThkTWMxdHo4WlRabS9CZ1dxNGxzTzgz?=
 =?utf-8?Q?DH48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTQ5S0QyTmdtMFFKWWxIQ1gwYUluZ3A5NUZJNnhOdkZ2L2FsU0d1RTVCOUd2?=
 =?utf-8?B?TGVtUk5KK1cxazJNaThkdlp5Z2lHd2MyTkVyOGJoZXFjN0ZlTXB5cGR2OTRp?=
 =?utf-8?B?dzlQZHJNZmZUMmk2clNqWko2ZU1RMUx6VnF4V0lHZEVQbGczdS9FTXdWWFlP?=
 =?utf-8?B?cFI5NGlYM29pZHptNmdOVndMTWphRGZPbzJ6UnNNV25sZlM1c0lmVXhPUko3?=
 =?utf-8?B?MGlBVnFTOGNWeWZGQWJHUDdMbmxOYVIxNS9qNjNTRnEydC9ybmUzeXhEQ3RF?=
 =?utf-8?B?RlhKMFVkZnJ0V0hSTWV6SlNhYTM0Q0Q4aVFCM0UrTXdsWjRGNmFBU1ZELzBT?=
 =?utf-8?B?cVdJd3JmQ2MwaWprVGlQS0Z1WG9ldjB4a1J3QkNqZjRicFVnYlltaWtIQTdR?=
 =?utf-8?B?V3U2dkk1S3NkWVhQamxhVmRYVE50bzFKRUkzRWkxOCtxbmpHUzYyUFNlTEc0?=
 =?utf-8?B?bDJKMHJlcXJrNXdpZm9Ld1d1NnpXdlBEa2E5aXRBdTJCbmkwUCtYTHBLMW00?=
 =?utf-8?B?azZxa25jU25TMWZpV2QweE5QOVEwQk0vT0wxNWlIYlFLVEVlTWFNMXhJSWlr?=
 =?utf-8?B?dGt5N0UxY2luWUU5cXNpSEJrV0VkUXdPOElWbWRJNGpMMzdBaVNFUklxajJy?=
 =?utf-8?B?bVhlNHlOSC9WM05PNTgrZjlPeHNMbHhudExWdSs5ZmFUSEVkSEVNSmVCYXdC?=
 =?utf-8?B?VHVUS0xUdFpPdEZhTUR5cjdmMHRNRDF3cWpOU0FtMFo2ckpkVnR2RjR2VUt1?=
 =?utf-8?B?ajI4eVMwcS9GTHRPMVpXc0lZZC9qWkVUc2lrei9uN3FzbHdXZXEzd3doemlX?=
 =?utf-8?B?cm4yQkJoaEppWkUwM3Z3WTcxeHpaSnhjbTNCRHZ4Q0dpS2pxUkowS0p5ektl?=
 =?utf-8?B?TDlHRmNYV3dCVUZTdmNURFRzSHNUYXZxWXBPMzFrOSsycUZmQVlObnByYWk4?=
 =?utf-8?B?c1NpOGtUU1Vxa3JCWk1WRXJ2M3RVN1NoeU5tUk12U2E5cjV4NjFUekNVSzNz?=
 =?utf-8?B?VElsUGNZZHdLWDBVakhpQ3k2TWZDcWJRTU1TY1FxV1cwRFFScjlPWXJHd0Yv?=
 =?utf-8?B?Rlhic0lFb1NMWWtLNlUwZEwwWnBDck1SNGxsWGQybG1Jbjk4RndVcXU3UlRu?=
 =?utf-8?B?dWdaVjlvcG1UVGFPWXNJWkxPMG5UL1ZubFYxemNpTndTd0RyUkVMbC9sbUtN?=
 =?utf-8?B?aXF6R0MzM3J4aDM4cGordjhoazJ4RzE1UWJEUGt2QWhGbTVxYjkwOGhtZHZl?=
 =?utf-8?B?VGpBWXhzRmdNR3ZyRmdzSVBpaU12YmpYTWIwb3JYVXhTeUpNTXpSUWVtN3kr?=
 =?utf-8?B?M2RsWWZPSG1hVWVQbUc2UU9oUGd5RkpMbWFvV01LcnVjVVVsZXlnbkdwK0pI?=
 =?utf-8?B?Y3FTRGpzR3RML0c2a2phaHZRNG82emFHWGsza1dlNnN2YVVVT2xhRzlZUE9Y?=
 =?utf-8?B?L3o1aU1VRm9mWU1NRit6eXUzOExKeVhUek94Q0NUQVNHUjYrYzYxNlRvWUhv?=
 =?utf-8?B?aWxzTndZOGJYMEVXYndCd3FyVFVndlJSVG0ybmliN0p4MUM0UDZCOElIYkpW?=
 =?utf-8?B?WjVDUXBtNmJtc0ZoQjRSdWRycFFaRU4zWi9XckJKNzRURm5WdG5oVlFkNjAr?=
 =?utf-8?B?ZUc1QVdUSUwvWlcxRVROaGV5d2JRR0NVc3FySFFmK3dVSjlwdWhMckdhZ2x1?=
 =?utf-8?B?VGxaSlVjMXJUcjlMU2N3YWp0TENZQWtwZTMyWk1OOXQxNkVRTDNOM1R0ZytO?=
 =?utf-8?B?TmRVZ0prZmJ2eERpVzEwS2ZsQ1hGSys2bjNRUWlZZlA2bEJnQ0VHRG9CTGpL?=
 =?utf-8?B?bytsSER1SmVxMG1MSUg2YjBOMnJ6UDJpVmxnU2dGc3hJcmx1WmJRclgvSSsr?=
 =?utf-8?B?eHBWblJTRzNlL3YxTHRSRkVPRkVkb3pYcVBSWnhOYnNaR2NDb0ppS2dJOFhW?=
 =?utf-8?B?WS9hdmNEUStBb2MrVW5RTmdmUndHc21NeWpCWWRHWGhzUWJuR1l1czVVbitR?=
 =?utf-8?B?Uy81dW1KTXRKSlI2KzBkdldxQmJCQ1kwU3F6aU5uRm1QUGFiQU9mUi9MMnpD?=
 =?utf-8?B?NEdzRHc4d1VCWnVkcWdncTNzTVhBUUUyT2szOWhlT0VybHZ1SHZIN2dVWlh1?=
 =?utf-8?B?MG1uZHUrZDd5eTI2UDA4eklNV2pNcE13UlFkOWRJYks4MXRIYlR1ZTJoMWJh?=
 =?utf-8?B?MUFZRzlleHc1dnJzNUhXQWdOd0ptZlVKWVdkTThBNk9DOUJQR0crcjFNVmNN?=
 =?utf-8?B?cUpsV1RXMVo4cm9vSDlCU2RicThjazJlaEFQbEdyNSsxSHp5QjZVVWxrZmVT?=
 =?utf-8?B?ZDFZK2sxTy9RYkRqUnBCWktsQllFNm5sK2JrYmp0b0s5Q1VLSEdNUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7caa14-7fc2-4984-0866-08de5804e0fe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:18:31.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXs1th9WKGmzcSYShVWs4zw+VEVBVuOqUyyhAgbcn1OPtafnhixTC4aiKxXvKWLpZ1e7S3KyamnvjaFtvDuMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

Hi Jeevan,

Please add this test on the i915.blocklist as well.

Also on the commit subject, would be good if we're more specific so that 
we avoid duplicate commit subjects.

Thanks and Regards,
Karthik.B.S
On 1/20/2026 2:36 PM, Jeevan B wrote:
> Add tests using argb161616f format, as this pixel format
> is only supported from display version 35 onwards.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   3 files changed, 12 insertions(+)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 919be620d..2c0c4a0e8 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -173,3 +173,7 @@ igt@kms_pm_dc@dc5-retention-flops
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 6cc61b98f..d92e12d64 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -183,3 +183,7 @@ igt@kms_pm_rpm@package-g7
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index a29c515b9..e9d0775e7 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_pm_rpm@package-g7
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
