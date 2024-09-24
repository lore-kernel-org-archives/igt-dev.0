Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF067CF9C71
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 09:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B8410E671;
	Tue, 24 Sep 2024 09:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAM7IEZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EE310E67D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727169379; x=1758705379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N97m79HNtf1qYk8P2U8Pv6RV5l1yUd/ifHxxsFb26gs=;
 b=iAM7IEZju8EQuwZgtHbig/IaJyZyjEQgd70uQxc674GUFAX/mSjiWGtd
 8nIE/T/yHnd/XTvf66FhBxu4nW0sBgrGsjhuGIvbbQlZ6JuRS6d1UjHYy
 XTIKBzZhqNudmhpuX6xXYPqpsR82/dhyLrpxExvwfzkYOhz3mmFG6Wbv9
 fnWKZqNpeTi49hPaNty9mcTpqBAx156L/ic5ZD6tow1mm8VDXSPO/vlF3
 aqphj6q2CUftlDOTfFrQWhaYn9v9SN1p9YYh30UfDVcT7jynNqRv/JOlM
 A6GDhDDqsyh+J90meRO/bqTtF2xUlq1AISxOl6RSlOTLrn12jPSdAgsJ0 A==;
X-CSE-ConnectionGUID: OQl3gL9fSGCHW9uzq24Cyg==
X-CSE-MsgGUID: ZHg82u+sSuu/BbGiu9lZIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25972853"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="25972853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 02:16:18 -0700
X-CSE-ConnectionGUID: j3g6eK9GQCC/4JKpMfWshA==
X-CSE-MsgGUID: nTKpd1ViTSyNlVid0kHrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71627637"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 02:16:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 02:16:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 02:16:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 02:16:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 02:16:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 02:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrfZ4a0ERM9pYfiQnQ9KUhBo/Y1Wdxrr1dLVA1NMmqyLHA+ruxNh35frVm1puL1/fs37j3rG7GaZlIUU+od8O6rxmAjHPrNmfTw/Wz2BcC6uReLFl2wzjlW4CRmsizxWKkp14Pi+nkOWaJyDZ/wxsaMoNR9MxytF/tAMtpZTU1dhsN+k07nA0msUHS/FoiYDyzToNw44+rloxepgoVKTDQqdAkN9TPgyqtZubrBx9Fr/zvNdeaYI7qTe2ArpW61snyF03LBdRrZiXZwEeZ0P/wVGwtnlNF0Fyzr00tVmTU28ctSpGJYUQ60uA+CS88XD5GYClX4MGCH/HK+p8OPodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdDzdIJ1yBAFBm75KOQZy0T8pOB/yqXofw1n16Ee6v0=;
 b=c8MVIGq4sywFhJJ6+goDLdba++AXM+zf/9StwpCBWG4DDsRe7dZj/ueKLtdK08dfn9ZAacOim7QzLnydRYQQ95/KkS2uO9JYA5MKHgcpJACUIprgDNRyUQEXfe8yIIgh++u7Zw03DPUenJOfjjjj8UTcHKoq3l/mHcOHFZQUKM9lducAOMa5pFOjShkOlZqpD/nuw1UYilQ55Rg4p4+nH8VNery9A1Qh2nPyxexMkMa857I30K+niYWX+ZmHMPH2ZmQpoYPSXDpJJ6dIWNB4XxIe+U0xst1cwz0dab7YrYGI3Hr/1ZK6KF1p8871r+2uI1HW/WhiHUHmVsDs0UFcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 09:16:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 09:16:14 +0000
Date: Tue, 24 Sep 2024 11:16:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Add new test for
 fault injection
