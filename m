Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55720D3B9AD
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF0710E21F;
	Wed, 10 Dec 2025 00:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMIAkwXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC8510E21F
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765326347; x=1796862347;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4tSyv0yYV4QuSLvZhBejOwT7pgMp0WDv16uCXKHENX4=;
 b=EMIAkwXLADGuU5ovK7zV5fKIUyu5QDPBheCOSKsy/4xaNGZYgbn6oKpg
 cgFXru6dCnmu2Ffq3HCw2tFvjeRrmSIVyV25PPiP6ryT0zRp37ygRRiUo
 C9r5DFgAJ/tIpbRe8gHLyWKEffTa+UJ+jIGG9Wpm3iQtV8pzkwaGszoRk
 TkD15zWeolAJOYLw3rsYYiDeWLWdTIPf8qX/yxFXikKXWQ26nUamFuE66
 r538Q7dMBrF0GBZnJpQmUXammd6OXGuYQz5U4rZpKlKF9Qo3Ek5lBUy+P
 o5cJCPyN8Eu5GmY02rur6O4d0pgMfUOlniJqBNU3pacnAcTUm3Kfzhx8p g==;
X-CSE-ConnectionGUID: I/Kb+4l5TXSQq9qDBNmAuA==
X-CSE-MsgGUID: 6T/ugm3OQbWV++1E9yO2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67018895"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67018895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:25:47 -0800
X-CSE-ConnectionGUID: ld6P9EKaQ6+y4sjroIRlUQ==
X-CSE-MsgGUID: vLA9dEDUQkG5KoRh+qfvpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196358423"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:25:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 16:25:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 16:25:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 16:25:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz4qurwZ2I6JKA4mrunE+No8GmfgpeU6jP9UjzlBUmNmm5gyKbmlKeDouYXzglkrPv2FszaLQqj4w5fBASmAKYWh/9ppoI5VDfcpbryJX5mx/qP62XAx+EYjHA9keb4rc0/Rz7uUCB9aMbcTsmZZyGU4K2TZGCNT02HP+i28hJeK64Tqyime1nxLJDe/FNt2AfMeOwwzAu03X+IUSlrbfm6Adx9GxBNOOfsm0Eq2uSdU1HNs+L/s7sP/srLclyTOlm4A/cOYVcjSzQox2meuQXklKRNpoRdBgxTAJqUggB/Lf0y4WDCm/jznCriiiD/pM7Sgn11PBRiZyNuo3Ztwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEdjrwAg76/3zNAXSXXrHycRGw85sARNb3phfn7X6sE=;
 b=pkZSx9wcYHJQK6S3TGsC0RTBIgynRhHf3f1C83nr6jDQtMq+D/GywnFVaCd9/xJqjizMEYGNvWX0q6i6UHo1/FlejhGlwcT/LyktGllEOX/JeJELq91TAdDtaCvpFzUJmm+X9fni6NjoJteSFcsuiNEH9sK9Q7Dz+Ik4y+HPrcys5uDu4vgHI1Wh/v0YWvInzEynlg5YsXvy9a5ERW5PaExJVlDsGlBezBW8v8jn9BY0iz2p4STUgbvjapUQJU/Qtp6xwY4FFIV6iWNilUXtJzkRX1tYM2GceWKhqMu+DGAiV6ZbgEYeHtrm/xvjZndSPNR5TqTcCe5gR/D4Gqq+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 00:25:44 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 00:25:44 +0000
Date: Tue, 9 Dec 2025 16:25:40 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 15/18] tests/intel/xe_exec_multi_queue: Add priority
 test
