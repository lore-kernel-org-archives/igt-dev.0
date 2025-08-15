Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF10CA0EE4
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 22:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4033110E9B9;
	Fri, 15 Aug 2025 22:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daaQJbHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C42B10E9B9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755295998; x=1786831998;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UIzey6Mnty1u3xzSXZds6yiuCW1oro2YAzto7zfAVyM=;
 b=daaQJbHMsalUAklW7CDC6SbXcLXGTZLSTWZOwSRsrwLU8aZ58GKrcWae
 VwDL4q6Lvwh5ANNCRTtp/+x2SbbOF0JNkldzgtIyLAJYKQoRYlMAYF0il
 ltUUB4IWdE6tuDGr8u0iHZkFSDka6U/Oy7QdPkat61anLi41j+3+I12KW
 MOyT+bkiwxMoT1hnc8ZQqzKnx5idfO2MMetk0cHO49cCaU12btV/EEdB+
 7hGku9BpylGkuHSUBA2iMv0jH8eTngKLMmQJetLs2qYpim4NK1C+Ty7xL
 ejcn9b76MjTeLl9gEQYX+ipih28CBOoAq1CQJ1DHC/nbels+oXfA59T9x w==;
X-CSE-ConnectionGUID: sKdtaQ4YQFO0sKT4tcWgaA==
X-CSE-MsgGUID: PGBiXKkYTTWtL+SavwGZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61432538"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61432538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:13:18 -0700
X-CSE-ConnectionGUID: 0xohfMv7RlS636Q57U+Etg==
X-CSE-MsgGUID: I4dq8zdmRbCjU9GZ2yIkMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167918390"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:13:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:13:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 15:13:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1jl836QC54Ahi7dzj4S9tldNFJXZ4CM+URh0XTIM3dnzSd2Cvh2aShz0AD6xZvb2quqWwqCI98+XyCrl/zQAmbQewE55e7fI86fKzy99tVRy19xV1CSK97CXCrIOFkatORSF4Csn4nlpaadgot7CbI/qPNRvq3+2BxoZLws7T6+6xb5JvhxsnBvoM8YojJm8e7f2IVipKNwalwDEVQM5AH2+q1UR7H7zeAb+Lrl+TUwfWInGaBkMM7XR+8lEK1JDrAs8siEBFT1Ekd0Ttp+1UaroZiWlwbsJZ3pY2TW/I1A1o1YSd/wAHMqQnJyvVhw3Q9sLlwBMlpDAQHVbuK50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EObTFMxKqXCjltGkxXs0ULGvmeb7iDITs5tFCyTwudk=;
 b=SQeCbnRI71I7z1UwDHBY5kNx/wBcO4qmhAb328Q/Fd7k6zngfF/uz2txGAm3uWa7Saa1nsjfB3S34bSYRljK/PaFa0jgo4bfsnuPGnN2YPCe8tLNMwaIMjpDCKUnTiOUxpEhZitnurkTREWUHWge/tRNnXDYsz+sZxbepr9KJv/I4sb3NFxrj1JTS67G8kyScYQNySdDo946t90VVHJHUDw/SeQOLocSVkvv1a2unzkMMpmQ/qzENM0HUGFJfI46miDHhBIlIyyjeR4dF+/RrQ8a3lYxix2Gzq/SAiG3uJ+XqT9xyQb4b7IH89u6q6Hkrjvf/9e02QcI/4x50+aMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 22:13:14 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:13:14 +0000
Date: Fri, 15 Aug 2025 18:13:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, Riana Tauro
 <riana.tauro@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC i-g-t v3 1/1] tools/RAS: A tool to read error counters
