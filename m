Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E92CF887F
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 22:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151BB10E7DE;
	Thu, 20 Nov 2025 22:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtI23TMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1610E7E2
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 22:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763676766; x=1795212766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n/pDL3dlGIbKIj96LrbCbm1ZW7Q0G278QSwFBtl71XI=;
 b=mtI23TMvsdpfIvTrEYVJMJ9gEmUnusKgCbhZPoXtXrddhfrlLeBfdUSP
 M9yXM7yjFb5ThpgP1+CPyoiMH9bu3j7mvdALic2C2bg0VufO/TXSAl07h
 hLtTmYM8jR+pE6dk2YZSy63AWMCbkb3RsXztLWM4npdsUiL3fEfE2XO32
 plaox7Em8RFiyivfZ9dVZ6JOWkwybi8jjPdh42xRKQTd/PDQA4gSNqyvX
 Tttgyha4Vavs/FT+hKUWmR3UXohpCwdpyfBTCYiGGROtNMUbmuxAivES7
 vVKzfSAbTl1MGmKCiSp2O01CmwEUUVPXVGIKFsa5MNnga6VqT+OeG+Azl A==;
X-CSE-ConnectionGUID: srZqvn19SfuJrXf0LevUPw==
X-CSE-MsgGUID: /3T5JfL1QWmH0B+8zBSb9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65642204"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65642204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:12:21 -0800
X-CSE-ConnectionGUID: kmo+z+KEQgeKJYLBVrVLuA==
X-CSE-MsgGUID: 1W/rEaPiQQqGFu0HEBgFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191351005"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:12:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:12:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:12:18 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:12:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8ncrb+wrcILpqhmkIGmfHxaqdzoS3iEI9RXs4Y2TfYg+qQ4AcfAm7560WkJYaeX1d1VtuqQwY+keK7T0BiKEYtvqllqXIgJS6afTCVNW+73dCcpEvvkNZ1w32gOh73k30mlT72IH7FABqRW8OC8E0/EiAWntcBWmsrUSF3DlGuhxRuIi5UwgCi2kuoUzWwv1Crfpx0awFh/4fxu8fI4TDs5sOQgAwyo/QLSyD3tccnkK7zYeCiqUzoprAGSKIlcZjCjS8B7efsiBGa/I4zFe7d9KGgIHigI6MNM+PdF6PuVqME1BrXY/oKBfqdc6sMeLbHu5NwpceRIqPW4whvP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B1zmacixCiAOEPRXrYC1g9U3k0OmwUvnlethUGj5Hs=;
 b=LF2w/DQViLGg2KvppLe7Bd5CB5Hv4tD0RjXXbu+4y+5brUjGWszWkOHEsj6EK1UNoPefN9+JHxMjqMpsbfkWX9s0cttDWzmD4QyvBDUTLUDszjGXcrr6iIiN5oN0fKIlIeybzCIDvWk51Q4jqtQJOzvLBnCsES63H36/Bd3bswvoJokXY1J6lR3er4ud6abj6W/dFSQRD+HnfnwkUmvQUU8HLqaZ8hgekY4XjKeIy2JlXrEPIoC52rPptWUKRutWFB6UmDmAG2L4C27pvuuWb+OMXtf++Zf2xgQpivZStMuBeb2gt0L7p8lJklZ4ssXraJFlpTEB8kRvDAF0CKfyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 22:12:16 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 22:12:15 +0000