Message-ID: <ZvKDVRI53vnLuOfn@fdugast-desk>
References: <20240920131913.3368381-1-francois.dugast@intel.com>
 <ZvGu8qdBeuP6XeUk@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvGu8qdBeuP6XeUk@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 2735ab56-8363-4524-09bb-08dcdc79899c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8fHRH68If0/m4i8GTkEph6tvRz3vBPrMe1aKVZ/uBEGyiFilwxP5Xyg29O?=
 =?iso-8859-1?Q?mIOWO8Buo0utyS9ieMjSQa+Fm5yDu26ueiAz6DY17TajbB3KifeLRw5//t?=
 =?iso-8859-1?Q?ARhzdnkJgTVYB+sWKXmzuN87SDWqfEMUD83Z2xGquIUfNJXO6JvvJmwxhO?=
 =?iso-8859-1?Q?JLpXyzVpx15jOmAsP0JnKp7BoMpgKVtDbDLKcP7jjc28gUw6ofaZMxh1ij?=
 =?iso-8859-1?Q?IgzAihrMczHjp87SaXI3RrNTw48u3NqF5Bm3dLeyNQrEbN051UEnz4J0HS?=
 =?iso-8859-1?Q?i/JQlbEOekAnxezrjv0llzJbScCtyACKHUlyHXRg2JP8nENKxF+KEPW/WE?=
 =?iso-8859-1?Q?SsZz2YrfRXg9tvaIQLX1lq+trzZQSDvDAhQp57iu61yEkAQZOwQPJjHuOF?=
 =?iso-8859-1?Q?Xqwp1I3Xa+5Z1OX+8KgEyzjKJsbNz5hVwdHF6I7eD0unbjTAiuaADhFXMv?=
 =?iso-8859-1?Q?KKjT82HpFBnW/Vse9AZMpj/34fI2x7CpP0hBefi+nT6Dv3orpKjfKtfU6l?=
 =?iso-8859-1?Q?6Xrx6LlPUOquy99Mq4CGBw6AKzdaEzrK2r1nzBRnhbigrdQbrPMmKYBUZV?=
 =?iso-8859-1?Q?+tHqsTGffW7048Ctyqu+NEeTSVWrczoc5UeG8OFacGBxKlHS++nggC8e6P?=
 =?iso-8859-1?Q?735GxU8n/xY0nWI+N+6FYt7Ve2tLV5+luYl0NPDDAMdeavUsSkOEqmjwwp?=
 =?iso-8859-1?Q?k1eVp+4xAKEQXVfwEzoXELuGFNsDuMTWQ6eAifyYG8fbEiwLKwyLR5fpAL?=
 =?iso-8859-1?Q?OWL6z5FQPkcq4X9YwbpNzCsTobl8qpMbom0iqiEI9f7m6uY/ciOXviORW3?=
 =?iso-8859-1?Q?4dBaZJUI9f887JFMAvSr73XHze2+yiVUthtTgoIrZDcb9eLqjuNEZjt7cW?=
 =?iso-8859-1?Q?ZzbpumDZ/1pxDgtkpj6QK0tcY3jZUQB9B66Y4461njCuJgDuDgmleefize?=
 =?iso-8859-1?Q?Nd2tKKId/GwYj7JNxYiiFku5QxJ8OkTez5NY2uFgqB7nD9K/llIVAmhiPr?=
 =?iso-8859-1?Q?JmqmR6yPbEIRztM5rxAUKRu1tS2S5OJ6IbeMMnZkFe380gJh8pcGLhy55R?=
 =?iso-8859-1?Q?Tuos0qWsBZ9riLzmDkNcjZ0gxhuhTnmxMNpt0GJI3rYcj+3qdHvzV09dy1?=
 =?iso-8859-1?Q?gIVdv5k4ubcax44RcIFGrmugg6v5VTkFztytvAuOy1iQhGod+KCZleKD5z?=
 =?iso-8859-1?Q?1k9WBrIv37Rc+KCHnbMavvut+3T3lFIcbl/+b1q6Yf1it9qaoaG3i2iJVU?=
 =?iso-8859-1?Q?4V5D1C4xd6F3nhg7JPZ4jLP2hltRTgYats2w2T6AA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HXz9AfqyCSzGKQnxf8jEBPHlI6tCN9oDRSxjS38cvDCud9V1zxMD9V2L8V?=
 =?iso-8859-1?Q?P6UeJkbXfbXYEruvgHLeFKq/fobG+XfhaBZz/rYTgnkLbXafwwg+YzqW5Q?=
 =?iso-8859-1?Q?bBQKmbNe+i1HZ7cFkBFRxoQAIeAi32UoJIYMHl9b44sc+wxdIfm7muLhyq?=
 =?iso-8859-1?Q?bL9u33rifHXTpXwH2mVr/HNnSpod+rOy2T84vVpkjoU5+DHhnlsQ87nHur?=
 =?iso-8859-1?Q?E9Ac8l3U/VuOc2cZObGRqV8PqvFsroJzzhs6sWh3HwRiUzIdHjfbnb0Pu3?=
 =?iso-8859-1?Q?n29QHnqI4gTlBF/666ttMJs9w9Z2sybA6naE/vA8qR1rPKH305mNF9HcRH?=
 =?iso-8859-1?Q?ksTx6sM8Xi0hSSmxl4KRJuAEl4RqB/vOohuVm2qXrpXCll22KXJBiEXWtA?=
 =?iso-8859-1?Q?ZQHERqNiu0ZUXxRbMJf3s6T3GMCBb87dlhnUJNhTLomNSooUGo4lZdqrVm?=
 =?iso-8859-1?Q?/PnAngi9U+qlcj085ZMrnL0KRZ7/oAhcQu2xErKLBqPOWIe/95itKGH53v?=
 =?iso-8859-1?Q?MiECmNTWjxt57AqjKLY/abpbRMtp6Tnj8IzwyZwlsT3H7zNv6YSDe5TRSx?=
 =?iso-8859-1?Q?Fr2v/8jy9M45whI81LJKA0NxmWDl25q7pXoYGakd9hgy9pWeNZiOFOTPcm?=
 =?iso-8859-1?Q?rZfFn6FRp55sRNcUhkOoKvMauAtT895POeSEg0PcUUTQnkvQB9I8rnLVt0?=
 =?iso-8859-1?Q?MP14ZiruZu+VSshPNAVwMQ0hR35vaujfZGvJpha2ZN2T2KiBdPnOidh+rv?=
 =?iso-8859-1?Q?SBauJ5uDRY8SW6dx0Ac9SRu09JkuAqM0KozOY3nrWNhvU7l25SHoCHugNK?=
 =?iso-8859-1?Q?GFByNeb72ty84cBmVEJK4isBoEzAvJg100x+PiyNw47CLlQzIPx4EeksEl?=
 =?iso-8859-1?Q?BRzhOPCKGl44GDN+s1V/VzxUxADiWFutnXBFL9ZulS6MVUeykDF4YIDMpn?=
 =?iso-8859-1?Q?MI6iJwiVellhRmVSg6Md/AhUwa98bm3OwmSWMErCaEV5U5erow7Umx5BBl?=
 =?iso-8859-1?Q?NXg+PIRjdpaq6B20w6VUzNKnJKiGsX/75xTcDilhD3+xv6C7a8Ftcwj29y?=
 =?iso-8859-1?Q?u0EhIXPC09IhpObvuVBNZhxlnwS59mtFCK+ARsPY+F2PI8FYiKL76wq7S0?=
 =?iso-8859-1?Q?cVwg94HiDVOJzLcpRU4wA0RGlHEo3r2hrhxez52sNMCSV72MVSH7yr5Lxq?=
 =?iso-8859-1?Q?3g4dinVTXLv3ehfALd6eUibFtuKa07HhJwyhxNJhb58KGMlExoxoYUzAZ+?=
 =?iso-8859-1?Q?GSyJ5jtqiK87cUdmB0gZEOZpY3EiSkuFb1GXLWAGAqQ10Bbk/zGsNjKZQw?=
 =?iso-8859-1?Q?LEYhijwVXFZ3ZjWeIOUJ+pSj26UAl0ZqJLMRAr0g/pck/Bj7x3QzPT3/wb?=
 =?iso-8859-1?Q?mTvgpR5ZSfzCcExlTQAStHCPfiLhN8ugaytytlOfJKcgkpOPz8vWcpolg8?=
 =?iso-8859-1?Q?/+IaCWTmtjZUWZTPrIf/DemnT2kCjRNd8LfhnvFQslqZ84mYbsUNbtA1St?=
 =?iso-8859-1?Q?hWh9Fsxc5Iz2KP0rF6Hbl+bDAF/v2FvDsjhXJb1Yz1s9Xxr1FTw3O75LzM?=
 =?iso-8859-1?Q?g9q2Vsv2rvEV7TmgE/YFLREDDdRyngU35ZaAd+HqXqYcu1AkrU/b/7RFpp?=
 =?iso-8859-1?Q?BbgxAO42XxvHh8rpMv6mvCs9riOGO5QUXfU0JbFpTuALGkDJzxVs40Tw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2735ab56-8363-4524-09bb-08dcdc79899c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:16:14.0211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8NT/LEghuLpGjCHKQi9GOucY+C9uG4q6ww/6Y/tnRQHH+NVbNvwwNYudM0VLfd9kmNI70iu5B0NIH4fSmuwQqvKI4fd+A+ss4IaEmLY0CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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