Message-ID: <aJ-w9lLLOg6Zi3I5@intel.com>
References: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
 <20250730061342.1380217-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730061342.1380217-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: e3572451-a93f-449a-a568-08dddc48edc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3BM9Qfbw4S5y2YsT6M20IYax1XHswJhfwMoXVovgUeFjKkM384JyoZ8fgP?=
 =?iso-8859-1?Q?TJYM7SIiYrD1BJE46fJwUrDXWjGXAG86Xkm13XWJo3Yhm8b/ocGO6jKwDg?=
 =?iso-8859-1?Q?EPUOCS0V6OXtX0e207ee1kmdQaJR4RMyrVh77c7vmNmkFrV4qM+TnYOnDo?=
 =?iso-8859-1?Q?D5HDzR5t2xsM+n76Bl9vJ5KoqLuQIzWL1IZ39hChd9fEqtdbneaIOqj8XF?=
 =?iso-8859-1?Q?AENCoJ3P6hZq3l5OCwQbUykCfWz6rLs/Hgn0q2qi2gqBO9e6iFF4sEtpBB?=
 =?iso-8859-1?Q?dcdqH3Ve528qYIfSICO3SpnnCTM2usUBA5eaxV6c9+UDWxjkbBoaXCfBK+?=
 =?iso-8859-1?Q?dmFe+s7l7v5+/IiYkeppQfNUJbhXcXrq6/Xmx/sgsVJo8ZxedvYmuRiCW6?=
 =?iso-8859-1?Q?VbibouYlBtpoTUIjq/iwJyDdmEpR9A3FwthM7M7V7tAwEzw8pFk7pWyR6i?=
 =?iso-8859-1?Q?afoJ8ymq9MUKU4PuZV70znJJZcNovajEHj4m6elEj2BqwXfP/KngiASRWB?=
 =?iso-8859-1?Q?3WEae4qoZPDrPKMLtYw+FJiTL1cyzlNpv1TW1/hY4PQc/mvfoyelt8imNa?=
 =?iso-8859-1?Q?6OgOzv+a6Ofjv5AydLUqwyxisqUnElenTYtxcchYyWaopbtpC2MUoxWXIP?=
 =?iso-8859-1?Q?lMqUE2jsKPfyblxa/QXy4kWfJFwZtIpyciMEKss5ROl8w3ZwcyQZNO68Xr?=
 =?iso-8859-1?Q?ykeWq1it5ChMwBZa27eSua/gRdKOwsAmcb8yvDL/T49zHfeRbRhwymWPI2?=
 =?iso-8859-1?Q?396baxoCRyrAa5JUPlgniWd7IZcy9kfpz1LIBpfBGoHMWF39L8RMKP0sau?=
 =?iso-8859-1?Q?jaFGxvJAvRuk0bB/FD1gl1i0wIkAi5QcUUiQzCfVX7dB+/ob8fusNgl/qh?=
 =?iso-8859-1?Q?qGBs/ZyQAfQOR8xuTwo/BSJ8+HcPaVijSn2uQfQRS/gW62pdLd6Lmw6gUj?=
 =?iso-8859-1?Q?3/O/DcsUUpbDV8JOyIqkalW3KlAH6yVxN4+TG07XxbHfgbGr3b0oj72YYD?=
 =?iso-8859-1?Q?PAZ5p22JEc/b9qSUrTm6pC976OanPLzU2KBKet7+tRlO1AWPKTR3yg3z+9?=
 =?iso-8859-1?Q?EUn4uA7yFK1E2GtsB8eydNFKRhgZXGJhlDLhgYq/Yy4exFVG7QEmngCFVc?=
 =?iso-8859-1?Q?i5OOEpCUtQtgJVgfpQt3t42h8xwkP4VvFyrTKxHpHP/r12scit3WUnd0Wd?=
 =?iso-8859-1?Q?ZOnyN63n+5UpL1sK6WFIhO4oQGY56MHBSA1P5VU6e8lp7p6jMCqhdP0qTV?=
 =?iso-8859-1?Q?ZuSprSPCSjb3+mt6DYWzNbNnM1ZdqJuumxtMu343dTw8PtDw0gEV8q1XUq?=
 =?iso-8859-1?Q?GJOL1nFYDHqUDMetDavf0ViIA0cYOBegReinMj2QffQzqtJSJrCvJkTC/H?=
 =?iso-8859-1?Q?BHHSJUN64mm7iYj82F6tZFAsPILASrD5HJDYEyob3i5vw409oii8xDPic4?=
 =?iso-8859-1?Q?CWI9CB8JL4yo/l6cPrQGygPG6OS7sfhyqwp6Vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g83NNnTFIva7J2X5yPs7Aa3h3iq6SDg1DV0yEsXMfjDz9DdDf+GNa8PXLc?=
 =?iso-8859-1?Q?Pxnki2corsMRJg9rEFD3+UBXRc9RMQ5Q51eupDMtEUsfLxqn66wrOxuzfq?=
 =?iso-8859-1?Q?ZCas8ZzlLR7C0UI1Gf7YW6068J+MQ10a6Lvoz26MyOkWhTqSjKEfdcwGHc?=
 =?iso-8859-1?Q?0LXQeBRoNW5p+sdVF2+UIxqL7k8LNbVloqQ6V70tNWuJsyKyRcvbruJ6gY?=
 =?iso-8859-1?Q?FvnqHlrMexrJl63AtrW50NFPIE/F6cUnkGBj5M1JOcXB2mPUsB1w/SpLQA?=
 =?iso-8859-1?Q?tAa1UgMuSSZpcVzHsIAH8v1RrLhSh8yH5K1nwOyS29w41O+pTguSA9ONRw?=
 =?iso-8859-1?Q?owqpqb8Katt8+z59sfNPLOXVq+rIsOsQxWmQEpMd3nVxZbPY/GF3s1FOog?=
 =?iso-8859-1?Q?vdKJYpNIQsttUXpVCC2296XX6O/kj+qFiuMIxQtq63oncNhKmtg8wncjmK?=
 =?iso-8859-1?Q?7pgHzeBUGkzvRmE6+EUUpwLr9tGBKp3F2dh1HtYgnK0CnUyQtqq4MK69Zy?=
 =?iso-8859-1?Q?R/rv0MbNtLy2teT3mvleJb9idPF9DLMDozTFEIJRmOH0WLRB4i45tF4p3M?=
 =?iso-8859-1?Q?vMJRE2Z3B0UCYLfSwUQMQ0ghL+5fh5Mz97kvF3QdAwKNKQuI3Odl+tjzat?=
 =?iso-8859-1?Q?va30boer+6XkF0gEWkPjgcyMJ3m6r3uwJeBlpCgGpzyU1so5o8m31Sp5+1?=
 =?iso-8859-1?Q?ZiHLIwLkMmUV1uyg4uXYzb5pUCPRxwlozsdrj36g8EO0+qqQA/s4UyLH2b?=
 =?iso-8859-1?Q?1G/Vf1vWGDhFEO5g5x7b0RVYEm94QTGrhukU6Rmv2hjENUIfDBzHNUF1XE?=
 =?iso-8859-1?Q?6yV+VKRERXWbByp8PnfmfW3IEwttAI0lipQAwnZv0Q0G+DM0cUHYa4DYVc?=
 =?iso-8859-1?Q?I9QF7UGW56yq5jpf0YibxW8FeEUOOHON18X74R0SvIzm0CbWkz8Dvg4TMD?=
 =?iso-8859-1?Q?auX5QKeG9Sn6tKOvUD7Kpa7zu/pDWU0LmvjFEihnv0xZgrIV3NLizx777Z?=
 =?iso-8859-1?Q?vY6wNWskR/KVi/OLJK6kLZQ/lAsXxf8296jrXDCknXzTUl7UamdoJjBBjd?=
 =?iso-8859-1?Q?9NQ5ZSCDskeesjE+Ec5eRBwu47zM55ilGYTzHuAlCRRw3kpYoqI+1nNfmJ?=
 =?iso-8859-1?Q?ZmBJkQmBFDaZGz3fe7pvPnMjJxf5qiTFEAFK2jPeNoi/ukUChgNd5B/5sK?=
 =?iso-8859-1?Q?nr7f8u9YWJllx6RgBkhEziN1KSwldSRFbpkXxJjrwCoQLKTtrvCWunUasl?=
 =?iso-8859-1?Q?4AlwYBpFNxee1tseO9F89mJ2zIz9JlA/RVVMfa4uScvL2+i0mUQWT56d7a?=
 =?iso-8859-1?Q?D5R5mMfLv1lMlIKUpNVub99FdCU5E/r16SqE0/f6cSGVLQw5fNAgnvDtB/?=
 =?iso-8859-1?Q?QG5hPqoEPC5oFO2JOjK7j0IjbfQMssAJs0abO7o3Dyf+nIf+uwhGPEt7ep?=
 =?iso-8859-1?Q?auCYxcgG+l/h8HF13TBCqm8fYzrM7cZqtzGvnxoICraNWC5I/0RhFaP4xe?=
 =?iso-8859-1?Q?v8ouoZeWfOBoLhmTQADnXixzUFg1QaTPnf9RpL/DVZ35UHHaTinJdxAzGV?=
 =?iso-8859-1?Q?+TeRftuS13h3LFxNAHjU5hHOfmZ2FNuiDtkVdPNp47kaZzThCXeUtFXvNm?=
 =?iso-8859-1?Q?FZyGdsvXtNbrbNUSPF2RAQ7zYt1sEloAwvjHvBdmwd7pZyNxyVPxMoGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3572451-a93f-449a-a568-08dddc48edc6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:13:14.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INAm2MMA9ABcYAIqyuIeoi+VuKXh/SvSimHm9LARHCdx6CejD4pQQJ5ZJXf/lRH1+GZyARmX3A2JuFZ6xf1aoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
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

