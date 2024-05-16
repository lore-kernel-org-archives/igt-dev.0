Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12293C25B77
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 12:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDBD10ECA7;
	Thu, 16 May 2024 12:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uckj8pBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9B10ECA4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715861946; x=1747397946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W6ioY7aa0eT+WHlnKzgAeSZKBjo2ICJFDxM5Qb9iSYI=;
 b=Uckj8pBj467N3fYiRusJ2dJMH9S1zhTvPTnUDLlRY/IIoQpZ3Gymf/CT
 KopzOyulRYbIqpzZA6cXb6Kgm9fptjrYUlZro+0jqCxfzMwjkZslJUDWl
 UzDWDQdC5/UqP/OjNwUJzaQRlHYcDod5g/zUxK6jfWdw+sDynJ8NDom5p
 AI0yAB1HQYDo8b4vP4RJQANZKiNzo3hf9DovB0sqkPedCYuYhrRzzHK43
 GKNOVgV6R1VykIrC9RRKP4YUyp0vZh257e6LpCcyF/c+NqIfunLlwvo5z
 WEjE7if7fBXbzLQsBzb62eVm8S8XeC3ZtcnUfeqNkQUPW0bQQJ/mQ68Um w==;
X-CSE-ConnectionGUID: FN0UK69ySHuJy4YT0uAcog==
X-CSE-MsgGUID: QVCOhg/9TVGxx2Qs/jn7ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12177313"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12177313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 05:19:06 -0700
X-CSE-ConnectionGUID: YiqzGK9ATiCYF9j/7cgQRg==
X-CSE-MsgGUID: EXr5WfYOSayQnDm7kz4n0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62623680"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 05:19:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 05:19:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 05:19:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 05:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S77mC7QbCq33eY2J6Ua/eUh224ykQxY+HSOzRuI04DN8UG/y5Zh84/wOYx1zRDTHRItprasfW8u7frceh+hDDhqt4ryko8zke5yxpLmZYss0JEqUhWsIV/0Pa6jlbNYjJULD1rXs8t6e+HPTuhwGN3r1FI9QnvFpfDNDdXV/M5U0Qbi6ivwCe/TpJxsH/3CTnF3SFXGwAHIZe7MNAqVvBZ4MV/t3k8hRygKriyA6/7HxGbs+98QfMFCsDb9RtA/mDTVcbkeyw09eXHyCAqzpRr8J3U43f3aqFOssgGjAtfqItLZedoI1tQy25Cvg/l5gGccoj6EE3mIeXNAXJfVuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWv3boOdB/Li/9IqUQbjvtqIvGEpmUM/KfQXS2u+AZQ=;
 b=HPcYJVBnKPeBMO/m4qAeTadFtm5yrohhREqhWXVeP2oNp/ahpwjuJFjfLRX849b+Fq+k2amCRzvw2e6nI5mqx3YTQ4A9yZvSWWc84+Vuh7lMNeajnNK/O50lyQqp73NqAGcKLhD1FDUzLDO6UKUgxF8ixlkYEnrodMqQqjoc+led+rmzH2Mabe68354JjWWI9G0Jr7XWIri21mYEOEbnk+GyW8GgHeOuTfkDsd0y4PzPUNhoXzxCmxcNMZlWQXCEyZKnCdWTzZKNdFze69Jn8AAKzYgOyLuLgZijoz540xPkpOehjh+QyLkDhq9ijk9jJEMuKQrsDNWYZJttZPp7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 12:19:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 12:19:02 +0000