On Mon, Sep 23, 2024 at 02:09:54PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 20, 2024 at 03:19:13PM +0200, Francois Dugast wrote:
> > Use the kernel fault injection infrastructure to test error handling
> > of xe at probe time.
> > 
> > Add the following test:
> >     * "function-fault-injection"
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 229 +++++++++++++++++++++++++++++++
> >  tests/meson.build                |   1 +
> >  2 files changed, 230 insertions(+)
> >  create mode 100644 tests/intel/xe_fault_injection.c
> > 
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> > new file mode 100644
> > index 000000000..86fb6029d
> > --- /dev/null
> > +++ b/tests/intel/xe_fault_injection.c
> 
> perhaps we should name this xe_probe_faults.c ?

The intention for this file is to exercise the newly introduced use of
fault-inject.h in the driver. For now the scope is indeed limited to
probe time (hence the name of the only test in this file) but in the
future there is no reason to limit to only probe time.

> 
> > @@ -0,0 +1,229 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: Check fault injection
> > + * Category: Core
> > + * Mega feature: General Core features
> > + * Sub-category: driver
> > + * Test category: fault injection
> > + */
> > +
> > +#include <regex.h>
> > +
> > +#include "igt.h"
> > +#include "igt_device.h"
> > +#include "igt_kmod.h"
> > +#include "igt_sysfs.h"
> > +
> > +#define MAX_LINE_SIZE			1024
> > +#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> > +#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> > +#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
> > +#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
> > +#define INJECT_ERRNO			-ENOMEM
> > +
> > +enum sysfs_action {
> > +	SYSFS_BIND,
> > +	SYSFS_UNBIND,
> > +};
> > +
> > +enum injection_list_action {
> > +	INJECTION_LIST_ADD,
> > +	INJECTION_LIST_REMOVE,
> > +};
> > +
> > +/*
> > + * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
> > + */
> > +static bool function_error_injection_enabled(void)
> > +{
> > +	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> > +
> > +	if (file) {
> > +		fclose(file);
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static int sysfs_do(enum sysfs_action action, const char pci_slot[])
> > +{
> > +	int sysfs;
> > +	int ret;
> > +
> > +	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> > +	igt_assert(sysfs);
> > +
> > +	switch(action) {
> > +	case SYSFS_BIND:
> > +		ret = igt_sysfs_set(sysfs, "bind", pci_slot);
> > +		break;
> > +	case SYSFS_UNBIND:
> > +		ret = igt_sysfs_set(sysfs, "unbind", pci_slot);
> > +		break;
> 
> cool and clean fn, but we should probably add it to a library place.
> And then reused in common places like xe_wedge...

Sure, will do.

> 
> > +	default:
> > +		igt_assert(!"missing");
> > +	}
> > +
> > +	close(sysfs);
> > +
> > +	return ret;
> > +}
> > +
> > +static void injection_list_do(enum injection_list_action action, char function_name[])
> > +{
> > +	FILE *file_inject;
> > +
> > +	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> > +	igt_assert(file_inject);
> > +
> > +	switch(action) {
> > +	case INJECTION_LIST_ADD:
> > +		fprintf(file_inject, "%s", function_name);
> > +		break;
> > +	case INJECTION_LIST_REMOVE:
> > +		fprintf(file_inject, "!%s", function_name);
> > +		break;
> > +	default:
> > +		igt_assert(!"missing");
> > +	}
> > +
> > +	fclose(file_inject);
> > +}
> > +
> > +/*
> > + * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
> > + */
> > +static void setup_injection_fault(void)
> > +{
> > +	FILE *file;
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "N");
> > +	fclose(file);
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "100");
> > +	fclose(file);
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "0");
> > +	fclose(file);
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "-1");
> > +	fclose(file);
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "0");
> > +	fclose(file);
> > +
> > +	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> > +	igt_assert(file);
> > +	fprintf(file, "1");
> > +	fclose(file);
> > +}
> > +
> > +static void cleanup_injection_fault(void)
> > +{
> > +	FILE *file;
> > +
> > +	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> > +	igt_assert(file);
> > +	fprintf(file, "\n");
> > +	fclose(file);
> > +}
> > +
> > +static void set_retval(char function_name[], long long retval)
> > +{
> > +	FILE *file_retval;
> > +	char file_path[MAX_LINE_SIZE];
> > +
> > +	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> > +
> > +	file_retval = fopen(file_path, "w");
> > +	igt_assert(file_retval);
> > +
> > +	fprintf(file_retval, "%#016llx", retval);
> > +	fclose(file_retval);
> > +}
> > +
> > +static void inject_fault_try_bind(char pci_slot[], char function_name[])
> > +{
> > +	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> > +		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> > +
> > +	injection_list_do(INJECTION_LIST_ADD, function_name);
> > +	set_retval(function_name, INJECT_ERRNO);
> > +	sysfs_do(SYSFS_BIND, pci_slot);
> > +	igt_assert_eq(-errno, INJECT_ERRNO);
> > +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> > +}
> > +
> > +/**
> > + * SUBTEST: function-fault-injection-during-probe
> > + * Description: inject an error in each injectable function then reprobe driver
> > + */
> > +static void
> > +function_fault_injection_during_probe(void)
> > +{
> > +	FILE *file_injectable;
> > +	char line[MAX_LINE_SIZE];
> > +	char function_name[MAX_LINE_SIZE];
> > +	regex_t regex;
> > +	regmatch_t pmatch[2];
> > +	char pci_slot[MAX_LINE_SIZE];
> > +	int fd;
> > +
> > +	fd = drm_open_driver(DRIVER_XE);
> > +	igt_device_get_pci_slot_name(fd, pci_slot);
> > +	drm_close_driver(fd);
> > +
> > +	igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
> > +
> > +	file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
> > +	igt_assert(file_injectable);
> > +
> > +	sysfs_do(SYSFS_UNBIND, pci_slot);
> > +
> > +	/*
> > +	 * Iterate over each error injectable function of the xe module
> > +	 */
> > +	while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
> > +		if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> > +			strcpy(function_name, line);
> > +			function_name[pmatch[1].rm_eo - 1] = '\0';
> > +			inject_fault_try_bind(pci_slot, function_name);
> > +		}
> 
> hmmm... will this really work 100% of the cases? what about reset and
> wedged cases? will they get listed and attempt the rebind?
> 
> But well, the good part of this is that any kernel addition doesn't
> require a change in igt...  then perhaps the name of this test case
> file is right indeed...

