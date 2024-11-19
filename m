Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5FDD60D06
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4410E596;
	Tue, 19 Nov 2024 01:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3lFbv66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33AF10E596
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979418; x=1763515418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gQpQZmlL+Ss4IkqqOe8KLTiXLtXPxpQ19eI3fRpW+KA=;
 b=d3lFbv66K0ZPZSvPBbDzHJejLakpsTJQ6uRZCsdPvVa/xFF0zIMUTvZE
 o5IVQp9M8lX2VGMvLbHWDKaGV3jOeAxRQ8r+sylR7UhMED/chAhwIt+3v
 +OWHQEw4IYDZhok9nPUkbZKKAtV5TRcPARdO1mlrcKgJxjccQiLfYtbov
 Tec+xpnXECHH/HHYITYnhdRpYjZcJXgfzyUix6rg2PKwUyk7it8lfJUXq
 aCcBu1YzW4tcy7oMtyt8TAWudplgMLDLiqtK8T6TbDPY3shWOhaqXI1g+
 N+vGodM/oSFOiwon7vYgu0jWsKKnbKZxOtSB0oT7tCcueI96BuvkRciAg A==;
X-CSE-ConnectionGUID: fwCqOaFaTIO217pGhJJZNg==
X-CSE-MsgGUID: G96jOCJiQpqVNxz4bbJBVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35632723"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35632723"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:23:37 -0800
X-CSE-ConnectionGUID: dDfy/1VaTX6hEpS63Ih3aA==
X-CSE-MsgGUID: iUG1FF2HTJyQPm2DD2DGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="88961686"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:23:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:23:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:23:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:23:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no9271xGo0jPaIfMA4NaImfvGR4zjG08ZSXneN07E7RDsWC3dO0a7vbh33JroF2Wleuah9EPvadm9IQ7DvLmeM5hIIgWvkFU7DTBokMFlKrziJvCpwsP2nPMpBcHnK/P6Xy2r8MhQcbUPQJ2YAf/AWYho0KzWAMGap1OUARL5jltatYVWz/qBZGMBhx6NHDC+6QCDvxElTdfXxEty1fQBtw/XVJUWP7Z74Luzcd93SLODKI/S/UzgbnJcBAvtgi8+yv/IdOiOx94Us9hpdOWrZuixJ9Y+zMJZpRkdKDgp4Ii4J8NskhMwD35umz9sgogKJtHcw4y0xNxeoXWZuBiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lk7OMZTGZo1ZNWWc7OgJagSk/azHQJ3A3Jz5Qfcybs=;
 b=SsevGvWuMtzelbLHUXnAe6b3ncINPhRXq9Nl2vLL1K7uVzN6VYuZycu8p3FGOzySnrUvp1TSP5scrJRQ+J+SinISajUmdNE8nuk8NVrljKXZwtDDSVeOSimcwFAgk/1PutlC6Cw7DfVXGqtRwhbKwiVxHeXD983krs4tUVpO3bdBaVrCe3hbYpByAJ8oU8P99ie0z+3m8Cnpmlo2LfDuCcVzlPkgy/bsFNM+7Tx7v6F8bU/uVlWYrJt13zXSCjRIoJVoNbto5M7pxOY7aN/q2mhZ3kff/X7mTMQQtKpU/7YQA3IbiEIGCwXiwlbs0BpbzDvibSBk0jR3mYF3sN+WUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 19 Nov
 2024 01:23:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:23:30 +0000