Message-ID: <aTi-BJ4_enfXiOgH@nvishwa1-desk>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-35-niranjana.vishwanathapura@intel.com>
 <37cd8a444241ab6a8722a001af84836de280e349.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37cd8a444241ab6a8722a001af84836de280e349.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ce3a2d-8dcc-4eb4-b546-08de3782a7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TD5YUKu6/GThWig1UlDbOcelxgTCZKjGk1QtOVn1fGoPjygK4rv7ixJM/y?=
 =?iso-8859-1?Q?MavRQcPg5Ux1pgBJwOT4rF8sKdOxnSmhw+n65OqEyVbahIwL3Wv09BgPjF?=
 =?iso-8859-1?Q?+9QdSl+r5KZIJNskZsJAKM9mDa9VHeU95ZYioCxRDVvf5Chf5DHArZ/fb/?=
 =?iso-8859-1?Q?TVaMo16Y8j1NF6WTMJH0kf5Nbizfs/KRNaHWexRkenpzqgE0gWV4auENEQ?=
 =?iso-8859-1?Q?4CCoHVaI5HGTnAczTDBU9m4DouAmRNjP0CtSgeLNXgZGIPg92q6r2EAvQk?=
 =?iso-8859-1?Q?I3antnKzAxrfzUCqqcT0DHIyJAGfK6+X+hRUPDAgctPGKFW62i/wWhPzQL?=
 =?iso-8859-1?Q?7Tq85lVbyX/2oD/Kjjdb5W+Sfv3VH6J6mzOPwlHzHMJJ3XquUvrAPYvpBS?=
 =?iso-8859-1?Q?Xl2dsnblY03tZkvDM1ObcLrxk4hgQC1Uu31OeYvLwP1cjGzBTsZ6oMgsUL?=
 =?iso-8859-1?Q?UNjaQCfUTRP/g7QYPUpayoSvv9phhhbJlaP1cj8ob9wbKm608gqwjx3qvf?=
 =?iso-8859-1?Q?zDfnRyqJ0wJqtokdzjMOofytdYHjYIOZtQ58F05POwxdSy9OCu18Zx9WKq?=
 =?iso-8859-1?Q?6FOEZx0XaQILIF6nfIeKYV9eZ4nVvnGce2qrRPZ6aoCeoGUn1kuLQdu4eH?=
 =?iso-8859-1?Q?WBRKIeFzbZl6O3jncZeUyhM3nyVLA4KgQAoiLb3cXf52mgrURwQTv8VVxK?=
 =?iso-8859-1?Q?GKCehwC7Ycw7zmWxrT2eBduVuK98wP3K+H/ahYxe+lCrvcRj85aUcJIGO9?=
 =?iso-8859-1?Q?2xNWhFTpyD/Rf2db/A3CjM3WsNl1jL7k4fYKTM/V8eA4SpfNlCJ5tBQbaD?=
 =?iso-8859-1?Q?fBhaEPJ1vpFmANkinZUc5ngV9c82MQ+xLTc2iouYHnO2l7Q0/yQetQh4av?=
 =?iso-8859-1?Q?dDe9A/+rwMpUXWsN39MCqvXOJ0fWgZluIVwY115dmAIFPxb46Rmvu0R9fR?=
 =?iso-8859-1?Q?E68kbYCGnmkd6QuqgWpxQEf7TrjPxXvELW89FOScOQpC4CS93VBBx+THl5?=
 =?iso-8859-1?Q?3NdTKbybKx6MI+gWBxOMShEF0BcShAoZ6uqapdQrFufA23xd6I+Ui8T2+r?=
 =?iso-8859-1?Q?5Ls+wrnnUBT5+SKkP0+yzA4X7AziKKBIYnzot3MU02+zbTaaMvmQzBZIwv?=
 =?iso-8859-1?Q?xrC1ceEv7NGhthAt2Ehb/WJ9XG+0G7ZueJWNK2vJoc2Hq4+GgguztuFdUb?=
 =?iso-8859-1?Q?PZSt3kJ+XE+xDAMK/TBaT2mXBpz8g7JNnGpMPXTsUzLujQUZ0MM+Vv9iEr?=
 =?iso-8859-1?Q?R5ZtO02fxXh0TO3Yojz+8lrStSeo/J1J+CPudh6ixZF/7BZP6dvIvMguvs?=
 =?iso-8859-1?Q?yXzsmQkWK4FCrI8i0qiY73hMWiPD85dQzng2Qc3+cMqe4GEfbqDWMz7pnF?=
 =?iso-8859-1?Q?8xcEh0mzbGdukp55Rg5QXRPMlpJL0hNMamm9VTfFeLELgH/M/6+GEYGgl6?=
 =?iso-8859-1?Q?D/sKkCgDZpItXZGS5VraSThDGbOHi7NVDN6ti4jaCt8afEZESkl1S9xqzx?=
 =?iso-8859-1?Q?P2ih4LqrAZOxr0O8GJwgAA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?l3ouWgqO4UH3cmPgwc/GfRcxg47F4jA2JisSJRdr1vLnWjWd0FTiRJ0JnO?=
 =?iso-8859-1?Q?UQKOIRUR8edbymH6yV/gf75O7B2InVVZ3YcN2rutRRO3Zki0HOeNH3Zre5?=
 =?iso-8859-1?Q?iziOT28AycvEOSpzTuhgYqizY4F44HQEVvTW++2SG3Dv35x7jc/AB/FpFr?=
 =?iso-8859-1?Q?w7+2CvP0x5hUQWQyIIY+KyHGzhFMV0MA1sCg4jl2HWbBAau/Uyn3SF3Kcj?=
 =?iso-8859-1?Q?YILku1COrcL5dSveRzZd0lx8GoZsRhE8SWN5WjmXMlHeZOaygXIOt4MnDZ?=
 =?iso-8859-1?Q?5rubDj5855SKdS8hFxV20AUSV930YGoOxLTlc0LYGMsz2sVngqUBbKHUlg?=
 =?iso-8859-1?Q?wt+4/yJd/0K0+8U3QhpMO2HVCD0+U/FvaPcdduWwI0fE3ggxrkrh510PNd?=
 =?iso-8859-1?Q?ne5iPWElk3BWQgz2iuBbYzjTLUXYHf5s17td+x/nYvz9Ma83eu/kSy2JKj?=
 =?iso-8859-1?Q?jmsYIHjAy4Rq10thqUMh11byY5BAvWNgS07qBfYHQyA+jyNHicQ3BUznIK?=
 =?iso-8859-1?Q?S+HFAqWmBuo0UXjfO53BbV6XaD1VbiMGGziJBm+PaNlpCkKn5TkQJPKkDP?=
 =?iso-8859-1?Q?h+gAFIWIAn0PWP3p5CVRrTPxC2j2hsyG6sgS94vX9GXnSdTOHZXOFCFUBr?=
 =?iso-8859-1?Q?daKk0Hv/0wSJFMAMtX5hOX4/UVIXv30s2SeWbLBxpyqkSynMEfPXj6f7vB?=
 =?iso-8859-1?Q?O7hR7WdyYfMC5cvyttFO81I/CStFcw1ZUv83KZIAH8LWdva3sp36jLb00h?=
 =?iso-8859-1?Q?uejRuNwGoyQ0XXPRQ5VPxGm8KrOz/FXN7eoLVrsNVF0Tth7iJ4bPNiZ6rm?=
 =?iso-8859-1?Q?9+ptgaq9RZQD2slL0qEgWasEEoKYGYY/r3/W88+Wx4qZgKpJiNT9B0enNO?=
 =?iso-8859-1?Q?uwcQIo4MYQ201SEbFEF4Fi5ul9xNYmtUj00tgcpIJSUlQu1j+hbVjTP/9d?=
 =?iso-8859-1?Q?+imWdj3OuKzXghxD0kXkB+1WHuSdkSvSOIlxd0hSGVB+nL0a2McvjznEh8?=
 =?iso-8859-1?Q?uWzM+kyEXCENrsX2NUSgaRiwCcFDhj4tZFisGPCV/ynhBjl0Ex7nk1NTvW?=
 =?iso-8859-1?Q?UOo3a3eGfxTK/DOivU6HKwmNMsbBDMblZ6qFq6OlCwynRivQmUfGbtu/7D?=
 =?iso-8859-1?Q?cMaEMDVf7mNTV8uH3VklZFoZYXVaS1DqvCX/lz3KC/J098AV9O+53N34w+?=
 =?iso-8859-1?Q?f3lhY7BLh4u9aRamXROYOb2rolE6fKR0RQeYSoaOh3GKU65EJs/5zxJLEI?=
 =?iso-8859-1?Q?Ra7ZSESRMNXwwqr/ERABUqjL4bNA6pGBThIGMJgZ1a7lSl5kCMOZKoY/jg?=
 =?iso-8859-1?Q?kWkP0+//+OP9pRnu8t/bp72ZHJDEq+Q4qjii64J0si8hQYueIC/nQ94ZqM?=
 =?iso-8859-1?Q?GuwnXm5VVPLEiy11uvF10eiWrVb8EUg5RWh4vs7RWV/xH//4QLmJY3jJM8?=
 =?iso-8859-1?Q?RnLbNdaR9MEVfH0Na5PK99XaFVdknK2nmjX4T791lqk0pSuTXHFBnaVvoG?=
 =?iso-8859-1?Q?r+SypuDaUduWddfQVdylF+9On0ww/Cico2fK5SJw4aqYqFkxLaXMgrWJXY?=
 =?iso-8859-1?Q?NSFQ3zFT/Y4C/mhGrPUqF6xGLUkQYMk562OFmyN3q8QA2v11zZ5B0ZYwBM?=
 =?iso-8859-1?Q?Css9ZgkjYg2twmPfLqYIf1ChACk4LGINRYXSDT838qVQlpVRQSZjzIirAb?=
 =?iso-8859-1?Q?DZ3brVUbeRkichOjxtQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ce3a2d-8dcc-4eb4-b546-08de3782a7f2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 00:25:44.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCot8aSQwxuer5pqKB7NGZzEjyqaFbX+SY/D/l3Kpix3R2vvnfYRvcCWvVcHZ3ERZa7/jsNPMXlnHj7TH3KMvSQarrsXhUrZdhfTnZLS1qmG94HgW8q7vGCvNGRM38HI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

