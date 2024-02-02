Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE15C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 15:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454DB10E6EE;
	Fri,  2 Feb 2024 15:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4Qa8oWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A4D10E6EE
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706887563; x=1738423563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yLlxEihZnqUKOtLRgEc+2lpqFIzi9Kopam/1UjUyMXU=;
 b=a4Qa8oWthYHSt6TipdJJzOZ7ns0zKzYhJI6DjIvjIfFN0tTwNXk5v5L6
 B54lHUCqxq4hy+gDj3NNQfCC/164DsRvpYi4caLC69gNyKxo0hr0Wps3v
 ltyTy3x31mOlHrZEssaD5Yf04wgiGKwFAmHYVvnHb2fUJyTxGnfZuvSz1
 23T9UJuvFiGjIMlHmLnpJ5CUjX3RIOdR5BS+XfXfFJSrChYFbbEK555Zx
 g9gNhGOYo/TAykMXrBODUe0V7d8xFX8JZrBNJxiUR2SD2jHFCRS7OOw6t
 6OFTLSkE49ILAo4PRGvGnWqtQnimJ8QDPbv2Irp4BobootFdXeBiBHm4G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11275202"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="11275202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908600622"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="908600622"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 07:26:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 07:26:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 07:26:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 07:26:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7MH77rdRL9hyFzYdELB272fQk2ZoFOPHSwGq5pMzu8h+6NiIOx7w1mMOXOVsfzNHb4PEKGh8paaOW3OlZHzHbz17ZQeADYHipahXvapzijKTmc3XmxYZRA5w/oePaALnQHCz1XQgKmhSSgr7OqoZA7XzyEnh3do7CGWHoTwsbp0CKimlKubVOS5wgnNbimNGCbn7inCjaesS8X5gXP6fjldpkR+lkQqAM44D/LcMlD56hEFCI81ZPrqWNYdtZ7o7pOSplU2MfwEDxqefwhHfFBugamfhS71WixMTDHOUYw9q/SDl7gCxXGbc3QeL1+H5bwSZMusAnxqa+CtWFdxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpsdXCZc3hgf52e4jjt2SgShWW/j8fyeeOrLtxopPPI=;
 b=igJljek9LicX94ZsScuIEN5aRvn5PhyGD5+0gF9Yl+24XoIrEBHFRc2sI9zHXnHDyzAkWQ4KgQRhk6EwYAZJQWu8xFAWw09WQdVwKmDUTf2DFCocKn87SJlSOvKhA/4dAxe5YebbSduWg9m03KK5xuwZorJVuTgNkWrjUsqTfif4+oBiMxS8lLlXDnl3tEu6vEn5dqWR1hgQ6i1nC2ddXKXBLCCkdr114xezMWr7AU4z9T5DbmfBb4xG9r1+hfueYbk+l6QXvRae18ebsX+28RW14mRfruHdsp7GJY6EvaQIJ7MiqI7ViG5qvcqyj1fcUDZ/VBwQeyXQenRDqIJicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 15:25:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 15:25:58 +0000