This test covers 100% of the cases introduced by [1] where fault-inject.h
is used instead of the i915 macro to detect issues at probe time. This
means only uses of the ALLOW_ERROR_INJECTION() macro for error injectable
functions [2], not other uses of fault-inject.h such as in reset and
wedged cases.

Yes it is dynamic, meaning no change is required in this test after adding
one new case of ALLOW_ERROR_INJECTION() in the driver, as long as it is
meant to fail at probe time with error INJECT_ERRNO.

With the current proposal [1], execution of this test looks like this:

    Starting subtest: function-fault-injection-during-probe
    Opened device: /dev/dri/card0                                          
    Injecting error "Cannot allocate memory" (-12) in function "wait_for_lmem_ready"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_device_create"                         
    Injecting error "Cannot allocate memory" (-12) in function "xe_ggtt_init_early"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_guc_ads_init"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_guc_ct_init"  
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_guc_log_init"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_pm_init_early"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_tile_init_early"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_uc_fw_init"                            
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_wa_init"
    Injecting error "Cannot allocate memory" (-12) in function "xe_wopcm_init"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_guc_relay_init"
    Injecting error "Cannot allocate memory" (-12) in function "fault_inject_sriov_init"
    Subtest function-fault-injection-during-probe: SUCCESS (2.532s)

[1] https://patchwork.freedesktop.org/series/138654/
[2] https://docs.kernel.org/fault-injection/fault-injection.html#error-injectable-functions

Francois

> 
> > +	}
> > +
> > +	fclose(file_injectable);
> > +	regfree(&regex);
> > +}
> > +
> > +igt_main
> > +{
> > +	igt_fixture {
> > +		igt_require(function_error_injection_enabled());
> > +		setup_injection_fault();
> > +	}
> > +
> > +	igt_subtest("function-fault-injection") {
> > +		function_fault_injection_during_probe();
> > +	}
> > +
> > +	igt_fixture {
> > +		cleanup_injection_fault();
> > +		igt_xe_driver_unload();
> > +		igt_xe_driver_load(NULL);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 00556c9d6..cf0d4486e 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -293,6 +293,7 @@ intel_xe_progs = [
> >  	'xe_exec_store',
> >  	'xe_exec_threads',
> >  	'xe_exercise_blt',
> > +	'xe_fault_injection',
> >  	'xe_gpgpu_fill',
> >  	'xe_gt_freq',
> >  	'xe_huc_copy',
> > -- 
> > 2.43.0
> > 