On Tue, Dec 09, 2025 at 01:34:03PM -0800, Summers, Stuart wrote:
>On Mon, 2025-12-08 at 19:22 -0800, Niranjana Vishwanathapura wrote:
>> Validate intra queue group priority setting.
>> Validate that a higher priority queue in a queue group
>> can preempt the lower priority queue of the group.
>>
>> During a queue switch, the currently running queue is
>> always switched out without regard to its priority.
>> The priority is only a factor in determining which
>> other queue of the group will be scheduled in.
>>
>> v2: Macro and variable rename (priyanka)
>>     Remove simulation related code (Priyanka)
>>     Remove hardcoding of number of bits.
>>     Use BASE_ADDRESS macro for address (Sai)
>> v3: Update comments (Stuart)
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>I still think we should in the future look at refactoring to remove the
>sleeps below. But we at least know that if for some reason the
>secondary queues weren't started by the time we start triggering the
>CFEG arbitration, the test will fail with out of order queues, so
>timing issues here should be obvious.
>

The sleeps are only added to ensure we hit a state for
which there is no guc notification. That we want to ensure
the priority is applied at a stage where we wanted. Otherwise,
test might simply pass because priority got applied statically
or like you said we might hit our of order completion as
priority is still not applied.

Thanks,
Niranjana

