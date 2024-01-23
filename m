Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A52C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 18:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B0010E83A;
	Tue, 23 Jan 2024 18:18:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040410E83A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 18:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706033906; x=1737569906;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fc/AOMI1/Dtf1Ydm1zB6z8N0alVj8itJf0Y/BYQSCd0=;
 b=cPbSHSoQvFh33zYsO5bJvRBYHevxyaL/bfkX89AsGdSMQKj7u92sijO8
 5lmJYkE67yTAYmJoDzQ/UsyME7RvYWHkPGq5Ervkhc1SPwP13VPZ5EJKM
 Q4uPw38+QdQacBl4GSHcb6JGklO65aO6hYYP34OhLWM+iwvRr/e9Iv9DL
 cEntK2Ku0e2cGIJyoXvqag2z+bB3RzQQxWEsKtIUEB82NJKUM46asKHVS
 Q8crKg6y0yBg8cLgBCSHz3Oe2t4TTTkF6sfEAXaCUSBGb3y6bnUIPTdpD
 f438NToXQynyrf+ZPdNFs2s0T8E6VYeqHp58iobX295B64EOiA/fcRYz8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8280194"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8280194"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1700921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 10:18:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 10:18:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 10:18:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 10:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmOHzuuNj19ab/oIxgLUf15wNb+5c0ArFWRpRduCzBCnoS+DqS78WRGGWqHS+S92vKVRFmrY4v5qOoPE7ucIPPPWv38GDs8n6OO+t6Q01hrZdMApJDYTOZ/QwrPa8IUP56+CqdmPNgr1x9VCDcEGeQcoNKVcP4/4QqLdGNA7M+MPu6Y+xfAyOQBUKRwyAgKbP+lrK3vufTKBehm7mFmVy0QY/WowC+IgtJbHccHtTfMgOaz/Esv2dr8NkrwpemKE1N2WZ71yKxWE0bBfqOM3HKvuiyEN9bug5A79fC8o07u5gC/SwINcEpyXAk6TQ0Ta0+tYFR9PWwJlbr3XRcvOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc/AOMI1/Dtf1Ydm1zB6z8N0alVj8itJf0Y/BYQSCd0=;
 b=N0pwYQNw9O1UANkcAn4SwY1ITkvAVegoAJheavKza9Z9XF2LytcgSRz3NJeqL0Oi5bATpMNOpqyIBufj4oy94xvd6W/3yFQHJZ4hxAfEgk5nG3p9S/mf0qX2cHhdp7M7yhe5O+NtsHWRttxzsfcqycVQaaQTcPpRfPpouRqvWOFmHPUZaskNW0/QjT0kM1iIIdBbS6Jm401ECmRwxCGgJhhMlakweQ1B3CGty+jIS4JLetE5YQMdPK5J94nJYnxuWATRKnvaWXdSd4Dyo6N7QvADuAAK3dHYUhpL8B3GViQJ5gwj8TsX4/VFK46KYXglgCMNuiB7+UZhsvBNTuVMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 18:18:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 18:18:21 +0000
