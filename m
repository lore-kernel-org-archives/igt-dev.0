Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5263CC48286
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 07:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351C112A2E;
	Tue,  6 Feb 2024 07:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3oNRUHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3228112A2E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707204354; x=1738740354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oIE8K1rkuBjn3t9nmXPbYkjHQQ/0lchAzQpgb9QvVMk=;
 b=a3oNRUHQbU80soyl/NGHJ4aSGbM9vENCRrXEPgrwAenAzFuktj+STiTZ
 v2rLz06xm8zQuvxnB1loLFsQFcYgEXwFCSadaELLMO4giZqFq5+bBVhaj
 aiTyJkhL/SG+XvFr2/gF2yPNA01dfXxSq85McU/Lt/JA41VV5O0BZbj1t
 zOhmpvT6ddk5EP63W3JRPd3XTzqg2ptslLZ9JpT8uAtEARLfrjhE9kQdl
 KsP6EMyNC3ld0OEp8AEZDZMGd5qOXC5M1wiaeyQq7OHCanLybovI4r9Cg
 Pf49mBfrOPHvZ+S4L0P4kTItaiOvzLqSGHnlvpkuI/akM5NPupMDvt9On w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11773065"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="11773065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 23:25:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5551776"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 23:25:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 23:25:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 23:25:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 23:25:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 23:25:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERy7TE4qTndTWRoc3W52a+PL0SUSNJFdyY1IHiy3u9XGhFux/mJJkjRghG1jl+lDZ1wIWoYOAS0Iz4F4W4SC4wvoRETvLuiXKC3IBclE/mALEnXIwuxSTUC4KQ6J+P8Gdpe4o0OI0xi7SuePDdTVcvMuikpFPhR5dM5RCyH2H8D//E7n7qBTzSAMQsh7V/98r20pANC3Ug/nVeg1cG87KLxyyQFWwxopLHMANx4hWQlmLcvqs6MFLiQjAkVEkyLDQrnUoAjn+psd1C6HgtWs96rBQ/5CANGrxom9MY01ep1/exu5QQNHMzhP52XY+Y/GLr6LdlX7VP1ONOcQ5tdu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynvEsRe7YLHw/9JE9mofCvv4YXX75+12BJa9n9ZRSCY=;
 b=RvDKkD5VCqWc13XWPmgzZzOhbko8v/Ta+QEvuH55+sED3ymaI05IF4bADrwh5Vm4naNsjUikvbF2NM6FjtEC5lHVFJq798sOkWKvyQyAg60bROXwqg4NSt5O05pcpYWX4GMBKXpZvkoxOrv9eT/e4kxXmgQXkV6C3p7Stq58ddJOnFVsTlQuxrYLOxYPRvV5JUrRPSvKYMYNPBb2TTq3wWJ96g4ujZ2JcXjLozK79eLnnud1JeHmCwZu2qFDuA62Vm7T6rm23RLSnKZ0HCy+NgVeQH54I3JeR4SV56sGpcmACfRzddZvms4RaosB/iGJ1VNzO86JRSnnmOyOFYPfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 07:25:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 07:25:48 +0000
Date: Tue, 6 Feb 2024 01:25:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: RE: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
 persistence queue property
