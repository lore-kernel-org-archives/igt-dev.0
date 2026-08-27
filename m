Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9F0C61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 20:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0F910F195;
	Thu, 27 Aug 2026 20:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRaTlyLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B8D10E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787862173; x=1819398173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fN2nOsVmkol1ZlQx79inAGEXdaDGI8bmqALMI/YTQyw=;
 b=IRaTlyLiGgvK8xG/IlcEYdzE0QHb8cHMcYuWir19dvVoBmdjr6DpKiDV
 GknwEDvkF4YXAvsgKQDwiAtVY8H2X1RlM0Kus+iljb9tnsGHUgDQhbg3a
 nwM6Y+uSkRbQorFQAUz5MtKn1dcBuF8nC9SohbAwWfMoUiAGUGl2nyj5L
 yjnCoBbaCyY4gaGxtOW7jivsCxMGWXgNWhWJ16k3ADZ+KLapmyOztIMSS
 iQyjA3iaIoEALrXTU97OQz/9R+qmcvpgfbxg7eq46fCXrZ+Qdjr+r6cy8
 dygK9+VlXCedebuQfkeKJ9gFiYLQSegkF4vFIK2OumpqENqkIFxtxb8uZ w==;
X-CSE-ConnectionGUID: kpLVOS10S52SnglD/IvyVw==
X-CSE-MsgGUID: 24FXHt14RFSYE5Xp3oy6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105894003"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="105894003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:22:53 -0700
X-CSE-ConnectionGUID: lul8inULS0auIk71m1qSrg==
X-CSE-MsgGUID: 84XaknXrTyShL7bMZpOftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="271504481"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:22:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:22:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 13:22:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6J/RV9lN23afVfxwudksanAthI3d8UWtXTCYmJxRDGJVx90gSXA4FjqO0Vv9UjZNcnAAbJ+7MbxwedoVO1SdWGBqlUtCGrWAwHD0z6/vKmuREQ7MYkIZv2fBWbCU4YJGIcDO+jJkh9xkxhN59beK7s/gFYe5QGADD3WJUvuMD1PVIOZrJSKGYbXNEJA4jww8klq48yflcKBWsgYVeMXRQyatXx52ocj57PuqLfdCPot0ri7Bnq9eDrD7Ap6fU83g1hIHR2ExA1TBDX/Dh6qbBjvPmZyQ4ky1G9o9GhPlmF8/wUIymeFW8FzVD5rQiBsHZMXuaDspxcdyuSXHVj78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8v92APd6XcveZZHtdvB1z74UYluu7nnjlC5DYQH54U=;
 b=u8XdRJ7y0euvO9YsCtj7T43QdEgpGAn4IYVO3Z3tqFe1sZiUyOVSah+KNa89QNRAbMT3gNuk3bJczBx0wMoClWhH7LZc7xJub1jpc3YN4tzxXviAaV7E9Z4iPMpzxzHNJ8al8LcTKiEbnfZIGjWGxD93xIHv1zrSecj5DnQC7LzzLXvqvA3f6+Oa4T0kyRn2/k5BdL9ZjrfhZrC4rcfLnEbz65Hs+15OJ5MQPBqEpL+oUR49nbfqCfoVPOHyh+5ag81ULCNISfUiOfQFlrx5w+OdOezZ0k2Cl3+zYLxl1EBuhUzZPfYoW0sZrIoU1J4PvKpH1AV8J7kZ4YmJV8z+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 20:22:49 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 20:22:49 +0000
Date: Thu, 27 Aug 2026 13:22:46 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM
 RAS Netlink Support