On Wed, Jul 30, 2025 at 11:43:42AM +0530, Aravind Iddamsetty wrote:
> This tool demonstrates the use of netlink sockets to query and read the
> error counters on a hardware. It provides following commands LIST_ERRORS,
> READ_ONE, READ_ALL to read counters and WAIT_ON_EVENT to wait for
> occurrence on a particular event, presently hardcoded to wait on
> occurrence of correctable error event and read a error counter.
> 
> v2: update uapi header.
> v3: Add DRM_RAS_CMD_READ_BLOCK command to read errors from an IP Block.
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  include/drm-uapi/drm_netlink.h | 105 ++++++++
>  meson.build                    |   4 +
>  tools/drm_ras.c                | 428 +++++++++++++++++++++++++++++++++
>  tools/meson.build              |   5 +
>  4 files changed, 542 insertions(+)
>  create mode 100644 include/drm-uapi/drm_netlink.h
>  create mode 100644 tools/drm_ras.c
> 
> diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
> new file mode 100644
> index 000000000..c978efaab
> --- /dev/null
> +++ b/include/drm-uapi/drm_netlink.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef _DRM_NETLINK_H_
> +#define _DRM_NETLINK_H_
> +
> +#define DRM_GENL_VERSION 1
> +#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
> +#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * enum drm_genl_error_cmds - Supported error commands
> + *
> + */
> +enum drm_genl_error_cmds {
> +	DRM_CMD_UNSPEC,
> +	/**
> +	 * @DRM_RAS_CMD_QUERY: Command to list all errors names with config-id in verbose mode.
> +	 * In normal mode will list IP blocks, total instances available and error types supported
> +	 */
> +	DRM_RAS_CMD_QUERY,
> +	/** @DRM_RAS_CMD_READ_ONE: Command to get a counter for a specific error */
> +	DRM_RAS_CMD_READ_ONE,
> +	/** @DRM_RAS_CMD_READ_BLOCK: Command to get a counter of specific error type from an IP
> +	 * block
> +	 */
> +	DRM_RAS_CMD_READ_BLOCK,
> +	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
> +	DRM_RAS_CMD_READ_ALL,
> +	/** @DRM_RAS_CMD_ERROR_EVENT: Command sent as part of multicast event */
> +	DRM_RAS_CMD_ERROR_EVENT,
> +
> +	__DRM_CMD_MAX,
> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
> +};
> +
> +enum drm_cmd_request_type {
> +	DRM_RAS_CMD_QUERY_VERBOSE = 1,
> +	DRM_RAS_CMD_QUERY_NORMAL = 2,
> +};
> +
> +/**
> + * enum drm_error_attr - Attributes to use with drm_genl_error_cmds
> + *
> + */
> +enum drm_error_attr {
> +	DRM_ATTR_UNSPEC,
> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
> +	/**
> +	 * @DRM_RAS_ATTR_QUERY: Should be used with DRM_RAS_CMD_QUERY,
> +	 * DRM_RAS_CMD_READ_ALL
> +	 */
> +	DRM_RAS_ATTR_QUERY, /* NLA_U8 */
> +	/**
> +	 * @DRM_RAS_ATTR_READ_ALL: Should be used with DRM_RAS_CMD_READ_ALL
> +	 */
> +	DRM_RAS_ATTR_READ_ALL, /* NLA_U8 */
> +	/**
> +	 * @DRM_RAS_ATTR_QUERY_REPLY: First Nested attributed sent as a
> +	 * response to DRM_RAS_CMD_QUERY, DRM_RAS_CMD_READ_ALL commands.
> +	 */
> +	DRM_RAS_ATTR_QUERY_REPLY, /* NLA_NESTED */
> +	/** @DRM_RAS_ATTR_ERROR_NAME: Used to pass error name */
> +	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
> +	/** @DRM_RAS_ATTR_ERROR_ID: Used to pass error id, should be used with
> +	 * DRM_RAS_CMD_READ_ONE, DRM_RAS_CMD_READ_BLOCK
> +	 */
> +	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
> +	/** @DRM_RAS_ATTR_ERROR_VALUE: Used to pass error value */
> +	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */
> +
> +	__DRM_ATTR_MAX,
> +	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif
> diff --git a/meson.build b/meson.build
> index 4efad72cf..c3e5c95d5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -165,6 +165,10 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>  libudev = dependency('libudev', required : true)
>  glib = dependency('glib-2.0', required : true)
>  
> +libnl = dependency('libnl-3.0', required: false)
> +libnl_genl = dependency('libnl-genl-3.0', required: false)
> +libnl_cli = dependency('libnl-cli-3.0', required:false)

oh! I just noticed it was here, but I'm afraid it doesn't work in here...
or perhaps is the required that needs to be set to true?!
take a look to my comment down below in the other meson.build file

> +
>  xmlrpc = dependency('xmlrpc', required : false)
>  xmlrpc_util = dependency('xmlrpc_util', required : false)
>  xmlrpc_client = dependency('xmlrpc_client', required : false)
> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
> new file mode 100644
> index 000000000..68946ff6a
> --- /dev/null
> +++ b/tools/drm_ras.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <getopt.h>
> +#include <linux/genetlink.h>
> +#include <netlink/cli/utils.h>
> +
> +#include "drm_netlink.h"
> +#include "igt_device_scan.h"
> +
> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +
> +struct nl_sock *sock, *mcsock;
> +int family_id;
> +
> +enum opt_val {
> +	OPT_UNKNOWN = '?',
> +	OPT_END = -1,
> +	OPT_DEVICE,
> +	OPT_CONFIG,
> +	OPT_VERBOSE,
> +	OPT_HELP,
> +};
> +
> +enum cmd_ids {
> +	INVALID_CMD = -1,
> +	LIST_ERRORS = 0,
> +	READ_ONE,
> +	READ_BLOCK,
> +	READ_ALL,
> +	WAIT_ON_EVENT,
> +
> +	__MAX_CMDS,
> +};
> +
> +static const char * const cmd_names[] = {
> +	"LIST_ERRORS",
> +	"READ_ONE",
> +	"READ_BLOCK",
> +	"READ_ALL",
> +	"WAIT_ON_EVENT",
> +};

please let's avoid caps in the commands

> +
> +static void help(char **argv)
> +{
> +	int i;
> +
> +	printf("Usage: %s command [<command options>]\n", argv[0]);
> +	printf("commands:\n");
> +
> +	for (i = 0; i < __MAX_CMDS; i++) {
> +		switch (i) {
> +		case LIST_ERRORS:
> +			printf("%s %s --device=<device filter> --verbose [default normal]\n", argv[0], cmd_names[i]);
> +			break;
> +		case READ_ALL:
> +		case WAIT_ON_EVENT:
> +			printf("%s %s --device=<device filter>\n", argv[0], cmd_names[i]);
> +			break;
> +		case READ_ONE:
> +		case READ_BLOCK:
> +			printf("%s %s --device=<device filter> --error_id=<id returned from query>\n", argv[0], cmd_names[i]);
> +			break;
> +		}
> +	}
> +
> +	igt_device_print_filter_types();
> +}
> +
> +static int list_errors(struct nl_cache_ops *ops, struct genl_cmd *cmd,
> +		       struct genl_info *info, void *arg)
> +{
> +	const struct nlmsghdr *nlh = info->nlh;
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		if ((nla_type(nla) == DRM_RAS_ATTR_QUERY_REPLY) && nla_is_nested(nla)) {
> +			struct nlattr *cur;
> +			int rem;
> +
> +			if (cmd->c_id == DRM_RAS_CMD_READ_ALL)
> +				printf("%-50s\t%-18s\t%s\n", "name", "config-id", "counter");
> +			else
> +				printf("%-50s\t%-18s\n", "name", "config-id");
> +
> +			nla_for_each_nested(cur, nla, rem) {
> +				switch (nla_type(cur)) {
> +				case DRM_RAS_ATTR_ERROR_NAME:
> +					printf("\n%-50s", nla_get_string(cur));
> +					break;
> +				case DRM_RAS_ATTR_ERROR_ID:
> +					printf("\t0x%016lx", nla_get_u64(cur));
> +					break;
> +				case DRM_RAS_ATTR_ERROR_VALUE:
> +					printf("\t%lu", nla_get_u64(cur));
> +					break;
> +				default:
> +					break;
> +				}
> +			}
> +			printf("\n");
> +		}
> +	}
> +
> +	return NL_OK;
> +}
> +
> +static int read_single(struct nl_cache_ops *ops, struct genl_cmd *cmd,
> +		       struct genl_info *info, void *arg)
> +{
> +	if (!info->attrs[DRM_RAS_ATTR_ERROR_VALUE])
> +		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ATTR_ERROR_VALUE attribute is missing");
> +
> +	printf("counter value %lu\n", nla_get_u64(info->attrs[DRM_RAS_ATTR_ERROR_VALUE]));
> +
> +	return NL_OK;
> +}
> +
> +static int mcast_event_handler(struct nl_cache_ops *ops, struct genl_cmd *cmd,
> +			       struct genl_info *info, void *arg)
> +{
> +	struct nl_msg *msg;
> +	uint64_t config = 0x0000000000000005; /* error-gt0-correctable-eu-grf */
> +	void *msg_head;
> +	int ret;
> +
> +	printf("error event received\n");
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
> +
> +	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0,
> +			       DRM_RAS_CMD_READ_ONE, 1);
> +	if (!msg_head)
> +		nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +	nla_put_u64(msg, DRM_RAS_ATTR_ERROR_ID, config);
> +
> +	ret = nl_send_auto(sock, msg);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(sock);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +
> +	return NL_OK;
> +}
> +
> +static struct nla_policy drm_genl_policy[DRM_ATTR_MAX + 1] = {
> +	[DRM_RAS_ATTR_QUERY] = { .type = NLA_U8 },
> +	[DRM_RAS_ATTR_READ_ALL] = { .type = NLA_U8 },
> +	[DRM_RAS_ATTR_QUERY_REPLY] = { .type = NLA_NESTED },
> +	[DRM_RAS_ATTR_ERROR_NAME] = { .type = NLA_NUL_STRING },
> +	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
> +	[DRM_RAS_ATTR_ERROR_VALUE] = { .type = NLA_U64 },
> +};
> +
> +static struct genl_cmd drm_genl_cmds[] = {
> +	{
> +		.c_id           = DRM_RAS_CMD_QUERY,
> +		.c_name         = "QUERY",
> +		.c_maxattr      = DRM_ATTR_MAX,
> +		.c_attr_policy  = drm_genl_policy,
> +		.c_msg_parser   = list_errors,
> +	},
> +	{
> +		.c_id           = DRM_RAS_CMD_READ_ONE,
> +		.c_name         = "READ_1",
> +		.c_maxattr      = DRM_ATTR_MAX,
> +		.c_attr_policy  = drm_genl_policy,
> +		.c_msg_parser   = read_single,
> +	},
> +	{
> +		.c_id           = DRM_RAS_CMD_READ_BLOCK,
> +		.c_name         = "READ_BLOCK",
> +		.c_maxattr      = DRM_ATTR_MAX,
> +		.c_attr_policy  = drm_genl_policy,
> +		.c_msg_parser   = read_single,
> +	},
> +	{
> +		.c_id           = DRM_RAS_CMD_READ_ALL,
> +		.c_name         = "READ_ALL",
> +		.c_maxattr      = DRM_ATTR_MAX,
> +		.c_attr_policy  = drm_genl_policy,
> +		.c_msg_parser   = list_errors,
> +	},
> +	{
> +		.c_id           = DRM_RAS_CMD_ERROR_EVENT,
> +		.c_name         = "ERROR_EVENT",
> +		.c_maxattr      = DRM_ATTR_MAX,
> +		.c_attr_policy  = drm_genl_policy,
> +		.c_msg_parser   = mcast_event_handler,
> +	},
> +};
> +
> +static struct genl_ops drm_genl_ops = {
> +	.o_hdrsize	= 0,
> +	.o_cmds		= drm_genl_cmds,
> +	.o_ncmds	= ARRAY_SIZE(drm_genl_cmds),
> +};
> +
> +static void send_cmd(int cmd, uint64_t config)
> +{
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
> +
> +	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, family_id, 0, 0, cmd, 1);
> +	if (!msg_head)
> +		nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +	switch (cmd) {
> +	case DRM_RAS_CMD_QUERY:
> +		nla_put_u8(msg, DRM_RAS_ATTR_QUERY, config ? DRM_RAS_CMD_QUERY_VERBOSE :
> +							     DRM_RAS_CMD_QUERY_NORMAL);
> +		break;
> +	case DRM_RAS_CMD_READ_ONE:
> +	case DRM_RAS_CMD_READ_BLOCK:
> +		nla_put_u64(msg, DRM_RAS_ATTR_ERROR_ID, config);
> +		break;
> +	case DRM_RAS_CMD_READ_ALL:
> +		nla_put_u8(msg, DRM_RAS_ATTR_READ_ALL, 1);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ret = nl_send_auto(sock, msg);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(sock);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +}
> +
> +static int get_cmd(char *cmd_name)
> +{
> +	int i;
> +
> +	if (!cmd_name)
> +		return -1;
> +
> +	for (i = 0; i < __MAX_CMDS; i++) {
> +		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char *endptr;
> +	enum opt_val val;
> +	enum cmd_ids cmd;
> +	char *device = NULL;
> +	uint64_t error_config_id;
> +	bool verbose = false;
> +	int  ret, mcgrp, index;
> +	struct igt_device_card card;
> +	char *dev_name, *dup;
> +
> +	static struct option options[] = {
> +		{"device",	required_argument,	NULL,	OPT_DEVICE},

indeed device is a required option, let's make this a positional argument
instead of part of this list so we avoid the '--device='...

also 'drm' should be part of family name and not required as extra argument here.

> +		{"error_id",	required_argument,	NULL,	OPT_CONFIG},
> +		{"verbose",	no_argument,		NULL,	OPT_VERBOSE},
> +		{"help",	no_argument,		NULL,	OPT_HELP},
> +		{ 0 }
> +	};
> +
> +	cmd = get_cmd(argv[1]);
> +	if (cmd < 0) {
> +		fprintf(stderr, "invalid command\n");
> +		help(argv);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	for (val = 0; val != OPT_END; ) {
> +		val = getopt_long(argc, argv, "", options, &index);
> +
> +		switch (val) {
> +		case OPT_DEVICE:
> +			device = strdup(optarg);
> +			break;
> +		case OPT_CONFIG:
> +			error_config_id = strtoull(optarg, &endptr, 16);
> +			if (*endptr) {
> +				fprintf(stderr, "invalid config id %s\n", optarg);
> +				exit(EXIT_FAILURE);
> +			}
> +			break;
> +		case OPT_VERBOSE:
> +			verbose = true;
> +			break;
> +		case OPT_HELP:
> +			help(argv);
> +			exit(EXIT_FAILURE);
> +		case OPT_END:
> +			break;
> +		case OPT_UNKNOWN:
> +			exit(EXIT_FAILURE);
> +		}
> +	}
> +
> +	if (!device) {
> +		fprintf(stderr, "missing device option\n");
> +		help(argv);
> +		exit(EXIT_FAILURE);
> +	} else {
> +		ret = igt_device_card_match_pci(device, &card);
> +		if (!ret) {
> +			fprintf(stderr, "device %s not found!\n", device);
> +			exit(EXIT_FAILURE);
> +		}
> +		free(device);
> +	}
> +
> +	/* get card name */
> +	dup = strdup(card.card);
> +
> +	while (dup)
> +		dev_name = strsep(&dup, "/");
> +	free(dup);
> +
> +	drm_genl_ops.o_name = strdup(dev_name);
> +
> +	sock = nl_cli_alloc_socket();
> +	if (!sock)
> +		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
> +
> +	ret = nl_cli_connect(sock, NETLINK_GENERIC);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Cannot connect handle");
> +
> +	ret = genl_register_family(&drm_genl_ops);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Cannot register xe family");
> +
> +	ret = genl_ops_resolve(sock, &drm_genl_ops);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to resolve family name");
> +
> +	family_id = genl_ctrl_resolve(sock, drm_genl_ops.o_name);
> +	if (family_id < 0)
> +		nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", drm_genl_ops.o_name);
> +
> +	ret = nl_socket_modify_cb(sock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to modify valid message callback");
> +
> +	switch (cmd) {
> +	case LIST_ERRORS:
> +		send_cmd(DRM_RAS_CMD_QUERY, verbose);
> +		break;
> +	case READ_ONE:
> +		send_cmd(DRM_RAS_CMD_READ_ONE, error_config_id);
> +		break;
> +	case READ_BLOCK:
> +		send_cmd(DRM_RAS_CMD_READ_BLOCK, error_config_id);
> +		break;
> +	case READ_ALL:
> +		send_cmd(DRM_RAS_CMD_READ_ALL, 0);
> +		break;
> +	case WAIT_ON_EVENT:
> +		mcsock = nl_cli_alloc_socket();
> +		if (!mcsock)
> +			nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
> +
> +		ret = nl_cli_connect(mcsock, NETLINK_GENERIC);
> +		if (ret < 0)
> +			nl_cli_fatal(ret, "Cannot connect handle");
> +
> +		ret = genl_ops_resolve(mcsock, &drm_genl_ops);
> +		if (ret < 0)
> +			nl_cli_fatal(ret, "Unable to resolve family name");
> +
> +		nl_socket_disable_seq_check(mcsock);
> +
> +		mcgrp = genl_ctrl_resolve_grp(mcsock, drm_genl_ops.o_name,
> +					      DRM_GENL_MCAST_GROUP_NAME_CORR_ERR);
> +		if (mcgrp < 0)
> +			nl_cli_fatal(mcgrp, "failed to resolve generic netlink multicast group");
> +
> +		/* Join the multicast group. */
> +		ret = nl_socket_add_membership(mcsock, mcgrp);
> +		if (ret < 0)
> +			nl_cli_fatal(ret, "failed to join multicast group");
> +
> +		ret = nl_socket_modify_cb(mcsock, NL_CB_VALID, NL_CB_CUSTOM, genl_handle_msg, NULL);
> +		if (ret < 0)
> +			nl_cli_fatal(ret, "Unable to modify valid message callback");
> +
> +		printf("waiting for error event\n");
> +		ret = nl_recvmsgs_default(mcsock);
> +		if (ret < 0)
> +			nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +		nl_close(mcsock);
> +		nl_socket_free(mcsock);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	nl_close(sock);
> +	nl_socket_free(sock);
> +
> +	return 0;
> +}
> +
> diff --git a/tools/meson.build b/tools/meson.build
> index 99a732942..5195d1f62 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -115,6 +115,11 @@ if build_vmtb
>  	install_subdir('vmtb', install_dir: libexecdir)
>  endif
>  

Please add this here:

libnl      = dependency('libnl-3.0', required: true)
libnl_cli  = dependency('libnl-cli-3.0', required: true)
libnl_genl = dependency('libnl-genl-3.0', required: true)

it took me a very long time to understand what was going on here on
my fedora build.

> +executable('drm_ras', 'drm_ras.c',

executable('drmras', 

to make user's life easier when typing the command...

> +           dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
> +           install_rpath : bindir_rpathdir,
> +           install : true)
> +
>  subdir('i915-perf')
>  subdir('xe-perf')
>  subdir('null_state_gen')
> -- 
> 2.25.1
> 