Message-ID: <7ukemoqwgresmju3x75oqjmoi3yimfgpz5r2557dhkxn4fv66k@agty363agfeo>
References: <20240205060225.35672-1-tejas.upadhyay@intel.com>
 <SA1PR11MB8428E53B7F5248D735C845868D472@SA1PR11MB8428.namprd11.prod.outlook.com>
 <qq7osstwzjkbz6h34kwwyb7ma3wxgzeqp5qr3gac6torzl2a2q@2i64awq4ltd7>
 <SJ1PR11MB6204C6F3B61024F92E0DD37C81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204C6F3B61024F92E0DD37C81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fe23f3-7ba1-4586-fa82-08dc26e4d711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hx7Ov0Ju35CrLx4WO31XMHcNtL6NwTOM/jxldXoYJMEZxJLohaOMwRwmfs+BB1Skl9RRjzTgeyix8Moc5B0flxXBGjaoIUGBIwF+a5o+5DisZPuUHLqp8ripRrxFsPwdED35LbhNrJZseewq1L24rY24GKhGRZ1zkzWjBofac/xSpk1B8pbrrn6+YWzauCjbFCJZLWYUcywKMY9HfKwP9LaKzr+UgyhJLLmHkOlvDT/NEWLLYk3zZS3uNuQNC2F9hXBohRt7onpD3kTHQPT/0q/6KDWP4yeXGpS52/O3xyLobQARawfJ7f8w6fTm1nTy26jUoaC5+9PBnWBAn22WRTtavy64wnpsDKm14thst1QNAAOonUszHcvs5MIDwqAuDlKTe/l1SgrxMQd0jj2aAKSSJceAtwjLf9yWE3LOK+pCKRHpLISqZ23jSnm2tmQoJ6gx+n2aEJhWN+BhvT42JrbfBYi7zfEshrw/GnJsKWAcjx5JU+IZfOP+8gmFxaSMdLIaZasNvZvIpX5acGejByJ3f2RTZg+ajcG8o4MxiA4SiM/+lmzMrByTXjHkvPKrh18hhEwHxRPkRHX0WFfKpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(33716001)(41300700001)(6862004)(86362001)(4326008)(8936002)(8676002)(966005)(478600001)(5660300002)(6486002)(9686003)(53546011)(6512007)(6506007)(26005)(54906003)(316002)(6636002)(66476007)(66556008)(66946007)(2906002)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WX8QnZy4K591bPoZ8zU0howctUpkSbcol3f297Mrm7CjM8nCILowljZsoFo2?=
 =?us-ascii?Q?8TJhzIpUwRM8aLmQA4O4Z8B9sI3TVwxLISXltgT3NFsmEaRRks+LgPdhNv8D?=
 =?us-ascii?Q?9pbXzmpmSeSYnp2HHLuIQ+Co1fW4W5ho99bxsj55OpV01w1mdcWDaKlvscKM?=
 =?us-ascii?Q?zBIJ+og4tDYezp8zmnV4M5K1qN/glsbfRAfIa3IDSZ65Pymq56PM+DxMp3Le?=
 =?us-ascii?Q?0+Bqk9nP/o3pBi5ZXqd+6uBHjehCFdwZF5bQYD6t+SIl/xg7mnnTyS15DTUl?=
 =?us-ascii?Q?DigdfMjuRkX9kpPYOKyKUcpiI4FdnRW+NkfDFj0FvLTcoAWvY2VytthzAHZH?=
 =?us-ascii?Q?W739H4dwzFfm4j1YEP0Rx6q538QX3JcYgABCYThXHPWzxYVeLlK2T5Cm7dUa?=
 =?us-ascii?Q?AmyLNxZvbbqabqDFZW3h18U6zFT9vGYC3BrlEhyzO9reW4G0zLPIV5nNfjQ5?=
 =?us-ascii?Q?7dfdOD1FoW+PoMWblgTBD9uqZc6JlGkdv8ItdpS4Tzd4t0B+X1EIdtqMVu/H?=
 =?us-ascii?Q?i6Um/UI8jpQi4RsbhahVqEC5xMJNVrsS22ZNvKojKXaU0NZf0KEsmsd+6SLq?=
 =?us-ascii?Q?y7wxH0E3gVYNG98YfErwTf4mBv/WJ3xjlUNZLJESJXkGPZuMbKfzKsQ/gRDp?=
 =?us-ascii?Q?/BTDM9EIBYz1LmoI4g22FBE1TXYY87Bn8TyUK/6wWd6sUXJS98CVPwztirXF?=
 =?us-ascii?Q?25oX7/6/Y1CKP/8tuvCQ8lKWsw8Sjw6hEP7hPzL0Biaf/OX0U6yGnHOfrkOr?=
 =?us-ascii?Q?Y3dlTNgCphTxrAe/2+p/rFAnK1BFPUQpc38/vxmqB5AQUD37WWdmUhsdB6Yo?=
 =?us-ascii?Q?fIgqdwgvMJ1IQA8uupv6WlBzx6tW87RbP5OOQ4b2prCxKMR3vu48uo+ZJhl6?=
 =?us-ascii?Q?cMFuAn3w3QJfG3duFoM7BHH+2jpjZaksk5nl6b+StMnb1yzWAj5fJEK4Vpfu?=
 =?us-ascii?Q?YiYgnPHa/jY9bUTfMWM7BQUsAEo/+IXS4MHUCrqnfoVubNfstsJg7dDhQ3Wu?=
 =?us-ascii?Q?aufVuxpn4Voy8fDIct7jXUXgZP5049ccJYxOccQjnnV4o8YqcjPsRQawKrrP?=
 =?us-ascii?Q?edvEONrXsa0gfUHA3OxAIHikF019aJxKnIyEu3XS9OUJumiVhstf3X66WQMX?=
 =?us-ascii?Q?AnP6rgVoDjaSPCgqICuH9+R7G+OmjNbQY5ycGpxwn3/EEQYpAGszBE/ZY07C?=
 =?us-ascii?Q?Bo9bbcN+fs2Iblj/i6z3k0tutMLlaV3ys/lVWBm7AX7Oy/8g3NBsSLgBxTRB?=
 =?us-ascii?Q?pWOFBiYn84p6hd/sjlUu7/NqsWzYXANrFtlXS25TULnKJAbNnjnPC0hWzD1u?=
 =?us-ascii?Q?rTPEWwRU3+XS1TYSUmcI2kdt5eD56MU6C90IXJXiQ7J4E37h/axfqlXOcfXM?=
 =?us-ascii?Q?tNfT7YzzCtHGIm03VEMRRWHQ31rNcxvK87yFoa+Nf2Fb+CMwwn+77Z6qfKOq?=
 =?us-ascii?Q?Um9LFQWn9EVGSScEY0TlXep+eet+MNuh0jf6EOnbk30+wGO9G7hGWktLZCVV?=
 =?us-ascii?Q?OGj1VIe214OPRiL53MR2gaKCyd1jmeEKkq0J3Npcoqd9+CbKYfH1MaYcfvDf?=
 =?us-ascii?Q?pUaA0aIbK9Fi4YPnmNrmuzGH2d/BUzEj9aBQUSyhLFZu9PxYIt5CrzCNgLdW?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fe23f3-7ba1-4586-fa82-08dc26e4d711
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 07:25:48.4187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLP6S+vpz92u7RXQTGmAWyhUSrl4y7VAsl55I7GMhTwkpFYRVNhmWWrqFYeo/17QAKJUjmoJi7y+52J0nA0ggzEmyEbbNIOB0fpZ3N7vBRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
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