Message-ID: <apCclpWH9W_qgN-6@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MW4PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:303:8d::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CO1PR11MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cf44c9-4457-4f50-5d44-08df0478f6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3M1RPZ9bqIEIAqwXf/RN8KjC5WgtO0/6DvF1lpm+vR5LNGbMEClNNZ2lwPrzDpNojbdcBjNiIDT3Mn4HdQxW8tmbpiIKqJMfFhDtiqFTxpFoVnD63GNSkC9b9UFhVr3zTOz2EvCxZyDafFFxQ3T1d/DoqsKOeDswKEnpkqlsN1HZRRJQnzw8FW1YliSgJnkLnmo9g4eJIIdLVfHZ/t4p0eksI7F0GPd5K5WTSVU7gPS/oL9YxbOr+WL+WkE6U7wDWdg2OfI+HYR4f5aR7zRYwr7+1ZDOS7FewlFaY0xm1CaeNZ1hiTjmlulOv+U5owTng+Acox8Rql4z8Yvp54gQQN7sffElvsSxxxjwXWcSIvE4mELbHwjiimopGBqUGLgml9jvHR6z0WtJ9eOCPq709X29htVwGPnQUq/UG5s4J4JRcYnCykeoSYa2Vddfmq8NRbO8C6uqeqsZAdfrUmDY+8lGChgcnHAv+gVqzoJOVd8/qpRvFMf7H7JUHnCle6oURF10MojV956Xt4WvT28qsJ0cKLi+fiFE0LJtOXY8lPCz62VXsoRrLYOK/QtRcPN0aewVAFkgw1NU3UNST6vFq+TYvLjDhenozbHOJfXZRrca+0gyTcGOpxXI9/A5YqQQkZ5obEkRITGZIRXFBvhn7f82XJ21n1W3VRkmdz0NapE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNpRGt2Q0JpOS9icEpqVlpmTk5qd1BFcXpYNlVXZ0dwdTh2SHdHRHhjL2l6?=
 =?utf-8?B?NzNrQnErZWZIZ1RnNWtRNGJoWTFsTWRPVCtxZ2JwNWJUSmVwWFdoLy84K1NK?=
 =?utf-8?B?bE8yeUhWV09zSnFjQmNLdHdaeGYxa3pmdUE1Q0w5bWNHVWVhcm5VYXdNblZK?=
 =?utf-8?B?MTdMTnJFaGdTazRValhoVi9IM3VlWHFseXB0Qi9uMHVmQkk4WmFnbGRmN3RS?=
 =?utf-8?B?ajdMN0E0L2VxT21ZekZTdEtrVU9DMVFSR0FUQ09aRlQ1a2wrV3VqNEpEZHpB?=
 =?utf-8?B?ZFZsWFgwYTdOTXJNN0dDNUxGd3EyZ2c0dDYrL3RYQ241RGZJei9Dc2RWSEta?=
 =?utf-8?B?N2dGOHY1aXNHdFVEeDVZZTJQZXZtVCt2c0J4aHJmTVhjWUdsTnVEWHBJV2tX?=
 =?utf-8?B?aXIrYXVWOVpOWkhmRXdYWVlLVXlOdjQvaE04TjRzczg0d3JyelhDaFVENjJD?=
 =?utf-8?B?dkJMc1pYNHpvMGVQMEpMM3RxT0ZFcU5hWE5YTzFQVDFZK1gxR2V0Z0JNNmZj?=
 =?utf-8?B?QTRNN0ltMlpxU1M1SU1UeWhpN0Mwa2k1Wm9PWVRZL1ZmTk9FeHduZWZEeUJB?=
 =?utf-8?B?SjA5UjZBRzluQWhvaWdSOER0OGF1UkpOTE9UR3hpNldJbURmS1ZNbmVKUG5K?=
 =?utf-8?B?cEt2c0NKNGtCcDBiRm9CelF5dXpLSFdraWJUOFpQQWpOZ2FNb0owVUNyUEIz?=
 =?utf-8?B?b1NzRFVCOWRtU3hSQnZBdW15UWRwdy9naVo5ZFpEVWpZTnpzbVRNTUdacXZH?=
 =?utf-8?B?ZTFpUlEvMjFKV2Q4MjlmNGxON05lTS9NeHR4dXJkZHdmVFQ1dTFCUjg5aEU3?=
 =?utf-8?B?cWdYZWlMY3hjYzJhUm9rVGVkMUlRU2VIOXJTRlJESVd3cTRLLzBnSGNiajla?=
 =?utf-8?B?QktvWFBOWkFVQ2ZEbUtaY21WOGJqcElNQ2VtbStlT3o0aU5jWFJZbkgxU1pF?=
 =?utf-8?B?U0drM2t1RXRGRFpvOWFOVkU4RGJWaXJQdHUvd1RiaVo5SFFQRG5KTGJzMWVW?=
 =?utf-8?B?M3NtZEl3QVNoNTBjM0s2ZmJBdTJpNnVPZkZnQmtPWHRXMUlrcC9GeVovVUR4?=
 =?utf-8?B?TGptZS9iLzV4MWVmSk5qQXlOYjhDamtuTnJ6QmxzaTlrMWtOdWpuUklPMk15?=
 =?utf-8?B?N0Qxak1FN1JJaStBVXhIa0dsdFhYZDZKWXpmRHdWeExPbVNVOUJYRWNMSTV5?=
 =?utf-8?B?NitWcUJBL2lJb2FPbXBRV1RkTWs0MUlKQk5uRUNGNDJaS29zcHJZU1I5OEh6?=
 =?utf-8?B?azhkZ3kwUWlsR3czNzNyanNYMXJET1BvZ0JoYWhoU2c2THJRU0FNSzlQY1RJ?=
 =?utf-8?B?WUUxWE04R01OeVUzUGJ5ZU1oYjZIOE5Lc0VmNTdLLzArekdvNi9BSE9IUmpH?=
 =?utf-8?B?WTdsTHE5aDhtb0FCUGZHYUJzTmpUK0VRUVhnT0E2K3RyaS9JckpmZ3d6Ry9F?=
 =?utf-8?B?Z2hOK0cwMWJaSWMyWmhmK3pEWngyckxEYW82Vi9GQlNJNHAxM3FSaUNwZFpE?=
 =?utf-8?B?TDZGTVMvalIvUXFWM2MzSDNrZ3dnUDR3b01JZ01oT0JHNFJqMTdsT0ErMTFU?=
 =?utf-8?B?d3lKUi9WVmtTYzJpNS8xSGVpbjVveTQrZ0FoTVY1TkFBQVNTcEJIR08yOW5Z?=
 =?utf-8?B?QUZhNG9BVnJWRDczYWRNMW0zYTFsc2o0eEhCdDNjZURtS0ErUmRJcjkzcGVW?=
 =?utf-8?B?T3NOM1dVdTQ1c1dCYnFEZkxoNitRa1dhU1dyY05GTDVxa3NLNG0wTDdxWFND?=
 =?utf-8?B?ZEpWd0NjYUUreGJtbFBlb1IvNW8vMEkrMGc5NVgzQm1SOHFLR2J4UzdXQkpx?=
 =?utf-8?B?V3NDelBVZmFoeUxBRjZYRnNvQ2NLcGdLcEcwT00zb1AzcndxYVY0L242b0xt?=
 =?utf-8?B?ZUMzNkhPSmcvWlBTQjE1b3puUlptR3ZpNE14WTc5SUNRaGNSSFovS2Z5dHI5?=
 =?utf-8?B?cENHNVk2TjRMQVBBcXBZS1dKSk9OUTl0aUFUb3RBTzIvK2ZHM0pnWWI4RVNz?=
 =?utf-8?B?SHhTUmIvSFZoNFNoUUM3bWpxRU5ML2ZZSWtMUVRTT3plSHkxMnVndXJHejQ2?=
 =?utf-8?B?Vk9BYXRRWXNFYlAwQkdpcytiZHYvL2pHQTVEMmMrVGxOMGp6RnpjK3Z1c2h4?=
 =?utf-8?B?akFreHNMOGlBWStwdGRZU0E1R2E3cExVa2NwVkV4S2p0Zmd4VlpHNFkzWjZJ?=
 =?utf-8?B?M1RCbXFVejhGcVQ4YzlOUFJJbmoxR3FNZSt0d1RLdmIzMWh5dk1lL29kL01E?=
 =?utf-8?B?eEZVVGx2c25WazdrZHhWYkRUOS81YmRyaUhTK1Q4RXBwQ1Jqa2FjVHJzYkJF?=
 =?utf-8?B?U1BieHducmhabnBHb1pzZjdFWUQ1Yk5XcGMrdVBIekpsc2Uwd0dWTzU3aGli?=
 =?utf-8?Q?VGl1jhM2QB3U4RO8=3D?=