>Thanks,
>Stuart
>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 206
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 206 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 96fb05a72..debc47954 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -13,15 +13,18 @@
>>  
>>  #include "igt.h"
>>  #include "xe_drm.h"
>> +#include "igt_core.h"
>>  #include "lib/igt_syncobj.h"
>>  
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>>  
>>  #define XE_EXEC_QUEUE_PRIORITY_LOW     0
>>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL  1
>>  #define XE_EXEC_QUEUE_PRIORITY_HIGH    2
>>  #define XE_EXEC_QUEUE_NUM_PRIORITIES   3
>> +#define XE_EXEC_QUEUE_PRIORITY_N       (XE_EXEC_QUEUE_NUM_PRIORITIES
>> * 2 + 1)
>>  
>>  #define MAX_N_EXEC_QUEUES      64
>>  
>> @@ -33,6 +36,7 @@
>>  #define INVALIDATE             (0x1 << 5)
>>  #define FAULT_MODE             (0x1 << 6)
>>  #define SMEM                   (0x1 << 7)
>> +#define WAIT_MODE              (0x1 << 8)
>>  
>>  #define MAX_INSTANCE 9
>>  
>> @@ -226,6 +230,204 @@ test_sanity(int fd, int gt, int class)
>>         __test_sanity(fd, gt, class, true);
>>  }
>>  
>> +static void
>> +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>> +               unsigned int flags)
>> +{
>> +#define USER_FENCE_VALUE       0xdeadbeefdeadbeefull
>> +       struct drm_xe_sync sync = {
>> +               .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +               .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +               .timeline_value = USER_FENCE_VALUE,
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 1,
>> +               .syncs = to_user_pointer(&sync),
>> +       };
>> +       uint64_t vm_sync = 0, addr = BASE_ADDRESS;
>> +       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>> +       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>> +       uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>> +       uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>> +       int64_t fence_timeout = NSEC_PER_SEC;
>> +       size_t bo_size;
>> +       /*
>> +        * Q1 - Q6 are used for the priority test.
>> +        * Q Priority = id % 3
>> +        *      QID     Q1 Q2 Q3 Q4 Q5 Q6
>> +        * Priority      1  2  0  1  2  0
>> +        * The HW treats priority 1 and 0 the same, so it should
>> +        * pick Q with priority: Q2, Q5, Q1, Q3, Q4, Q6.
>> +        */
>> +       int expect_order[] = {0,2,5,1,3,4,6};
>> +       uint32_t already_in_order = 0;          // bitmask to record
>> Q started info
>> +       struct drm_xe_ext_set_property multi_queue = {
>> +               .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +               .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +               .value = DRM_XE_MULTI_GROUP_CREATE,
>> +       };
>> +       uint64_t ext = to_user_pointer(&multi_queue);
>> +       int i, j, sleep_duration = 1;
>> +       void *bo_map;
>> +
>> +       num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
>> +       num_queues = num_queue_priorities * 2 + 1;
>> +       igt_assert(num_queues <= XE_EXEC_QUEUE_PRIORITY_N);
>> +       igt_assert(num_queues <= sizeof(uint32_t) * 8);
>> +
>> +       igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
>> eci[0].gt_id,
>> +                eci[0].engine_class, eci[0].engine_instance);
>> +
>> +       vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>> +
>> +       bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> eci[0].gt_id),
>> +                         DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +       bo_map = xe_bo_map(fd, bo, bo_size);
>> +       for (i = 0; i < num_queues; i++)
>> +               spin[i] = bo_map + i * sizeof(*spin[0]);
>> +
>> +       /* Use the default priority for Q0 because we are explicitly
>> waiting for it below */
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +       multi_queue.value = exec_queues[0];
>> +
>> +       if (flags & DYN_PRIORITY) {
>> +               for (i = 1; i < num_queues; i++)
>> +                       exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +       } else {
>> +               struct drm_xe_ext_set_property mq_priority = {
>> +                       .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +                       .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +               };
>> +
>> +               multi_queue.base.next_extension =
>> to_user_pointer(&mq_priority);
>> +
>> +               /* Create secondary queues with increasing order of
>> priority */
>> +               for (i = 1; i < num_queues; i++) {
>> +                       mq_priority.value = i % num_queue_priorities;
>> +                       exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +               }
>> +       }
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
>> +
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +       vm_sync = 0;
>> +
>> +       for (i = 0; i < num_queues; i++) {
>> +               uint64_t spin_addr = addr + i * sizeof(struct
>> xe_spin);
>> +
>> +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .preempt = true);
>> +               sync.addr = spin_addr + (char *)&spin[i]->exec_sync -
>> (char *)spin[i];
>> +               exec.exec_queue_id = exec_queues[i];
>> +               exec.address = spin_addr;
>> +               xe_exec(fd, &exec);
>> +
>> +               /* Wait for job on Q0 to start, other queues block
>> behind Q0 */
>> +               if (!i)
>> +                       xe_spin_wait_started(spin[i]);
>> +       }
>> +
>> +       sleep(sleep_duration);
>> +
>> +       /*
>> +        * Expect the job on other queue to not get scheduled while
>> the spinner
>> +        * on q0 is not waiting on preempt condition.
>> +        */
>> +       for (i = 1; i < num_queues; i++)
>> +               igt_assert(!xe_spin_started(spin[i]));
>> +
>> +       if (flags & DYN_PRIORITY) {
>> +               /* Assign increasing order of priority for secondary
>> queues */
>> +               for (i = 1; i < num_queues; i++)
>> +                       xe_exec_queue_set_property(fd,
>> exec_queues[i],
>> +                                                 
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +                                                  i %
>> num_queue_priorities);
>> +
>> +               /* Wait for priorities to take effect */
>> +               sleep(sleep_duration);
>> +       }
>> +
>> +       /*
>> +        * Trigger a queue switch by making the spinner on q0 to wait
>> on preempt
>> +        * condition, allowing job on q1 to get scheduled and finish.
>> When we end
>> +        * the spin[0], it triggers the CFEG to perform a queue
>> priority arbitration
>> +        * rather than a full context switch out. Consequently, in
>> both semaphore
>> +        * (WAIT_MODE) and non-semaphore scenarios, a priority check
>> will occur.
>> +        */
>> +       if (flags & WAIT_MODE)
>> +               xe_spin_preempt_wait(spin[0]);
>> +       else
>> +               xe_spin_end(spin[0]);
>> +
>> +       /* Wait for jobs to get scheduled */
>> +       i = 1;
>> +       while (i < num_queues) {
>> +               for (j = 1; j < num_queues; j++) {
>> +                       if (xe_spin_started(spin[j]) &&
>> ((already_in_order & (1 << j)) == 0)) {
>> +                               start_order[i] = j;
>> +                               xe_spin_end(spin[j]);
>> +                               xe_wait_ufence(fd, &spin[j]-
>> >exec_sync, USER_FENCE_VALUE,
>> +                                              exec_queues[j],
>> fence_timeout);
>> +                               already_in_order |= (1 << j);
>> +                               i++;
>> +                       }
>> +               }
>> +       }
>> +
>> +       /* While ending spinner on q0, bring it out of preempt wait
>> */
>> +       if (flags & WAIT_MODE) {
>> +               xe_spin_end(spin[0]);
>> +               xe_spin_preempt_nowait(spin[0]);
>> +       }
>> +       xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
>> exec_queues[0], fence_timeout);
>> +
>> +       igt_debug("Order\t Actual\t Expect\n");
>> +       for (i = 1, j = 0; i < num_queues; i++) {
>> +               igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i,
>> start_order[i], start_order[i] % num_queue_priorities,
>> +                         expect_order[i], expect_order[i] %
>> num_queue_priorities);
>> +
>> +               /* The priority 0, 1 are the same, so we can skip the
>> comparison */
>> +               if (expect_order[i] % num_queue_priorities <
>> XE_EXEC_QUEUE_PRIORITY_HIGH &&
>> +                   start_order[i] % num_queue_priorities <
>> XE_EXEC_QUEUE_PRIORITY_HIGH)
>> +                       continue;
>> +
>> +               if (start_order[i] % num_queue_priorities !=
>> expect_order[i] % num_queue_priorities)
>> +                       j++;
>> +       }
>> +
>> +       /* There should be no out of order execution */
>> +       igt_assert(j == 0);
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +
>> +       for (i = 0; i < num_queues; i++)
>> +               xe_exec_queue_destroy(fd, exec_queues[i]);
>> +
>> +       munmap(bo_map, bo_size);
>> +       gem_close(fd, bo);
>> +
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: priority
>> + * Description: Validate queue priority setting
>> + * Test category: functionality test
>> + */
>> +static void
>> +test_priority(int fd, struct drm_xe_engine_class_instance *eci)
>> +{
>> +       __test_priority(fd, eci, 0);
>> +       __test_priority(fd, eci, WAIT_MODE);
>> +       __test_priority(fd, eci, DYN_PRIORITY);
>> +       __test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE);
>> +}
>> +
>>  static void
>>  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> int num_placement,
>>                   int n_exec_queues, int n_execs, unsigned int flags)
>> @@ -721,6 +923,10 @@ igt_main
>>                         xe_for_each_multi_queue_engine_class(class)
>>                                 test_exec_virtual(fd, gt, class);
>>  
>> +       igt_subtest_f("priority")
>> +               xe_for_each_multi_queue_engine(fd, hwe)
>> +                       test_priority(fd, hwe);
>> +
>>         for (const struct section *s = sections; s->name; s++) {
>>                 igt_subtest_f("one-queue-%s", s->name)
>>                         xe_for_each_multi_queue_engine(fd, hwe)
>