Date: Mon, 18 Nov 2024 17:23:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/9] tests/core_hotunplug: Stop unloading audio
Message-ID: <20241119012328.GY4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 192939cb-4092-4a0e-1eb9-08dd0838c6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uMUy+bp+wqzPQd0VPezff13JDUfB0G8yQzYGaD8MUAPd1eQDBQ6BM3P6xLt4?=
 =?us-ascii?Q?qL/iKW5WbFJ3XcvwN6X2yIwzuzjkR+dHUgPxy6kPOw43Hir8w9la3hns50nn?=
 =?us-ascii?Q?xcluNJErxUuO13uTRqDNuD+Ku+ugXGtIzqtk9+RQuqqFtuNLfIKgwzV2Mqtc?=
 =?us-ascii?Q?myC0tVCS0GNswDG3FZkXh8EgPdAbmOVre88d4HTukBPPoQVYy1VxYBjhRWPh?=
 =?us-ascii?Q?TpYbRWWth/E2PXbBXc8T/lEvPV5Nj3zmYYdOs2WvoIlupNN27Nx87Uc8QirR?=
 =?us-ascii?Q?43GqLzaoFVEi3wkLTj89BWpMFpdCfpL1VX7ViwPuq6KvBL7iiprHFxQ3IGo4?=
 =?us-ascii?Q?kquC3AToegSpjGWbC70AdSEPK6ook/K8u9nR6tldcqMhwfwX6GF4buAcUhhx?=
 =?us-ascii?Q?vJrDG9NcRau9I4HGzVkd6i5lGCMpSQQDWiwE2oPpqVtVU2pXf6ANVLnNBm7W?=
 =?us-ascii?Q?guYjS6mrLOtxkdg+JX8MVF3m0+2uke46CgM4kZWyaRAWRtAgfSgd0bFTCKnv?=
 =?us-ascii?Q?m9YCBq5ekIABDwS+qtc1olQDsE4nIRiDSu9Kd0t+gRcK7c/ShnMG4gB3Zz4+?=
 =?us-ascii?Q?zYn/xcqKDmwqc3S3YZzPB+/ImfDRcNCm2JNDyYH3kC/tqu/qDGAYVrX3ZstO?=
 =?us-ascii?Q?Ix6AX5fsMkAuJHWMhxK2Vz8VNFHNEO4pxp5rHEX9oVolh/tzfdsHI2K2PG77?=
 =?us-ascii?Q?ylxLRYXESEpT7E9Joi6xLWzc/YB+COrIdrf4JWktYMhWzcCFaK5AYIW3wnbr?=
 =?us-ascii?Q?DrkYrzv/up3zX3BhveXFQnCHYUEzjY2eqhtmqN6rlujIUgChmI46e63tDQDz?=
 =?us-ascii?Q?FFNLqUH0LG4q/xSrlLyWIhx6YvhAyRXBWzSWPAxYV26Jp+Dz4kx50YAXxJ8o?=
 =?us-ascii?Q?EJ6wIbOcsqe95ogZDoAxDYl9VrA8sD+w3y+cFH5b8zQg1pH0dwwOVuP9RiV9?=
 =?us-ascii?Q?9Zi3w36zy6gyf6Y0lTgTUMIjuM2GujtahA2UfmC9yxqyXjxNhvSg4KRU5yOA?=
 =?us-ascii?Q?tGwNyDG3KMZjcQyWzNRnVodwn5X23IBSdNlxc70NyIdmN22ZJtbA0BKyOh0a?=
 =?us-ascii?Q?MBGmHZKzYTy1tvDb69mu4y2VJjl2qN13k2aeMWOVuoH4YZ1sxwo9uG6mQke1?=
 =?us-ascii?Q?LDnUxdbuO/lHLB5fMbn9stlj7kbgoQy95yzld+h9bq16elLOVi/NwXYE4E1H?=
 =?us-ascii?Q?ptHCvK4Lc0pbd3qliT0WyFS/TTpl4LrGXRLCrcuGzdisQSWJHbq7P0G4hG/O?=
 =?us-ascii?Q?S/b9QEDdi7nDgZw/QBuQry1f+3Rb/58J/UXfZuw5ZmNunqBUbk4MY64UpWMZ?=
 =?us-ascii?Q?LnA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i0B/RWVcK0P+rrUtqEV1lo7qDK6CFLXKwLg0Oue5ZJhOp/iQkRrnfslgzMDI?=
 =?us-ascii?Q?YZjy7POffPOB39hubypLNYSdOUmBdD6Kh4fmyTMMzbKZCIHFf9vFSX/m6vUY?=
 =?us-ascii?Q?QcwboEpR/EXL9og6+ctTHDiLusbZO0KjBn11E0HyArHVeomsKdL0/uPIvQl6?=
 =?us-ascii?Q?j71+IfAzBqyFDLKTQ3kAjWe6RaZOph95cXD8We2aX/990+WJVc/YU/cnG/v/?=
 =?us-ascii?Q?xGNrLLDBzrpguO7zII++pgrBOwHXCw8xZcGi4NhGa5Zj4DbrYTvI0U7LccqA?=
 =?us-ascii?Q?kiEZO3wMhJH8+aIfx+OEMSvl7hD3Yi0CkjSHZdXkZ3G4Z1oiYyW+TmqIX4KG?=
 =?us-ascii?Q?3sQ3rdDoUYISfeP7f6V3IVIUPpveowul/Sxpxi2zkbc1qr0RgUyE2EgA750N?=
 =?us-ascii?Q?+HXazslUZmsUOL6gv2UoLqB2mp/gvgty2UOgIItB0GZMTZrClEqlJuVZI1G1?=
 =?us-ascii?Q?GvtBk0LH117+TwROd8t6XeFpzhJZQ0XafHNO+97IxZYU82mZmx1auuQ+oG5g?=
 =?us-ascii?Q?ky7ITc5N1rs53okFfukiRx6r+V0KJLhbPTlWlNADJcB6l+VhUEkkwgLQ2Kaj?=
 =?us-ascii?Q?BQDlCXvEXcVrEP3Nk4qRGZ9P2I9ClpUlQdXWT+6b949p3kDiD6zvklh1FFjM?=
 =?us-ascii?Q?c7uVUzKalYkfOMnMXalcYZ4t2bOv8xlEJYKDlvhcRhFYl0LqZW7eX2lKHPp9?=
 =?us-ascii?Q?vwaoXhis7uvTjfxulTMuz5DI/xql1nKxeYzBB7K5qC+/LXJL/NHH2i/QJbnU?=
 =?us-ascii?Q?DZwIm7EkhVv9vj2tHnnWTRcKeZFhNV6a3ofbxze2ucb7sYiGc7llRWr7OObH?=
 =?us-ascii?Q?zOmk3Iu3/ZlYep8lt8hOeetbeiVOyDZRRvJc+6W8AgvBWpvbqJCan+98PiRL?=
 =?us-ascii?Q?jWYmxX+5hAvV26a9gnAOinLtNdAWQ5mp1oQhtlntj3lo4uTnpUojjEoh8wYo?=
 =?us-ascii?Q?9305qi046ajOsFYLbYFBrr8qj+Xf23ugfhUhmePorKEcd5+PHlbXIwf7oviJ?=
 =?us-ascii?Q?IvkZpGp3jPYeqfHqewLZUehZ26evuQf5L3oYvgCARoGqGAaMLSVutDMrMq+5?=
 =?us-ascii?Q?ypSgd6/O3OETzQCHuVJ7s8P827LlSCVmOOZAG5vHAUKNd19WecGT2t9nCWY+?=
 =?us-ascii?Q?Z4vLem5wnzwydMV485Hul2u1WeDE++Qny+1Njdtdfs7iBqw4Bnv4KtvQnSte?=
 =?us-ascii?Q?td1WCaGdI/1yPsdFsCtpLC/TRXKfaTwQMnAyySGV8Qhe27fxW73O7MqOUnKN?=
 =?us-ascii?Q?L8mHTI0ozVGEIZCS+vMnn3XesqwO8wZt0qEbXi33WcQxwRDTvsR1+uU484qN?=
 =?us-ascii?Q?MKZScLv0sRYe24TkFONL41qimrkbAs+82oGyEi0oE5y2BD1DeHghG8XXDjYh?=
 =?us-ascii?Q?d+ZxFs6FC6dmXj4KBsMuyoaIow9uu1SaKm8xSk7QvRZakQ03bPwhwCAsSHrq?=
 =?us-ascii?Q?Y75iOa8Ve0utecfIWY7i6jzCI20T5PLsR/lvP1sP/Pv2PWFe+SBXqaV2aoAz?=
 =?us-ascii?Q?qE/iBZdWwPkV8p2wCIvdizKpDc4DWRfL7rmr0/aZ5s7xyLCOktrWnn5Iz7eS?=
 =?us-ascii?Q?ndLcWDyzaW0P5UKg1Ukmk1cCPJ2hjfwcJBSTmUrJKNk3McmHCJ7SvIdefQZ/?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 192939cb-4092-4a0e-1eb9-08dd0838c6e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:23:30.5814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT3v0DpJ1a62P+BNtFWXVqls5Cu1XwupNPJWXahIOtjEbDsPgubOn9exMNct21mpap+ka59adioAbtIF3TGa5KMuWSa8pA+AZxsRiW4JUsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Mon, Nov 04, 2024 at 10:18:41PM -0800, Lucas De Marchi wrote:
> Not needed anymore and test should succeed when unbinding the device
> from the driver. On a DG2 system which has pipewire running,
> igt@core_hotunplug@unbind-rebind passes without this patch, but takes
> ~26sec and a dmesg full of warnings related to audio. After this patch
> it took 4.7sec and apparently 1 unrelated warning about
> "Unclaimed read from register 0xc4000" when rebinding.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/core_hotunplug.c | 46 ------------------------------------------
>  1 file changed, 46 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7f17f4423..07a8dea37 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -96,7 +96,6 @@ struct hotunplug {
>  	const char *failure;
>  	bool need_healthcheck;
>  	bool has_intel_perf;
> - 	char *snd_driver;
>  	int chipset;
>  };
>  
> @@ -187,21 +186,6 @@ static void prepare(struct hotunplug *priv)
>  static void driver_unbind(struct hotunplug *priv, const char *prefix,
>  			  int timeout)
>  {
> -	/*
> -	 * FIXME: on some devices, the audio driver (snd_hda_intel)
> -	 * binds into the i915 driver. On such hardware, kernel warnings
> -	 * and errors may happen if i915 is unbind/removed before removing
> -	 * first the audio driver.
> -	 * So, add a logic that unloads the audio driver before trying to
> -	 * unbind i915 driver, reloading it when binding again.
> -	 */
> -	if (igt_audio_driver_unload(&priv->snd_driver)) {
> -		igt_skip("Audio driver %s in use, skipping test\n",
> -			 priv->snd_driver);
> -	} else if (priv->snd_driver) {
> -		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
> -	}
> -
>  	local_debug("%sunbinding the driver from the device\n", prefix);
>  	priv->failure = "Driver unbind failure!";
>  
> @@ -230,13 +214,6 @@ static void driver_bind(struct hotunplug *priv, int timeout)
>  	igt_fail_on_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr,
>  				F_OK, 0),
>  		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
> -
> -	if (priv->snd_driver) {
> -		igt_info("Realoading %s\n", priv->snd_driver);
> -		igt_kmod_load(priv->snd_driver, NULL);
> -		free(priv->snd_driver);
> -		priv->snd_driver = NULL;
> -	}
>  }
>  
>  /* Remove (virtually unplug) the device from its bus */
> @@ -245,21 +222,6 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>  {
>  	igt_require(priv->fd.sysfs_dev == -1);
>  
> -	/*
> -	 * FIXME: on some devices, the audio driver (snd_hda_intel)
> -	 * binds into the i915 driver. On such hardware, kernel warnings
> -	 * and errors may happen if i915 is unbind/removed before removing
> -	 * first the audio driver.
> -	 * So, add a logic that unloads the audio driver before trying to
> -	 * unbind i915 driver, reloading it when binding again.
> -	 */
> -	if (igt_audio_driver_unload(&priv->snd_driver)) {
> -		igt_skip("Audio driver %s in use, skipping test\n",
> -			 priv->snd_driver);
> -	} else if (priv->snd_driver) {
> -		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
> -	}
> -
>  	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
>  				    O_DIRECTORY);
>  	igt_assert_fd(priv->fd.sysfs_dev);
> @@ -293,13 +255,6 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
>  	igt_fail_on_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr,
>  				F_OK, 0),
>  		      "Fakely unplugged device not rediscovered (%s)!\n", priv->dev_bus_addr);
> -
> -	if (priv->snd_driver) {
> -		igt_info("Realoading %s\n", priv->snd_driver);
> -		igt_kmod_load(priv->snd_driver, NULL);
> -		free(priv->snd_driver);
> -		priv->snd_driver = NULL;
> -	}
>  }
>  
>  static void cleanup(struct hotunplug *priv)
> @@ -679,7 +634,6 @@ igt_main
>  		.failure	= NULL,
>  		.need_healthcheck = true,
>  		.has_intel_perf = false,
> -		.snd_driver	= NULL,
>  		.chipset	= DRIVER_ANY,
>  	};
>  
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
