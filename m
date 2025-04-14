Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B01BC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 10:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC2310E58D;
	Mon, 14 Apr 2025 10:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETrbURbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B8C10E57A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628365; x=1776164365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kyas3ZEKGq+i47g0hAgHMFSb0abbbSRq868Hc1SYiBQ=;
 b=ETrbURbzEUhdJo6DAWCwsfSLA4wTn2mZk1R0nCjEyF34tC+UIx2USrOz
 ZtlRMKZ3bfNt9eKGCrljJGvi9we2TuNEgfHGITtkdpYH01J99BXjatqkt
 ctyyJLJpHJnbT5k8ZU5aa2E6XPt7wO4WfKpDgFjPxL7aGf1paNFxpe5l0
 sv7AM1NqrhIny++rCcorKATi1qcN/k7Q2LG5w9BlDxJy69pq0B0p7n8qh
 OyCS6Ta4uumNvtus6n/Waju/g4SIX4i9wV8qJSyJbOyQLY4C6Lwhzw/1A
 2t+26IwXRPqCd+IOUO6lAPR4KVCB5MEYolZ12AVMabkyU3eKJnxTdSQ6J A==;
X-CSE-ConnectionGUID: qqZafFOpT/2Zeja02O/riQ==
X-CSE-MsgGUID: 6jXFFQQIScK3fD2rn3BeBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45324642"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45324642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:59:25 -0700
X-CSE-ConnectionGUID: exMaF8urSumxn3U0IginJA==
X-CSE-MsgGUID: 6fSeolGWTViCcfxwn4p6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129753521"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:59:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 03:59:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 03:59:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 03:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7Q1bhvHR/mIr/2xw3TwUgrh3evc7ovT33OdwAyZW94BMK6JtNEn0HfAA1lIWKuiw8Fx3OgNli0wwPzTlledXZAF63hJk2U/Sn4TtIZnRyDX8BIDVndjZNycrJmtiWAtVRKxhPianOd+yJTPDsUBOS3lAnB1gHd3oje2UsVTQ3LTDAIbb0vbVCa/8842ZxqW2a8qaWtme0oW2LzQLJ/K+GNjCIc0bnz5iNSt//3wrU+o1D96z6EW5+ATRCE/S5M2to5bL8oMt+uH7lYqY9jH2yAHe3bGsTtJBcd4PGSr5UrVfa+upgT0g+msbXdfqsd8BMjdYRPQZ7CeEY8tArHMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOvqFW1OMZh663aXBUNNcy+o559IRCwaYBtkZXKv8oQ=;
 b=XNZVzh4vAt4er5/4YMSDFt3heShq/RowGa/OSc/6DLwj/CO4gzM8EMt70hWO2d7Kww1jqTJ++eELygdvAKo2Bd03aesCKbKdvAZd1gngcuuYo/iwYvcFGyLbL/H8fL7IaScKvzyje+dTPu0Sb9ReiSzDTBlG4dq+bnIgC9DAsPyP7KVxwEWGl5oI0R2sDDyxSoArEPQz96H/irbI4j6yObIKYXv3udL6wp3YHEbq/IrdEAfLVuyYOEia0ItVLyxD1Jpn2p2xnHXXZQuJBXz4pwCKEoJmSIbXV/XL508J3I77frhgUxPxgdg67gcSPSmFtD6sUriAZKLs/OiEiPIY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 10:59:09 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:59:09 +0000