Date: Tue, 23 Jan 2024 12:18:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: Re: [PATCH i-g-t] lib/xe: Boost prefetch size to 4KB
Message-ID: <hdqniyfp5pdav3joeygl224j7t6kmukz5uwapnp6am54fjxow2@qhkhq472gka6>
References: <20240122154302.54660-1-matthew.auld@intel.com>
 <hz2mhm64qw3vusw4qgwvf5pvib3xskw6ldn7zjgjeqgfm7j5f2@swwcz2vw5s4l>
 <20240123055636.l367u7xqd6jcqygn@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123055636.l367u7xqd6jcqygn@zkempczy-mobl2>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 5107c158-8dbc-4593-f6b3-08dc1c3fae2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HGRbYskadN6kSlCKzTZiAUy3+sWdoMDZiZcNLLGLOCAcea19MKS/quVPK4JaavVoEzi8ncDHRxQr+cUFOnM42efGksxRRyIFwpba3gFF18M4BMJrn0R01/fkdlyHrlBI4P9GtBikh2v9reTbmOJ34JN/JqQqeochpGKvEJkXlhrCzlcxkFvc8lUqogFuFgrAGtkrHE87pfchi0NPsS6II0wz9hbtcY3wDKSXHGaLxk28Ev7MxUkDN4g1eP3mmFFk2MFSwFY3EtkjOyjKf8d5v9dz73cGMLb3vbictgRWRApJXjMy4BJcEmU/8G6hlIu0sjliE0NHRUtZpvXIPYNaz0mx1nuCxG0Z7vEmVa3zoSXmJ31vCCvYna2AfwsoKlWWkszyk4Cge1nG7aDEUMVWcfdU4Pfr0NnMVfEZHxmy1quNmD+CHRfSN1V/eSYXFe45lxEcvZov+KI9E5oRTKHuflCnPz7c4isGGVZdvBIIZPkm04bRPqkE2aXXFgkWdE5awXbBANeCQH6PArModya9MvdF+wyfb7iXCueY2NZpPxyWNGmcIpBWdyDSOCpvGNv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6506007)(478600001)(316002)(6512007)(38100700002)(33716001)(41300700001)(86362001)(83380400001)(82960400001)(6486002)(6862004)(4326008)(8936002)(66946007)(2906002)(6636002)(9686003)(8676002)(66476007)(66574015)(4744005)(26005)(5660300002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1docFV3RkRTbGFuZHhQVkM4NlBqaTZabE42bXI5L3RJQm5xdjkwQWM0WmxF?=
 =?utf-8?B?NXh1YnlMdUZ3TDJLT25QdE1PMVJpd2FZWFBQekZlbGN5UmlXWERLaVB4ZjV1?=
 =?utf-8?B?RGZCSmN5VGE2Ynpsb2RoODdZd0c3SHJHckxHTkR5ZlVjZi94ZnRRWCtia2c0?=
 =?utf-8?B?eW14SnpGRzJzcVM2MkxvQncxMVlqcXJTMkdzdjV6MHExOHRXejZDdkNuN2lD?=
 =?utf-8?B?RWdqUkZmRWRkZnR3SSticE9GUE9vaTVqbDdOKzRwbzAzZnRoQUUyRjBDM29C?=
 =?utf-8?B?Tng5THozSEJVdEh1Y21xZU5HTEt5TXJGYkpyRTVCTVlqcU10ZTFFdDZ5dmNj?=
 =?utf-8?B?d1RJaU1SdjlldUJsRHN2VW1maG9BRkdOc01SaWF0MW8zaTNtYUxlNlF4K1B1?=
 =?utf-8?B?enFwMXkzWitzaExScFhrWVRGWHZ1bDVkNytueXY5YXlVcUJhT0wwcit5NEJo?=
 =?utf-8?B?QytwNk5XQ0x0R2o5dzZzeVRremc3SzZKTmhldlpoTjk4blkrQzNhYy9Ua2g3?=
 =?utf-8?B?dzJkeTAzbTQ2eE1LVWxPdDJKSEJFOG8venFmMGFvWmxubFp4SHErd3U4dWNS?=
 =?utf-8?B?ajRVa3J5UU45WGxEbTdjempIQWMxS04yN1d3TThCN2ErZmoxTEJVMVJsczBj?=
 =?utf-8?B?L1NXSlkrZkVRMVRZQ2Q3UHVoOW1pUU45UjFqK2Y4K1NueGJUWmRLaVZxM3Jn?=
 =?utf-8?B?Ylovc3JiN2t3ckVkOTE5eHN1aDFCSzRPMVZaSDJ3ZUMvazZIaDZUZlU3V1dq?=
 =?utf-8?B?VFNtTW51eURvKzkxMy90UnZKZHJQaG9jZkJMdTl3VnhFaGNGRDcwb1NpRGt6?=
 =?utf-8?B?VzZQNHBZS1hnTVI2czlPbU1OM3dBMFN5V3FKS2JKWHlCUEEyQ0FXNnl6TkNu?=
 =?utf-8?B?dzVHdFhUa05NemxqM3pLS3FsQS9WVkljZUgxaSs5cFVhMUx5a0FFdEw4cVZM?=
 =?utf-8?B?MitvR2pDVFh5WUJ6L1N4TXFhWFc4VWlKVDF3dkprWU9pTExkWmJ0aXI2RlFt?=
 =?utf-8?B?Zk5KbktQSzhxNWI3QVJXNGFVNFZHMHQ5ZzRJdlQvQTFicTAwVEI1bHN2c0Ni?=
 =?utf-8?B?QmdOSFhhSW9iUVFWVGl0eGs4cVlrUVRSUS91cHR3eklMWCt2S1R3bG9sbWc2?=
 =?utf-8?B?VWg5YWd4YlBKVGtneWVaTzF2b28xdjBqTXQxVDBCMFpYQ1FCUEdGUjM3Y1N1?=
 =?utf-8?B?M1lhMUp6cm81RFYzWUpzR05kUVlMRmdlblNiSVpsdDJTOWw1blQvNnhKTU1o?=
 =?utf-8?B?dE5CQzMra3FKaW5oTmFmcnJsWVRsb2hpb3k5TU5qS2JuNlVxbUlTSzhNbEZy?=
 =?utf-8?B?aVhRb2JOSWNIY2Nicm9sc2J0NFVvM29vZWpZK3FLb29pcVdLRjVuQkxBdTBu?=
 =?utf-8?B?cGdmNG5qQWdCcXdVcktCdnZjTTgvQS9tSjd6WVYyazZndTIzWkJMM21GMDVa?=
 =?utf-8?B?ampVb1Z2dEJrSEdqdkxSTkt4MHlrSmI4UDVhOFhNK1ZzRy9LeFg5WDYxZWNj?=
 =?utf-8?B?NGdnbldSSFcyTkJJbkt0WWxYWHQvcXFTMkF0YnVjempTTW9EVFM1emNRUmRt?=
 =?utf-8?B?bzlqYjFuRXZwUEp3U1VKK2ZkcitmRkJvL3JOYVcxMVhNbE51VHl1MExhSndm?=
 =?utf-8?B?S1ByWTViLzRTckZPOVYraU5TMFVtekZwZmU5eXl4Nnh6Yzk4ZVB1VmRQSnZn?=
 =?utf-8?B?djJ0QWVFTmJ2d2orTnozeDBVdGdEVjgrWUF1dHhuU1VhYXhoQjFxVy9wdlRG?=
 =?utf-8?B?MkthbUtTc1QzcmRmRGFKVVVtMlEvOUh3ZTRtTzUyd2lPeDYwendkMHNFRGRy?=
 =?utf-8?B?eFFMTE00aE9HQ2hmczBaNE9WM3hqWEhHWVh3Q1NVeUVSaXFsV2FwSmhhUmVR?=
 =?utf-8?B?a0IyR1g5K1FrRGc0TVpmZktxMXM4aDR5Wm1aVWIzeXJ5VFd3V1FpR3h2NWpH?=
 =?utf-8?B?VFpFM1NqRW1lN1NldVh5eFBBeHRTQXI0ZDJYUGxkd0lJNUxkcGhJTzcxZisy?=
 =?utf-8?B?aUw3Q2gvSTI0SHlYYVZJSGFnck93Z1dKNTY1RkR6ZndCVm5CNlRGcThhOVRW?=
 =?utf-8?B?alhnaXZVZm1oM2FFTzVGNG1NUk5JVGxVMG96b0drT0c0RFh2Y1M2MTNGQzhw?=
 =?utf-8?B?Y2huWFpZOWdRaWlLa1dTaDZELzc0eUY2Ym9DUGZUYnVjZVBuSS9DaUJmYzlD?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5107c158-8dbc-4593-f6b3-08dc1c3fae2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 18:18:21.2209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCWRgTwQteXuVFAou/or01gUPDbroIP9Mc1ry+3PtF2avf90veRyAwWMzGQY0hoO69Vxgz2rc65m33jZPAlVwG4aWCMJl/FsK8/Db75ljrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 06:56:36AM +0100, Zbigniew Kempczyński wrote:
>On Mon, Jan 22, 2024 at 10:22:29AM -0600, Lucas De Marchi wrote:
>> On Mon, Jan 22, 2024 at 03:43:02PM +0000, Matthew Auld wrote:
>> > From: Lucas De Marchi <lucas.demarchi@intel.com>
>> >
>> > For Xe2, the prefetch for RCS is 4KB, so boost it.
>> >
>> > BSpec: 60223
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>
>>
>> humn... looks like I forgot to merge this?
>>
>> pushed now. Thanks for the reminder.
>
>Nice, but where's r-b?

Note the 2 s-o-b, with me being the author of the patch.
It wouldn't make sense for me to add a r-b on my own
patch.

Would it make sense if Matthew added his? Maybe, but I don't think
there's a real need in this oneliner where 2 devs agreed on the
implementation.

Lucas De Marchi