Date: Fri, 2 Feb 2024 09:25:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <ifumqs743htqmhkxsns6zievakgadvjcbaqb7bva2cievhfu3x@igaj5s2kke66>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <20240202004529.552806-3-lucas.demarchi@intel.com>
 <3493194.som1txNFv6@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3493194.som1txNFv6@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: be653833-512b-46c3-bc23-08dc240341bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpZhmgeNPKeHRVNthWimLCFYIAbYZY4QkX12yHdWhOsnLFxEfxxA9KbGBSrt7qvww/GPblozsiXgksSntmcBbzXB/6oF6Df+pVf5v1E1aXRqGlsJppiNyYpdyXp8gKR3wDN1ZRGHLhCVuOcAQou8BQLwrJohU7y1N3yiCqBQr8CDpGXjD8MDUZwXW4cIU0o1GVSjLtKkgJfTXWQotK+Fwh2MoEej7KkS7HnNbtIwZcaSzjm/2eHQzy0N3wtYEIe6bE0sP4dOozrOYe88LpFwWUKMOiSaEhVbte5QyAW9jExzfc+iWbs3nyBOdB8gbvglf1+aHmjLKikSBm5GVqIoeBRHAz2/LB3TxGSNdGUQue7r1W6OtuFx/wzPskt2uZhnMWXGJY6RPO3kYb7QHkAxFpD6Va4fCigSHGLVETKGlCMiCW3WtBA9XXGlkzPUwddq4zT/qfLqlpVqijS5Dy2Lo2Tisn4seypIzV3ySYCD/I79kKVq0IzRsZlNkRiXrvzsrYwVR/GGiMJ+UxSDhPDeQBoPT5MMYmAZc0MaePgQQRHT9AvIWvLnW/88so+CjjQ+YP7DITA5d8EIDwH8l0bvEfFb2OH6PvyLkS7upS3lYGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(8676002)(8936002)(4326008)(6916009)(316002)(66946007)(66556008)(66476007)(2906002)(6486002)(478600001)(6506007)(9686003)(966005)(6512007)(26005)(33716001)(38100700002)(41300700001)(82960400001)(86362001)(76704002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XtfHjnfgYyczxgqiB8Y+2gRbMeto8ovD5mIO0m5mg6NnYOzrScBD6BtbHg?=
 =?iso-8859-1?Q?tfcK2pIHwMDBgbDM7X8/xTMcx5x9U1750G856YXmfF23/lrnsSQf0bp6IC?=
 =?iso-8859-1?Q?ch/4D6ITi0/O5LHcKCZ51vN3dbBXsArlwtA4fg7bY8qEZTPpwZJ2zR/cyw?=
 =?iso-8859-1?Q?ZhkZnYKWSKx+3TR12Uxdf36jRewgu8Kl0LFHfPFIYic/m2mRtM4kVdpwRZ?=
 =?iso-8859-1?Q?mbYyDhTCdcddDkmGZsjW28gmOIHjdh5gLNHiAgrMuaRVPbjGe7ugDXUwce?=
 =?iso-8859-1?Q?8PLHWQOD/M2eEph/wvyayuhJB/EqJ3PJ1ePiaqP3pnMx/wGE5aDN9Ho83H?=
 =?iso-8859-1?Q?xXre2QkIZWrw2aiSvVXWgFBpvW6Fj5VI+m2guMTDvctYbpwSXDwPBA3PHP?=
 =?iso-8859-1?Q?0tvy4mVgIlkEZ/9pwulOM33rvihPfiGZHOzI2IXm1URIvj/64eDARYTdu6?=
 =?iso-8859-1?Q?ERb2on+LQo//guLVzxnVoOaV23fZFQ9UUmhCjhdgv9bpWc2eaoM5GwIDMO?=
 =?iso-8859-1?Q?xhroWCmqXJ23xpcpXeaevI2d8os9PrZCd7FUWB/S4cl2Scobrb2OM/Xiqo?=
 =?iso-8859-1?Q?Ye4ZRi047sOYV8tCkhr+4qAEkZv/ohvDd4QypKJ3e6HdJVL+ElwYX0LpA1?=
 =?iso-8859-1?Q?26YjAj5V5ZHh+Gnflbo0tmpckHssTicTE1o+g6phrIjK0rF+QNL69krEp/?=
 =?iso-8859-1?Q?zQvTQ4IvAd/R42AwsWN5UoDiCWdM62gFAKHMdsBDBUQIPPbYC4W362cDpm?=
 =?iso-8859-1?Q?zHSxZRWzInBJsS7NOBNsTLqB4bxzm8fxtkcbuBVu5x8NRCPwH61M/Khp/N?=
 =?iso-8859-1?Q?9ZsOF48DgibubGKPHOW3+wnccazLGPifdODG73WYT2O04VMqxvJh6wMbVz?=
 =?iso-8859-1?Q?S0NQecLWsK0RwrTJmMk1zLZmtSswFHb6JHhWEqHex2kjjbfa0GmvdL19/N?=
 =?iso-8859-1?Q?FKxtj6hO2FSaa24wlTXJM0IDre5dLkGBzj6IU2dSJWiLCKmYHJKAn85Ea1?=
 =?iso-8859-1?Q?GF7dbElCuICyAxl0qoR9nfbBwA/EyTTBDsCKHvchcFPDLYXlnNQiFyJEnJ?=
 =?iso-8859-1?Q?LIPVBlDDH7E3ZaBgTubZ0fuMTJT9qSnPFrwU80ZpWqsGPIp4BPApmDHa9A?=
 =?iso-8859-1?Q?+UJFEWMz5pJYDCew+KcP3HtVgr6TyRc5/XfxA315Qkk1dy9K4m88CqDNIk?=
 =?iso-8859-1?Q?2ho/zTHctIjW3bRfb6WFSX4dOzzjqrVn36dE/AYmGLlmqCwhrhhJik4GLf?=
 =?iso-8859-1?Q?WgTbX1+fa7HEP3otaOXuLd1JonyDR1DQDTqNKQZFMKRmSy1n0urVtodbKG?=
 =?iso-8859-1?Q?zQ1sYvpUfMNtQBsiLEhaq46lN9j3O9vDdi1n9BBfLkD662KODkIgmIpBwj?=
 =?iso-8859-1?Q?rfe+6A4ipZik5aa0BghRua4OcmWljDBe90ubGGL3BkPtjpLkq3jAkrqHvC?=
 =?iso-8859-1?Q?V+0g9Qn9MUb0L2PsGyV62+UwOH/s4xcvspkjfRzuUnvDDaJUnabQ6rBwmB?=
 =?iso-8859-1?Q?SZrb/W0avRyChuKYa/MDkSWEN48vJwRk+1m9dEGj2X27ITsnz0i7Oh1Hvc?=
 =?iso-8859-1?Q?0Fc4bx0tvciusYpFF0+1kYn5Gm0gZgzEpKZyhZLrW1P/UeQMdlFBkNGNze?=
 =?iso-8859-1?Q?M6MH6y+lKHd6JqiA2zoWQiiX9vGgUoA3vHsHTMJWH/FgOHRv1vzyhgsQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be653833-512b-46c3-bc23-08dc240341bb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:25:58.7434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fc0mu+IH0N68ZPegYOhFXOyoO3qdzW2p2a1nQUr7V4cv+t1coSir5QnYhNyjC4IrAQI70bRnYBIX6dCDqbHAwHMPZo5ieiQzRfatzVDek68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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

On Fri, Feb 02, 2024 at 01:00:14PM +0100, Janusz Krzysztofik wrote:
>On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
>> https://patchwork.freedesktop.org/series/126786/ groups all the live
>> tests into a single kernel module. Use that module to run any of the
>> tests triggered by igt.
>>
>> To make the live kunit tests work, rename the subtests so they match
>> what the kernel uses.
>
>Both the KUnit module name and the IGT test name clearly indicate they are

kunit is usable without igt and I'd like to continue it like that, so
what remains is the kunit module name. But then that would imply using
both filter and filter_glob rather than simply using just filter_glob.

>strictly related to Xe.  Then, I think that shorter subtest names, without the
>xe_ prefix, are better in that narrow name space.  Couldn't we then rename
>test suits on the kernel side instead of adding that redundant prefix also to
>IGT subtest names?

I don't think it's a good alternative because the test suite names are
global, regardless what module it comes from. For all the live tests,
they were always prefixed with xe_. We do have some normal kunit without
prefix, but I´d rather add the prefix there than remove here.

Lucas De Marchi