Date: Mon, 14 Apr 2025 12:59:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/10] lib/igt_kmod: Simplify igt_kmod_unbind()
Message-ID: <Z_zqeatz3zfIXEIZ@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-3-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-3-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: a6eb8926-ff17-4d33-ef53-08dd7b4361ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NFAmAEaIyF8vwuV6zcf+owFNe6fL92zRYLT82F0d6INw8Gcbz1dJZ7Y58EWd?=
 =?us-ascii?Q?iRfUYHM9ouNqvRLs94KYCYb3D2L/5IjEI9LQx8u55NfIWWBh4AzbIe3NVxv5?=
 =?us-ascii?Q?I9r+WhPhvigpFYi6ko2huLjem5nuYnG0ymFD8OI84qjkq9JDkUNWw8kQWCtj?=
 =?us-ascii?Q?5Y7R7oTOoZk2hs3/WdMXpj3cwhtwDtmWLXestp3CXjh8wQZbrNTqEJFFo4/c?=
 =?us-ascii?Q?61IR2E+oJLAoaiTiXlb8h61HmKbyNEkO/Z4QXvFj6sHw/Me4w3DbBzZxQI6b?=
 =?us-ascii?Q?MA7+cEZGi9rrDuAB1LwW+kCFgRUxu+VaQ//L0KNMQ00wjAoNpuYGk0DHRB6e?=
 =?us-ascii?Q?3YJF7T+1MmwOud9vsUDJjB43jWUjr+Vwvyw2FMkaMzmIUyKR/riZ8hNmMBkE?=
 =?us-ascii?Q?WTqv7jofZ1dRCWdsEWy5B/SRvzyVlWpt8ByEOAbg50ZhVp0HtuMhUk/Ng07A?=
 =?us-ascii?Q?7DI63n6H0o1Z/A4Er6xGudva2kbwVE2uMXL8/RvBJHExC0rPIMyeZNd0G8hi?=
 =?us-ascii?Q?lijygD8gbrQZyAIZmPh8kGF1e9T6No1JfmUI0ux1uVDRq5FDcZPSQ7+beJzN?=
 =?us-ascii?Q?5ZhprrIyi7DBuc8Y5kQKs0+Q/bxX5o5fWXDeonD3Rv4Kb7mYnziWqECRNVbq?=
 =?us-ascii?Q?DggJnJq/haXZ4uaorr+AbT5a3xH6TXqsDgwRShGT9MLafQQ+eJpKQ28flPka?=
 =?us-ascii?Q?Ka931NYP8aovcMiAQBA04XBxrb6op5644YZihlY/saNJ6Wps2WrY373//70a?=
 =?us-ascii?Q?55FkKIyZ/lW+w1t2dxwF7qHrPpaM9bIFMGf0YmgXk935oD3kL2lWvVp33eob?=
 =?us-ascii?Q?LiGnQjymK2z5KFzkwLC+2zyPYQSfcHAIQtAnx9rHqnEt3KGMvPUnLyLnqq6o?=
 =?us-ascii?Q?iLVKFGRuzGcHXmuOqutvf5YTQYI5OAXojJpHiCL+wPfcLKxUiqstHlQGA+M0?=
 =?us-ascii?Q?XVTBHBvbKdx+Utb5qkFzc4XxWUNHICn/132vJveN7ttTQav/hY7qQWLaXKaH?=
 =?us-ascii?Q?ViwLdN9pgEG/VXMEzM4Fdx5JAOsdFDcHraUPDX8UmPZI61bYUxSmH8PyFylQ?=
 =?us-ascii?Q?UKaFYk4AKZftOjooiCtuXpjcRG+uarCekKUJKUxMPEz/tP+plBt0xcHqROEW?=
 =?us-ascii?Q?mEaIxK90lS+9uLgm5+yEn6YzQc6ra+7ibv+soidx2n7ZSz7VIeZkHmTEyM19?=
 =?us-ascii?Q?UCEUlKUELa+8JSVvMutRn0twBR98LYHA96aLxEA5ijHUma3+AqEJuV6OM7KT?=
 =?us-ascii?Q?T2ipXP2mvsuKF0jzBL7Kd8Kdz/cfmpR7gDoayu8Ja+4Hx4I5KfExW45LtdQL?=
 =?us-ascii?Q?T5AuCUgYSfF4TF1eDfrfO7N/J2ODkqUMZzrN5upQY57AEaVT7bJIaBB5Cupa?=
 =?us-ascii?Q?KLN2VkQFqXpeQ7SyeL4yKGVPv9LUv96dnM/MtXZ2sQPU8euWMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIBfk+fuwgKHyQ1UGmpSSNtVuTnlGH1OJFnnT9ktrh5vXBJgsc1zr7xM9LLX?=
 =?us-ascii?Q?p6C+nvVptYqo4hgavgNM5eEZuPdo0r3c2tlYpoS561jwnCyFPq0ATgTWkXew?=
 =?us-ascii?Q?S+VjihGaUReekc5gxqtDNJYkxRL4m21ot0zhd0WCaN2JoJLMlGJq1R5QVdEi?=
 =?us-ascii?Q?jYcqfUea4lX6rH+tv3zddQcRW4b1kJUrkVc0wT8pdQpHIX6MOyuJ0T4K/GAf?=
 =?us-ascii?Q?1MNP/R2d3o8JJReNFz18pASMEDqpUUwejhvmT9VLQgq++u3VyRTKZ4jnSGfX?=
 =?us-ascii?Q?9HwfbJN/ZEaeoHcZrdXGVucf6brUpVLDfKNhmx9RG95PghFSEtdHl/5OqHzY?=
 =?us-ascii?Q?GwZRz6X3ezMGBLR4pOZatBYxFtNpfPiK494JAm3FHDS+8B7Z80QoA6DM+OMk?=
 =?us-ascii?Q?bu8U+UbgexuMmip95OBQaXB8Ne3cn2DkrSDp9eO8OTCdE78SwpRfTP3CbmTe?=
 =?us-ascii?Q?+Zm6mub/SI61a8vMSO+Mb+MxZU6zfTQVC0m2RbaaY/gGPSCSRETWvwlSALYq?=
 =?us-ascii?Q?A0CqP4HI4QxpnejgR+wriPOBmx0f7p0qhSOZus1Se7VmfTq/jwX1V4yhIGny?=
 =?us-ascii?Q?nV0XY/sVT8C1C3XqF8bBv0v/fjsedWmqgBk2A4TCqixZ2lPsaVCnH25jmxKG?=
 =?us-ascii?Q?L/jjwBZ6caCFEpGzPmI0aBbfpNt4RBHb5oBnh4gAbfdJdYvcGG6OL2qvXXm9?=
 =?us-ascii?Q?J1DXmHIWw8qtYfzWk+S6tnEkkaR3bmFDr8cw79JvzsULnFPb9caViOhSP0l1?=
 =?us-ascii?Q?J47jVvwCgGHm6iQZrgacsBP/Ihb/tQvFHlJr3dQ3zvsD2bITcbDexbKutd38?=
 =?us-ascii?Q?7RSTpIfUpRwt+QWhA8jSFZEKk+M0KQQH6sv8lmlj6qT8OCUQevUc9d9o/FOT?=
 =?us-ascii?Q?6sy/+YB3hzIvAT2RxZO1HsZEnvE997xn6TK94XihWtfKrJYRHxsW7tcUHixs?=
 =?us-ascii?Q?/1nlPvhz8E4Scs4ACVXaESRSBBJBsRgss2uTc2cvEILqOAJv/FEdJwIjdarF?=
 =?us-ascii?Q?L8k2UOKIHlWaMvrwt5+121Oso8cyEhFD/tdrfTe8vH9q82uyZzeOjswP6P0E?=
 =?us-ascii?Q?IgB1tARqIPgVE5Lt7w2vkG/dNiOFDQl9s08RZVq1l+7atBHGEdLq8iOemg9O?=
 =?us-ascii?Q?7iQuYC37y6tgeg5XNP1krQ4BK4HyvYWHkuiUsUG5i0euqNM/DLh0iynvKBfI?=
 =?us-ascii?Q?c1rz1/eGD5f4GGB6JfFOPDmeCngF7j5eOTAZ/QU3KHKQrN8CKEe8M7/qqudu?=
 =?us-ascii?Q?7spYrwXyZ6Him38uMPtQeGJB9vVp6Vv/EzaiJFUBetTU4YZG9aEqHMA954FU?=
 =?us-ascii?Q?C9xal8XiNeAcsmtebQL9vlJY03TN4kBlF33YeNSbWMvCpqmEBaNC5sjee/aQ?=
 =?us-ascii?Q?BfV6xkJIDoB36ZtmSa4Pg+quUfa7H8DWc7xt6xw8JcFHD/RWYdxjxdCrfMZr?=
 =?us-ascii?Q?lQi3LxCtbJxqHa6PWx4uQFwCpa4vsqTFV/upAt/hZ44mlTVoLtH8WGR9pbxZ?=
 =?us-ascii?Q?nH9FoShZ69ygFWdt67iUrV6AwU/PEsIPm51YgZqYM5h/xAALdDTxWro1Jau5?=
 =?us-ascii?Q?yTdKBgwG1s6UdzokpgtNXwkDrm4dMZT+LK4aEH3mq9dOzQOOh8ANCCrihSi6?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6eb8926-ff17-4d33-ef53-08dd7b4361ca
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:59:09.1463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEGwOZn3KXO+gOmPvL6stLUARhFkE/cIuNm9m6UhxP0bmO5PB2/p3KdK0SMGNA+7WRmJ/nYKl8GsPzbzZjkNmRVYMYfsgYl+1MnDMS5BXKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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

On Thu, Apr 10, 2025 at 03:48:32PM -0700, Lucas De Marchi wrote:
> There's no need to open the symlink and go to the driver/ dir. That will
> only brings us back to the same directory we are on.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_kmod.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index ecc74e0fe..a1e39a429 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -672,7 +672,6 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  		return 0;
>  
>  	while ((de = readdir(dir))) {
> -		int devfd;
>  		bool ret;
>  
>  		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
> @@ -681,13 +680,8 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  		if (pci_device && strcmp(pci_device, de->d_name) != 0)
>  			continue;
>  
> -		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
> -		igt_assert(devfd >= 0);
> -
> -		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
> +		ret = igt_sysfs_set(dirfd(dir), "unbind", de->d_name);
>  		igt_assert(ret);
> -
> -		close(devfd);
>  	}
>  
>  	closedir(dir);
> 
> -- 
> 2.49.0
> 