X-Exchange-RoutingPolicyChecked: I61w+eosbZDE1hz+jlSGvdcV1GXXDD+x0m8IET4Ok0kX58lNI2KqF703mtg7LWgxphxghm1dYjBOeUaEiPO78GO2MJeR+cs/hgtd8ZxepsiH9xY4NhEy5ZiqbTJdAevsLucp3GUHb6/o717HRoIrPDrsCFBJ6HhEp9jH1FoJKQyuw6xi4NdRsBuPBsMY6sOYCvdnVY6scpSRMlg+vNC1iI+SV8HqDWPcxNkiJIa+0SlUhwjwKtcXCq4I3cv6BwyRGYB218UupezegR0t6a4w85q6MpQxwxaaMqbbRmp+cGYqQQL/cXAht7kTFdwuhXbUFhgRsRMT5nM9ZdKPLSYZPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cf44c9-4457-4f50-5d44-08df0478f6da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:22:49.6508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+bvs5klbI1l5gi2rHmevlFucApdQQvORH00qResNh6E+LxUTPd6EXNZye5PxmhF1MI4k2G3gGGYk8x8HMW46R4zKuOyN/rASyPXhRg1pMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
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

On Mon, Aug 24, 2026 at 10:11:23PM +0530, Ravi Kishore Koppuravuri wrote:
Hi Ravi,