Date: Thu, 20 Nov 2025 14:12:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Message-ID: <aR-SPYoEGUKE-ntZ@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
 <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
 <CH3PR11MB8434710EF04A9B8FECF075BA8DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8434710EF04A9B8FECF075BA8DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 500255db-28ad-4b01-d31c-08de2881dcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q6zrIKnqZxdsYu2K/u9OuRjijZL5V/94J+D+OQZFxTkGDWX6xnL3lMCy1Iyu?=
 =?us-ascii?Q?lsfbOS7MYXw8zZCygHKtC8n9Q5dfnPcVxcMuEjTLsfmvr5ehsa2olR5VLg8p?=
 =?us-ascii?Q?5alyx45ljWGnJxwjhZOlInJO+EOBuT1hNgKRqZvUaKB+G1mxsa1EEH1C21hj?=
 =?us-ascii?Q?+HAUbvaDGzIoQYp6GkE9nGMfaYwARj4xV8SVSICyVRMymv7hkaq0XdyGS9NJ?=
 =?us-ascii?Q?zGtj9NzbLUT3A2tPHKI6w4H6m38TIO8OdCI2xJ6FaDNHF3wATykRSgy6z4H6?=
 =?us-ascii?Q?XcImcKEFJEQa4V7Ug2hopuYwgDzbPWl4sS4ZDLJRXq6j6uDeuBrmmCjzw2yV?=
 =?us-ascii?Q?iDVEL4bE/jBxcGcgBPp1y9+fLiXn4nU1s6j0BaAVtTO0oxQhTSk7ptvKOB7N?=
 =?us-ascii?Q?6wy5d4c0/FHJlnklF+8PiTmBFknaYKBpsWXyegGCIuiSbVVqp6FuxG3mtSrK?=
 =?us-ascii?Q?Gb+6qzsXppVfSbyJdlY/QE53WikHP/izZraOS73d+EtL8LRv8mm6K0SBK9WO?=
 =?us-ascii?Q?odXEwSP2fp2d5QoekAqA3Sq7dseDsxDTVNc7A8GEzj0iyCYBY7Q59UWYK3j5?=
 =?us-ascii?Q?oqcRjmz2yP8mfXf3yQKjp/8FSO1CDUWW8p1+MJretVLYghHZG3iiaNP6e2uo?=
 =?us-ascii?Q?1oLokP6T/6pHT5QGDkq6Z+HAnCTE/Q5abd71znJlweS3lgM5WD89DbFixInU?=
 =?us-ascii?Q?hVL5cBkd8r+kHMIBU5fxVpxggKyv3ryrlHgcbo9HYJZqeIpuUrX8m7nDD913?=
 =?us-ascii?Q?ktznjXdM78iTHsBp/66xNUPEmylPFti3DNk5tOi6alcQxvvegZl9xAWVdluT?=
 =?us-ascii?Q?4Z5mYTr/8soc2LLhRRnqr43u8Dqia5MRFAi5PoL/XrtPMSfcwIJrP8NvFqog?=
 =?us-ascii?Q?vUvY5UJUiLNsAml1HYVlCw+mN6A+QQ1iLUn9ZP//eBJBK5shFLAcx8ua1nYb?=
 =?us-ascii?Q?2wK+g3VBGOGsqGZdZGyngdVHnOXadJQnTEGIV2Y50j43LglrW7RuS5Eq9XJJ?=
 =?us-ascii?Q?UlnXh/Fd1yTiYLSX7hFvKRmwYUWRrZlx38Nwj3lpm+lEybzP/JNSHhH1mrHK?=
 =?us-ascii?Q?rJC7cvE7bM5MhWUpiXFrlUx7BQLPDfcAGYgxHaruyEvca4Pc30u/hImRgvjQ?=
 =?us-ascii?Q?bNUnRnd68XFLTFjFrV7LuBz+tSs16XLmfFCFDUjawZF8EQJ6ze95wDYfv06v?=
 =?us-ascii?Q?qXY5MG4SEiJCe8hYO6vzzAPsGzIUh0SESY0BA3zs4YfPU7xL2XikFoHoVZNP?=
 =?us-ascii?Q?UBqeDxyp5cYVqveH099hoIE1TroAv37wj6LZy0Alnkxlj5lyl+VKoanl2igS?=
 =?us-ascii?Q?52FV4xXuwN/bDFvzUMiMt5UvtLRPTSTjkn5ERsUheaxavDCkfcmsZ0tBNZMr?=
 =?us-ascii?Q?yc4dkzGTH14Bl11Ra/8spQjx4XlaraEshk9nnFyMIybge6E9SKgQMd6w0yhQ?=
 =?us-ascii?Q?kPRskSyOqDHDZT6GSvB0R4llDMuorkl3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6owoaaGBCcFFzeguDz2AKYI2dM8/ft13wte1HVPs59Y6HLUlE3L5OAqV/pVq?=
 =?us-ascii?Q?4ew382scSuI9UcCdTngm6XsOoCckLp7wKoF37gl9oGjuRFAn49zyvbFOyTKD?=
 =?us-ascii?Q?Sq9htnBuhIR56S5p2DCQjsb/AYs2X8ki4+2MREH/YPFuiak9ksDlYmXf/X93?=
 =?us-ascii?Q?xbrnoFOLUb6MA06QBR6G4JRJrSK2mvHtZ6mCNtfgD4n4V2012QBVTn2vEccS?=
 =?us-ascii?Q?J69f5PoxiWzJta0q7t6tVBgP6DixDCGpQNid1szeM3nWi83oP7ZnZXDAM39d?=
 =?us-ascii?Q?ni5OHmz5ZPzcAmU3m9jDHSCEgxNMnNoXnyfA92D39yzq1NqxeyYBOX6HOJOf?=
 =?us-ascii?Q?2Z+UY3/ngLlR4/33iU5IsBquk1W1jv+a8xuPeBX3LTuelkmNDYC8vAaJB/yL?=
 =?us-ascii?Q?RtOS7WEiaoSDyLp5tYD2FgYvdoAYLdUCCbV894aWLhU36yYIpasqkAfORu7r?=
 =?us-ascii?Q?82eT8HXKswbKyHPuDLbwzPVSnL3R2BgrrUclSiNX8OO0zXqI+fKmUD49xGW1?=
 =?us-ascii?Q?NvVMTbhQBl+vTs7rcAD7pmjLfSy5UF/VTkuzSCrRFs2f6miseVydVkGsUY/W?=
 =?us-ascii?Q?3yg2OdTHZr2WyZQTkUpqDnMhgIgrPj+tDEkZMN1VfggM7plDy5qnR9li4dTO?=
 =?us-ascii?Q?vaGY1Fa1LTTL1rIxaXhKhXIBKkHjqnKeojOslyH0OJUkzh2l+TtWhC4imR42?=
 =?us-ascii?Q?lZYjIQWkKJItr8R2R653ExFrcDxdrXYBGz3ROcRKHRum0cWG0wT7ImX4XzcH?=
 =?us-ascii?Q?lPqTdeDTc1sUOZ1Hf8YhpTLAgfJlQBo6enuoP+fFTSn1h2+ZFzV9AWdhwQrx?=
 =?us-ascii?Q?nHBEVoJmXilbN7I2Gvy/8xWOLRAMtiaNXYrKQKYfUvdEexGYS2HnUpYjFacA?=
 =?us-ascii?Q?uQCSw6ehfpoG4y0Mlp5tQfYYc5lkLDdJxp8nOETD+03VNkO15+Fz1CH7/Hst?=
 =?us-ascii?Q?OiNvSnHXdtlukrtrlt90KqNHqK96pCS1b6kLz9gDdzMM3Gc9Purm9n5uIVtH?=
 =?us-ascii?Q?maB8Xk2tFHxSmXdEDJksHsYhVVxeEN94HdC3oyyrX84UT4KdAhphLl+A8yI9?=
 =?us-ascii?Q?NA81SBHGg+84HpZM9MoCBpvKNznD2czHb/xTDYYIS70DXo8V3iEliBRYgS7C?=
 =?us-ascii?Q?aYschIZ3ChKuZsIJSNSDdVFrcATGwhULFmaYCduPM2mAU3uA8y/qcXLv85nE?=
 =?us-ascii?Q?1tRU6YBA6RGjROwHM5DYoPFG8XnLk3DE1AramvLF5/FZoGVDIK2NBUv6TTeu?=
 =?us-ascii?Q?uDx9l8P/GW2A88OtcYp7/nw0YS2ncJiSCZ7DcRTkTvjrzv4UVNRhiYg6KtkP?=
 =?us-ascii?Q?4rVXZffpXiB61Uz0MXamAvLwWcUklVUnA1EEJiRGvfx8x1HtaoyfIQ8HoLfs?=
 =?us-ascii?Q?XY6yTt8AKRTcvZN4WYz3PTh8DObNDR5lLxMBNDNPtt4PRHnyU/AqnSME15cp?=
 =?us-ascii?Q?ubojMDsoynqz0e57OK/LWfgyQOgEtqvHMIUPiERVCVBBJz4oIneQp9Rxc4g6?=
 =?us-ascii?Q?st6inxe5OpvF6MFpkqF0V/ee+gSi/+Qs4Yv9FeicGQF1fca84TVzlT/TeoW9?=
 =?us-ascii?Q?eHw1PBJY+ppUZ6UB4aeYWuKC6kkbNG1+FibdWeqqtKsFCgAc0wQ5iscp3VDk?=
 =?us-ascii?Q?vg7KWICAQ6lAa40HD+RJCX4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 500255db-28ad-4b01-d31c-08de2881dcbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:12:15.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIkeRnDoMHtF7dlqhX9g60IqhbQXIhYOj5Yuy5r2S2sOn5UAAIaVjPHWgqIhlA8lH09te9SwPoE34neygynbGewPIqutDGJxY/pnK+zZ5irMDzjfMPcAErXxQEXQE4aP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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