On Tue, Feb 06, 2024 at 06:27:10AM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, February 6, 2024 12:01 AM
>> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Subject: Re: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
>> persistence queue property
>>
>> On Mon, Feb 05, 2024 at 05:56:46AM +0000, Dandamudi, Priyanka wrote:
>> >> -----Original Message-----
>> >> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> >> Sent: Monday, February 5, 2024 11:32 AM
>> >> To: igt-dev@lists.freedesktop.org
>> >> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Upadhyay,
>> >> Tejas <tejas.upadhyay@intel.com>
>> >> Subject: [i-g-t] tests/intel/xe_exec_queue_property: Remove
>> >> persistence queue property
>> >>
>> >> KMD has removed support setting persistence queue property here
>> >> https://patchwork.freedesktop.org/series/129311/, to have parity
>> >> remove test
>>
>> wrong link, should reference the patch by Thomas. Either
>> 20240130125220.5517-1-thomas.hellstrom@linux.intel.com or the new
>> version
>
>The link I shared is from Thomas only. By the way I am not able to open the link you shared. Please help me to understand what exactly is needed here. I see there is only one version of patch from Thomas here https://patchwork.freedesktop.org/series/129311/

my bad, I think I removed the  "," after resolving the 404 but ended up
removing more than I should. The link you shared works.

the one I mentioned is the email msgid and can be looked up either by
lore or patchwork:

https://lore.kernel.org/r/${msgid} -> https://lore.kernel.org/all/20240130125220.5517-1-thomas.hellstrom@linux.intel.com/
https://patchwork.freedesktop.org/patch/msgid/${msgid} -> https://patchwork.freedesktop.org/patch/msgid/20240130125220.5517-1-thomas.hellstrom@linux.intel.com


recently I also noticed there is a new/shorter one provided by kernel.org:
https://msgid.link/20240130125220.5517-1-thomas.hellstrom@linux.intel.com

but your patchwork link with the series number should be fine. Sorry for
the noise.

Lucas De Marchi

>
>Thanks,
>Tejas
>>
>> >> support as well
>> >>
>> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >> ---
>> >>  include/drm-uapi/xe_drm.h            | 9 ++++-----
>> >>  tests/intel/xe_exec_queue_property.c | 8 --------
>> >>  2 files changed, 4 insertions(+), 13 deletions(-)
>> >>
>> >> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> >> index
>> >> bacdca787..1917e4c50 100644
>> >> --- a/include/drm-uapi/xe_drm.h
>> >> +++ b/include/drm-uapi/xe_drm.h
>> >> @@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
>> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE
>> 	1
>> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
>> >> 	2
>> >> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
>> >> 	3
>> >I see from the KMD patch they are renaming.
>> >DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE to
>> >DRM_XE_EXEC_QUEUE_SET_PROPERTY_UNUSED_1
>> >Can you please check this?
>>
>> The file include/drm-uapi/xe_drm.h shouldn't really be modified by igt as it's
>> a pain to keep it in sync this way. Instead, it should be a straight copy from the
>> kernel source when it changes.... so whatever is in the v2 of the patch by
>> Thomas should be the one here. Or just leave the header alone and let it be
>> sync'ed next time it's needed.
>>
>> Lucas De Marchi