Are there any new changes in V3 or just a rebase?

Thanks
Harish.

> This series introduces comprehensive error injection testing capabilities
> for Intel Xe3P GPUs, leveraging the DRM RAS (Reliability, Availability,
> Serviceability) Generic Netlink interface for error reporting and event
> notification.
> 
> The patch series focuses on the below key areas:
> 
> 1. DRM RAS Netlink Library
> Establishes the foundation by introducing a reusable DRM RAS netlink library that
> provides kernel interface abstraction for error management:
> 
> - DRM RAS Generic Netlink interface initialization and socket management
> - Error counter querying for per-node error tracking
> - Error threshold configuration (get/set operations)
> - Event notification subscription via multicast groups
> 
> 2. Uncorrectable Error Verification
> Implements GT Uncorrectable Unicast Walker Command Parity Error Injection:
> 
> - MMIO-based error injection mechanism
> - AER (Advanced Error Reporting) recovery verification
> - Validates Xe driver error handling and recovery flows
> - Includes workload execution post-recovery for robustness testing
> 
> 3. Correctable Error Verification
> Adds support for L2 Bank Correctable Error Injection with threshold monitoring:
> 
> - Event notification framework for real-time error event monitoring
> - Single and multi-iteration correctable error injection tests
> - Error threshold validation (critical for detecting error saturation)
> 
> IGT Test Coverage includes:
> 
> - GT Uncorrectable Unicast Walker Command Parity Error
> - L2 Bank Correctable Error (single injection)
> - L2 Bank Correctable Error with threshold=1
> - L2 Bank Correctable Error (16x injections)
> 
> Ravi Kishore Koppuravuri (10):
>   drm-uapi/drm_ras: Add DRM RAS UAPI header
>   lib/meson: Add libnl dependencies for DRM RAS support
>   lib/igt_drm_netlink: Introduce DRM RAS Netlink interface library
>   lib/igt_drm_netlink: add get_error_counter support
>   lib/igt_drm_netlink: add get_error_threshold command support
>   lib/igt_drm_netlink: add set_error_threshold command support
>   tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker Command
>     Parity Error Injection
>   lib/igt_drm_netlink: add event notify subscription and event wait
>     support
>   tests/intel/xe_err_injection: Add tests for L2 bank Corr err threshold
>     scenarios
>   tests/intel/xe_err_injection: add CRI GPU requirement check
> 
>  include/drm-uapi/drm_ras.h     |  67 ++++
>  lib/igt_drm_netlink.c          | 565 ++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.h          |  48 +++
>  lib/meson.build                |   9 +
>  tests/intel/xe_err_injection.c | 623 +++++++++++++++++++++++++++++++++
>  tests/intel/xe_err_injection.h |  28 ++
>  tests/meson.build              |   1 +
>  7 files changed, 1341 insertions(+)
>  create mode 100644 include/drm-uapi/drm_ras.h
>  create mode 100644 lib/igt_drm_netlink.c
>  create mode 100644 lib/igt_drm_netlink.h
>  create mode 100644 tests/intel/xe_err_injection.c
>  create mode 100644 tests/intel/xe_err_injection.h
> 
> -- 
> 2.34.1
> 