On Wed, Nov 19, 2025 at 09:18:56PM -0800, Dandamudi, Priyanka wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
>> Konieczny
>> Sent: 12 November 2025 11:24 PM
>> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Cc: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple
>> placement test
>>
>> Hi Niranjana,
>> On 2025-10-31 at 11:35:44 -0700, Niranjana Vishwanathapura wrote:
>> > Validate using virtual exec queues with multiple placements.
>>
>> Please add 'intel/' prefix after 'tests/', so subject will be:
>>
>> [PATCH 07/18] tests/intel/xe_exec_multi_queue: Add multiple placement test
>>
>> Also do it in all other 'tests/xe_...' patches.
>>
>> Regards,
>> Kamil
>>
>> >
>> > Signed-off-by: Niranjana Vishwanathapura
>> > <niranjana.vishwanathapura@intel.com>
>> > ---
>> >  tests/intel/xe_exec_multi_queue.c | 30
>> ++++++++++++++++++++++++++++++
>> >  1 file changed, 30 insertions(+)
>> >
>> > diff --git a/tests/intel/xe_exec_multi_queue.c
>> > b/tests/intel/xe_exec_multi_queue.c
>> > index c9ff25ffc..eb40e92d2 100644
>> > --- a/tests/intel/xe_exec_multi_queue.c
>> > +++ b/tests/intel/xe_exec_multi_queue.c
>> > @@ -379,6 +379,31 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_placement,
>> >  	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>> > flags);  }
>> >
>> > +/**
>> > + * SUBTEST: virtual
>> > + * Description: Validate virtual queues with multiple placements
>> > + * Test category: functionality test
>> > + */
>> > +static void
>> > +test_exec_virtual(int fd, int gt, int class) {
>> > +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>> > +	struct drm_xe_engine_class_instance *hwe;
>> > +	int n = 0;
>> > +
>> > +	xe_for_each_engine(fd, hwe) {
>> > +		if (hwe->engine_class != class || hwe->gt_id != gt)
>> > +			continue;
>> > +
>> > +		eci[n++] = *hwe;
>> > +	}
>> > +
>> > +	if (n < 2)
>> > +		return;
>If n < 2, test will pass successfully without running for virtual queues with multiple placements
>Which is not expected, when condition is not met test should skip with reason something like igt_skip_on_f(n < 2, "Skipping test as number of queues is less to validate.\n");

The virtual test is for multiple placements if there are more instances of an engine class exists.
As the test runs for all engine classes, if one engine class doesn't have multiple instances,
then we shouldn't skip the wole test.

Niranjana

>> > +
>> > +	test_exec(fd, eci, n, n, n, 0);
>> > +}
>> > +
>> >  igt_main
>> >  {
>> >  	struct drm_xe_engine_class_instance *hwe; @@ -404,6 +429,11 @@
>> > igt_main
>> >  			xe_for_each_multi_queue_engine_class(class)
>> >  				test_sanity(fd, gt, class);
>> >
>> > +	igt_subtest_f("virtual")
>> > +		xe_for_each_gt(fd, gt)
>> > +			xe_for_each_multi_queue_engine_class(class)
>> > +				test_exec_virtual(fd, gt, class);
>> > +
>> >  	for (const struct section *s = sections; s->name; s++) {
>> >  		igt_subtest_f("one-queue-%s", s->name)
>> >  			xe_for_each_multi_queue_engine(fd, hwe)
>> > --
>> > 2.43.0
>> >
