Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5CC4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 18:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8501125A0;
	Mon,  5 Feb 2024 18:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbJlFPdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F01125A0
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 18:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707157844; x=1738693844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wPKnpOm3FE/kRg4ohsiceI3CTVwWnzyjOkcRuWHyM9g=;
 b=NbJlFPdctk1zncWDUNVXHoE5IUypmY7nEcx6o7Rl+acK+4MEvlGQBRIo
 NQ0EmW498bUffPNRiwGYDCD+8LHkARiGXPUvVYsRh7R4OwnvZvk/WQ3wa
 YRR8g+5J7VQnTkKhV3nyAyRhdK4zKd+e3PFs0Hi/2OSMEW0UjENlYSohH
 e7o0ZAS3aXIOzw7Wwsq8/EOz3k0hGZ9scMVTTT14uNKIicbIi5D/I8zOr
 xEmNvs+KamBqykf/qRC4rJt0AFSgiTMlXE2N6TSYg82RG7hwHyJFqvhYw
 uNwtPLeTI1t6DE7rzaB3+wmzgrokkTw85zrdn2e4JCEoaQJCkSqfSUBmg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="395002620"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="395002620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 10:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31874245"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 10:30:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 10:30:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 10:30:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 10:30:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwquteu4T7LSGJj4JBnYoO1XkqKUnsyJ8uIAjwhA3JQIblshmRrhN8o/knuQOEsL8tuiK6UyJiO1DC1MiW7RbY+/A/3BPJoxlIBvWsDhMfT4g8//IjGb7fokm4j1owYRUp8EP5Ixx6lp5FTP7WVa1tz7dimWC/1YXORiSU4QKVgyC0lH+Uu2j7njRab50HuKN5B8d/uUrjUn/17fQtTkFPNp7ftfWmVcITUiSpWmEuCKRnqTvTK+ZhTwNVSb6YuX4WNcWAuyjUFJ+LW4qhOMQbBtH20rdbhEtZBVS0/F2zCCSMVaobdn4iU5c+WINH9WQ9pzxw4T0cbYgfjnaC3N3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR0YLPI5rw0xxVIGBZX+UOsP6UoR//udxxdIxUet9gg=;
 b=fZaF2TmFogvN3iFAGuhkZlMFGh8BwMs3yF17djhiz22MQNH9/zqX/O7P0mxYgYU32HyZnR25fQeVES+TlSaXB6QP3EeHxthMYwRSrD2o3q0xtNHgbxM2H3dSt3hewaOgHnLuT7hbS8JXDL10Drz7aEl264pY1fsQVy60efnmsEklckUfQ8kzKYD+4p+/EcdZp+D6u9zGRq1sGde6RKevVZyir+bFQAE3jrJ5B7hqVcWLWcoVnIUK5QUBhaBf+j5AX6FnMfYaMwNxsT2gLgoyXB6Z0+kqGe0q/Pf2UmQESVYAgYuu9xhpm2+Wq1bCKmTDNghEWfg+kDNFk+YoBhKQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5434.namprd11.prod.outlook.com (2603:10b6:408:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 18:30:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 18:30:39 +0000
Date: Mon, 5 Feb 2024 12:30:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
 persistence queue property
Message-ID: <qq7osstwzjkbz6h34kwwyb7ma3wxgzeqp5qr3gac6torzl2a2q@2i64awq4ltd7>
References: <20240205060225.35672-1-tejas.upadhyay@intel.com>
 <SA1PR11MB8428E53B7F5248D735C845868D472@SA1PR11MB8428.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SA1PR11MB8428E53B7F5248D735C845868D472@SA1PR11MB8428.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5434:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c26f14-a98d-43f3-a8a5-08dc26788d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tmywC/ZADWhRhOUOMhLaGWI6/KTAufhuBcrrMJ1FthgAp5YHjD5Vac/lsg3GlE3ODQ9Mq4YR8RreuIxdToXx6bXRjxDujfud8iXJSYzW7OHr1UV0epEk+HohGcIp6AFupNzlv+YngFlzK90OVmUqqdT/6GiLkL66P8SxJBjtkO9XDwzOshvFvFgc9bHrHlYThO2Jp9dgs8J84VyH9WwrXy75zDMFDT2wn8S1tFvim3/9i51bAfjEP0m9M20xfKqTwVJ/LQb7l6HaMy8rY6G2ZmgoxRj0oWQAVdqFxIkeid8Mtmb/le1X6qXBu6iXYpWd70LBgcfQxzqsPXdjdGQxJQJTxinWpW58dXeeO+Y9zzGjqhpLipBo2NCflQOYtxEbZyAua8HXnoeosogad+9lRVK0SqQJ9jrs7vNF/2HVGlToCIbRqaC7c5RdkB6+5jvwRySdnIkqXGoV5X5w2xJQvwd4y5vvuPnZuDXd2PlEBsKHuBDm6diyBh3minVEkEk5y7FtdQGrk8PuSO8oMufHAr0nJnC8EHpXlBBw8AS18c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(33716001)(86362001)(8676002)(66946007)(66556008)(66476007)(6486002)(966005)(54906003)(53546011)(6506007)(9686003)(6512007)(6636002)(478600001)(8936002)(6862004)(4326008)(316002)(38100700002)(26005)(82960400001)(83380400001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2JoEf84N8kN/RkMImdx6K+GRkUNJ2DMSXlYL23HkId9VCpSEWCXA//2sXfaM?=
 =?us-ascii?Q?YyBNtyPYRk23UkNn7z1r02nyS6yfPka0MHj+POmJfF6aJ2X+xNMY24m9Tczc?=
 =?us-ascii?Q?O85u85kL2UvH3N9x4CUU7y8b2ETtLOTCXvfOOn3gHsX6/gS6gAfroSHOEkZW?=
 =?us-ascii?Q?2e+adXldc0yye6ZDG4vJnobwND7HEYUjSEEWJatvlhtrKUaKKuZ1gvov1bXS?=
 =?us-ascii?Q?8r9YACCvDjhwOrfJ0oZVyaZVroBX8aZmvq0H0OMyJ8/KC7B0fJP555QQT6By?=
 =?us-ascii?Q?gI5xGQOI8JraeIrUrmaMl3imE+41Cf+SrwroGe0K3JjrYSrZd728+i4Y4L/Z?=
 =?us-ascii?Q?hkIf1pviNPMbbuBKtX04xb2puMGpGwTPMdh2P/2VMRIKTiWz6eTCsWnNyybn?=
 =?us-ascii?Q?Zfs2ZGIT2EzhO14+4VMVX/tTgMa+E+d70KoIR+pKtcJ6MsEQ6neXo87cqp5n?=
 =?us-ascii?Q?qrVBSeR+f76IIxv7qkEql9tUctRiA5SVoXqNz4HAHQjnTN+lK06vtl03mAUU?=
 =?us-ascii?Q?GalKCNXncirGZ9EXP04j1Ya+1E08jaIDdDm72tws8TzZtnVvncII9hCsjmnO?=
 =?us-ascii?Q?3RqicqrKHmzMt3mNz6wS5O4QJt2U2Mprq2rlyibBO+JLVwqtI4Q4/x77+Bld?=
 =?us-ascii?Q?awfcXkQ6apGVXPKPHPbywrzmHEQ5c8rQOClOw+8mDbv4FQF2/uLnMIAdWbUj?=
 =?us-ascii?Q?EqLkD4vJZw6UV1DVgNDvG8pLVSulbi/Af3tXVTphXY2VPddNNN1RD0eGKPYi?=
 =?us-ascii?Q?uY38ZRiufuj5n9a2bbfXdBhtyZmEuevlXrVYdoIga24G9Tod9IfLnipatn75?=
 =?us-ascii?Q?ZTqAZCQz71MOGk0Jn/5SNHDSb9M9e89DoHOuwb4O3izfhNueXoDrkR1QVaZc?=
 =?us-ascii?Q?/RLZcxrpfTrwH5lDgKNOtusOcVNn8xjRCYWQmayvirtuoGBQub8jusK+wE8A?=
 =?us-ascii?Q?t+7N9eZ3C22neWSsFabVPqG99NVH0cjixrTGov1Lh6eHnLt95JY5A3/d93RE?=
 =?us-ascii?Q?si6vmInZ2z9tyjCWfpiFzD54PPIomOe31AkqFgcnZDI3oRflQYfp4FCSQxaa?=
 =?us-ascii?Q?DG5nOogtE+6+sg3wJj5Wiy3ozhVOxe5ApuLYhJqMgD73mLojrbuBcpflbJPQ?=
 =?us-ascii?Q?2D59KIgxinleS2Ys1AVFyNFZWKMPNexn6xVR2JllhDBbhCZDOZOwQkN+Xtey?=
 =?us-ascii?Q?TXIVY3WfGXsAFxXZwKhAly7FU57eq9yPuxFBE+uTpnH6RNa/TvNS2J3quU6O?=
 =?us-ascii?Q?12oU+Vb7GGrQNiFvJhGbVNTwbyDrlz41wMPSt5yTN7JgKkoEAhuqokQzmW/1?=
 =?us-ascii?Q?/jY1hsF+uv8dnxQ8WO47Slv3wvub5LejhcUVmIDdBUiAE8+mmlMZHQfyiKm7?=
 =?us-ascii?Q?F8+xLXslN3wUER8GFEMkF7M6zY64n3H/cpndKt1tl97fT45cjfPLHMeft5Gw?=
 =?us-ascii?Q?cVrsUDYyQ4DFUo/PlMHnaR0o39IzoXUtBYUGpP2lFrzQij+VhVdxs6qKmW4W?=
 =?us-ascii?Q?hdz65QTBPJ0+Lkv6GoiZtIs+UBJ8nl+fFCroE+hLC7rC3htrG+ImunYqN4LI?=
 =?us-ascii?Q?Fo0blMpmy93S0eHgqxQbS8wekBeVHsa8auaSAYP+Ph/0wzNaycM0rHcfHvVy?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c26f14-a98d-43f3-a8a5-08dc26788d54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 18:30:39.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HF9eyRGExHkMaga0JhdvU73eBddiLIA8P9NQMAuKoKTa8sTAtdv8rsqxINqEuFkztFuWSS5Z2+4hySF4rxTkZ7x2kK+ihiHMlo64P7P2TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5434
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

On Mon, Feb 05, 2024 at 05:56:46AM +0000, Dandamudi, Priyanka wrote:
>> -----Original Message-----
>> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Sent: Monday, February 5, 2024 11:32 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence
>> queue property
>>
>> KMD has removed support setting persistence queue property here
>> https://patchwork.freedesktop.org/series/129311/, to have parity remove test

wrong link, should reference the patch by Thomas. Either
20240130125220.5517-1-thomas.hellstrom@linux.intel.com or the new
version

>> support as well
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  include/drm-uapi/xe_drm.h            | 9 ++++-----
>>  tests/intel/xe_exec_queue_property.c | 8 --------
>>  2 files changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
>> bacdca787..1917e4c50 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
>> 	2
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
>> 	3
>I see from the KMD patch they are renaming.
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE to DRM_XE_EXEC_QUEUE_SET_PROPERTY_UNUSED_1
>Can you please check this?

The file include/drm-uapi/xe_drm.h shouldn't really be
modified by igt as it's a pain to keep it in sync this way. Instead, it
should be a straight copy from the kernel source when it changes.... so
whatever is in the v2 of the patch by Thomas should be the one here. Or
just leave the header alone and let it be sync'ed next time it's needed.

Lucas De Marchi