Date: Thu, 16 May 2024 08:18:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm test
Message-ID: <ZkX5pZhZ4-DKc9-K@intel.com>
References: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c72edd-823f-4e9e-bf51-08dc75a25f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/jELg0czLM4I+3tj86eTS3kIgKoYwWrdG7B5EHaIqAkZomznmRPcxoEnAxM7?=
 =?us-ascii?Q?CSsbASi9j5LaVX7KzsZgTriLLDJ0sSqGwSw5y1uqt/0UteP1YehvXsB/0P9/?=
 =?us-ascii?Q?/mP8v/kVst+Jmt11XhV/CASRpLCFIll4kRquMD8QjqL28brdcZ6Krc9RCZ/8?=
 =?us-ascii?Q?vusPkoABNkXEpzKZ5P8FFXG5UwfAOhuBXGK3jx2HjuE99chjMHmPPEbEaM/e?=
 =?us-ascii?Q?a7gyUjqEo6iD2x1XEusrZXLWdTGbbPwxizDV4EExFSk6J58kafeUBz9CvzkF?=
 =?us-ascii?Q?GjAyFPDamrFGjDEoku5n3YgoSJAz/8gI5PCv4zBQW5pFBACvgLLNpEIAD/sK?=
 =?us-ascii?Q?D/Duu9k1GMw13v4bGS0C+X3R13S6zDsL8iWe+ga6Tb/okFeZ2igsJJHtwwi0?=
 =?us-ascii?Q?P62VkKWZVTulcmNOvf1LV7JQV4RlKEAN2iyaQXv3frGRQ3WfruxHHflAO3qs?=
 =?us-ascii?Q?NIHiBaa8ArskWRCqpKFodkkXOFhL+aQ07mh1kn/YX31bOe9ueA2e3VhNLXjQ?=
 =?us-ascii?Q?5ow/mKOF7GigHQ2YM8mDqf3WUghtFyum0AMpCSpmeRHaEPaM5uXgWqI/qB9r?=
 =?us-ascii?Q?wxttIuMu/iAoQEdH88NMYoolLarcAlbxC1Q4ue0GJ3xcs0RO6PBtO63ZNNP6?=
 =?us-ascii?Q?FQoe0NO87/bRl0Twm+6AKYut2MHyoPpgYMqYvyUM2ZtoonTTg6qERCA0a1FI?=
 =?us-ascii?Q?CRjyrBlvTHxzuSciobbqmRLSx4Y3PIAfgPrUBd/P0ZHfyVDVk6wS82kYp2Jw?=
 =?us-ascii?Q?w0XeUJvb+tzlkWKoXUScGgnSD8KoRY09jjANxegmKZJ6KnMBfjqdGSSTX7Fb?=
 =?us-ascii?Q?arH7BK/8jXPB1qHpHyw9VQ+hxGek9AXpgyKxTfEWa/sbZ1woN8LVXTEewvIS?=
 =?us-ascii?Q?hwLyoSN5LrWPUW3pWEedt91roerd80+is1wEvz2LkTCNT8REoCt8j+FzJ1GE?=
 =?us-ascii?Q?XfEp7oHTA3YDrs/o5ym/XLppyWbNgwM52lHUnvhrxE8waSGzMMB0DsJOc/So?=
 =?us-ascii?Q?rzNfuIREXigAC6OhZNAjRUm0aQQnX9C9ujH4AJOzj/zPwjypdp++AyhHrx7i?=
 =?us-ascii?Q?X1VMJthE44l7VVg6nJ6O3oaa5PBpXH/j+Hiv8jdXsFshoDJYBLLt6CiOUoJX?=
 =?us-ascii?Q?GmoLFYBaVZnE3JEZZ+K50yimHxg5ygAWKwg4kgI/eTVO39Ou+RRSVEeI4m5r?=
 =?us-ascii?Q?z8lw4va/W8BuR+TDoSvlWX2NZihE1AP432x6FZRWcXwl9Nq6U5gjXZgBBZtF?=
 =?us-ascii?Q?J9hQDr31lhorikFafYcA45xAxPkY7TPDyjcjGcB47w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T++FH/xyexFkAaCx2GM9XDj4w8s3ebII9lwzFL07gLnnbAeA8JGTJ0AsO/95?=
 =?us-ascii?Q?bINMzAD2K1D8PlCdxb8jMQdWgNR92s1b/FvwECbAFxHPHDY2oFv+zloLkKfR?=
 =?us-ascii?Q?fZh8BFMc/2o9V9BSHRrWpy/whGMk9chKJbYkma4JgYhYBq8sasUhECsC2Zn6?=
 =?us-ascii?Q?P1GGZfLpLYPs5w0GrEtGTuI7yItdiNwCI2m1lGlb6lEEw7FhNSMk1oZKFFij?=
 =?us-ascii?Q?GXrZrmasAfYpWzOHRothUZCzCS3Iguu/PsdmN3Saa8ZBz02UNAQo2LKdBTXK?=
 =?us-ascii?Q?C1UEvQwawlI0/dPnkPGP+Yva701wywR3G3rL8wMOqTPIHshdGiE8Eo5jlSRU?=
 =?us-ascii?Q?OgIcM3Tm//eYYGKyIFEBeKWOrwGPAiffi1JJCfhLqwjLIvZd7KvZ4uLY6iqf?=
 =?us-ascii?Q?p8qJnAwTlOFDB5f+N/758GjKPT9F4XEbndxnAg+794N+ifCaqCT+W5goLElV?=
 =?us-ascii?Q?C8BImhxItjLYvCSI1aUPNqyCDSol46QPnbYwCN0mE3PcY4k83x1pM7N6ktsT?=
 =?us-ascii?Q?x8bJra+r4P1IOxvJZugPlhQ6Z5bXfa9Xw5z96Mpohw3gd0cIcYOi8k5hhMPj?=
 =?us-ascii?Q?fbIAsYNkbCW6UpFSIb1klN20Za8E5pyDL/zDi3Axy9RShwO27DKUG7lPRFDj?=
 =?us-ascii?Q?yqPbtji1seLw7PuhAX0R5puBWhB9Qlu+7+tLIkE6/swfGftVsgsxTBhU6ulW?=
 =?us-ascii?Q?ZMClK3O15cGGyu0YnbRxGuNPFqNKLhVNi1ehsV5b5iKxFfS1d6Pq79Pk/xYl?=
 =?us-ascii?Q?fNrEseu/gv73j8vkbzTrIk5DO3JKn9j4HjuVzGRViw/rMLZYsitAEqzEquqt?=
 =?us-ascii?Q?kub5hKTgdWesFVL82e7krE2p9ECUssZ4CCCn4qw6aPe5VdlnJgy+o7t6KIfl?=
 =?us-ascii?Q?/q2D4RaIQzXqfNEfQJuhUjUG4fsvZDOHvuM+84TwHIIK6WxCFzd0p/JnlNzo?=
 =?us-ascii?Q?gKx2BU5PL6FybQUXexcnh51bJhNYxNBQAMYObL3v3xvuvcypwp5N58qMYY4X?=
 =?us-ascii?Q?scRCsb+gYvTbvaMVi+tp+e5HDZFPH+HhBGODjzHYyXLs16atYNIPkfu7Y4FT?=
 =?us-ascii?Q?thB7VIS6jfqbK6WYdWTAF6Ero7+HspQgTk3z75juUimVYXTCE6r+7ELG8xmJ?=
 =?us-ascii?Q?bo5IC9oKoDJA/8cs1cpXm+62Hns70S9FJR3kc87b9D6bzhVK1vS9LlwRVXoC?=
 =?us-ascii?Q?YpS3suGfif0sz4pm6LSN8M4Ka+I0Nkkzd64cjCf6r4rciE35GA6uzOj7ooOH?=
 =?us-ascii?Q?Itawtlgd/7UHgJIszT2XKN1PQR4Dc8WFTobu3aFifTsqfT4MoAeP0u9E1HTQ?=
 =?us-ascii?Q?+SMTen02IlMdAQ8sFiBay9Zhzk8rC/5j4Ig8ODgF42Hmi+cAMxX0gM+pnHai?=
 =?us-ascii?Q?USrpDDJNIvYKj0aFtIQI66UuOZilUIqDkzHoo+rE2YZ2LbT63mQu41YOU5VN?=
 =?us-ascii?Q?VWsYjbpAj0o6orFB6FK/HUWeJxvXrepr9+8KwFt1BTNyqERQGRCA0VgVJwnY?=
 =?us-ascii?Q?LNT7V/GYeRbiwHm3yseAezelEcjteAThrmSandK8utaQ22mmemZw2K00HgwN?=
 =?us-ascii?Q?MV/w4+koegf8y5wLtQ+RKqLqvzbH74t9gKjGHNHzVBL7e4dsBfWx3P4QWMmD?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c72edd-823f-4e9e-bf51-08dc75a25f64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 12:19:02.8407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRahsrIiEIErGgNmw2aWHZWDLGS0OjidR+BydnS/ngfwknzKPnuqAgv0RzcfId/IAgIEXWHJx3ohBQQAyrBVJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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

On Thu, May 16, 2024 at 04:15:13PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> If display is enabled, the always-on components will always keeps
> runtime pm references, unless you put DPMS_OFF.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9cb00c7f1..b4a8c4d15 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -835,8 +835,11 @@ igt_main
>  			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>  		}
>  
> -		igt_subtest("mocs-rpm")
> +		igt_subtest("mocs-rpm") {
> +			dpms_on_off(device, DRM_MODE_DPMS_OFF);
>  			test_mocs_suspend_resume(device, NO_SUSPEND);
> +			dpms_on_off(device, DRM_MODE_DPMS_ON);
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.25.1
> 
