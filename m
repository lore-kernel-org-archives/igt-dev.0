Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9249DC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 07:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1F10E75D;
	Wed, 23 Jul 2025 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQakuGRY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85E210E75D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753254191; x=1784790191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9+T32xQYcDsWHbm/YJuYe/0aN2RV6iY8LzSybaHvveI=;
 b=GQakuGRYP8f2foLhxN4zF6tGnOXHotfkOYTN8itbiBbE9VhBRSxGKoub
 w+E2fFbzcsOtlxsHbg91QmWYTkCvXv8X9ZQWMVSz9EY/o1f33kBsNXvKg
 GY63XQoY1v1lfBiQ4cYxKL3yJN4mfaHv32FLmzXfp7R3Ypk+FXH4Keb6l
 XlgUMUmbimGlVuF9Zl6qgT4f6jejaBk2O6zhgit5hpb2y+FPWkjzujZXX
 DPKNnbhqEMsSa3L4zzaUloBZXjcgkN31/LQCHlZgz3Sr1uWbX4CRiC3Ej
 qBJ+73q4Fc/rDk+FETISNT64nTQqkqD7TWz2queLnUw8bXyBgU32HE6dC g==;
X-CSE-ConnectionGUID: 7/uHudInQ32hfUHLT1rSCw==
X-CSE-MsgGUID: O4fvTpKARyqyWWvgvoIeXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="72978881"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="72978881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:03:10 -0700
X-CSE-ConnectionGUID: /FCYNIIVQTiw52c0cSFyWA==
X-CSE-MsgGUID: 3DUSxOtWS7qGGOaV9S4MaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163622605"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:03:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 00:03:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 00:03:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 00:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCgyeTtr1LgC1RCmap7lxLxR879IH6ENiNmYysa7VgPT3acaihe0WzVM5fuKmZT03PUhU9af0hLNCswKUG5xSLZlVQCnzUiRvH3UAR5H4YDIxim6QYGf4Rir/yfnAE/87ufX1OFjyppsMKVfx5AqTYPzSnY4xjgor13Teh0dSJ7RoIM5pV0CX3wqIMix3wu1AYldV/n8H3fB4VbzvSk/D6so6B/LSxNSK/g0zjpPV8cff1QAPHsxbYl0upsNISmIJDtMZR97p0AvuVBUjbOyAHa0aPMy5ONHbvYU0Ke8TarGCIgy+UGfAUd23P8J6v8mCjyVJ/hMyT9ZhgYACtmPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxQeDgWQDORtmP9h/2IQiYmbU8hMRq2RFoBXcbIDSfM=;
 b=oYTbJ1HQoMT+wg9E69tNYVmCMiArnz8Kwdiv6SqSiYVZgBYSryuUmb0Z0EQnp0O441wNsG/R1Gl9l6n3Q6Qlw8xD4VEhCbKc7OlvtbGr6r5v+dK3J7Lh2LrkMZbD3XghdSJTagEtEvPRLXjeepXVcwe7FWUJgOa/OYGu3XVoDKgGZmyq47xmiO/vctvJXbXhKxWH6aru3LLnS7LCuLK/172IbhL80mN4qni6Y7tTKRmArTU8eLYr64nELF0FIezP0BkKtKf8kr8DUM160+JMpW9bgONtjF1mm8Tc+dA7Jo6WP6v90hCtYNDJ0j5hk1XtNccxJ/2E7NzsOeM4jsc1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 23 Jul
 2025 07:02:59 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 07:02:59 +0000
Message-ID: <55f349f7-91f5-45bc-8e10-688fa88cb844@intel.com>
Date: Wed, 23 Jul 2025 12:32:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tools/intel_dp_compliance: Enabling XE driver
 support
To: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <khaled.almahallawy@intel.com>, <jeevaka.badrappan@intel.com>,
 <ville.syrjala@intel.com>
References: <20250723020526.1164888-1-disantkumar.isvarbhai.mistry@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250723020526.1164888-1-disantkumar.isvarbhai.mistry@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb0000d-05cb-43a6-08f9-08ddc9b6f532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUc1MGNkdnpTSDczZWo4eXM4M2dLcHdrempGdi9uUDlKYzNTZmlNdGdDYi8w?=
 =?utf-8?B?bTd0dGoxLzlMT2g3TUt3eXNMMTY1TzU3VVpFMnkzMno4YnloM3R3cHdPTkJ3?=
 =?utf-8?B?L1pSYkVOOThuV2I2N20xbTZ5bXZRZHVhL24yOGxkMldLVXJpNHdsbm1KcUdw?=
 =?utf-8?B?N1Y1WjZWbkRsY3crcHhnS1g4U0ZaemswcHdyYzZPMmVvL1JXMjBSVkVyeWNW?=
 =?utf-8?B?cVNhRmlveUp3L0FpdmhuMllnWUNsSEVEVnpESzEvaERqbEF0QjVXT0ZCNUpM?=
 =?utf-8?B?QUJ1M1dQZm1LbEU2OFNzRkdqQ3Z6NlZTWVFiOUE1NS9za2Z0NEdyT1oxY3gx?=
 =?utf-8?B?NTNrN1dQT1dXQkptR1BkMTE0QS9mMzdyOXB1cFkvczFwWXRQc3QyajIyYVRu?=
 =?utf-8?B?VUVYVGp1NHFwTWNyNTlPSllKYUhSVUlRT0MyWGNhMGU0S0djWUV3WVNaK2Er?=
 =?utf-8?B?d3ZaRkxtVWtlTUNHT1dJY1JwUlZGdnJlZlU2NVdoeFhIVnpLODFSVUcvTVJm?=
 =?utf-8?B?Q2NlMGtTYjU5NVR5U2FoWWw4cjJuWU04aUw5TmZ6YzhYclptY21oMit2SUF6?=
 =?utf-8?B?U1QzM0huellhajc4elZiSGpZV3A0c2FHcG50T20xMVJGU2lRNkNOQnZpUlI5?=
 =?utf-8?B?aU9Nak54d1RjR0JGQVlsSCs4MnN0VzRTdlhoR1hTN1d3ZE9ManJGQ1ZyeXQr?=
 =?utf-8?B?R1VGeVRwbjRYZmdVYmRaN0ZVTTdDOVNjYVV2Wm1INkQvOXBDdzhPVkNoM0s4?=
 =?utf-8?B?ZzcrZDM5OXdLQnFEb0hPQkVzOHA4aFFNa3FORDZzTzZtVG9oNG9lSVBDckZn?=
 =?utf-8?B?N0RwUXdGaDhnL01rT3FiWHVhWjFkMjlKVXhOZlMraW9NcERqb3VVS05CUHpH?=
 =?utf-8?B?ZkxldldpYzEyTVdrY2kvUFpSbE8rYmtuWUc2NTFhMjI1L0tNMHNvUng5T0sv?=
 =?utf-8?B?dSt2ckJtRmVVZTJkUVNFMDhIVzRVRUVhd0xJYUt0U3hnNzFoaW9Dazlxb0Q3?=
 =?utf-8?B?TWtsbFE2cmtUTUhTbFpJcUxoWXN6bnRCdlN2VG0xVWRUTWdFZkxUV25EVXBn?=
 =?utf-8?B?dUhIV1kwUkxkZmYrbm04UlVTYmZCLzAvb092c3FvTGdLM3M3Y0thU1dNN0lO?=
 =?utf-8?B?R1BzOElXOHlDZVhMVE4xUEVkRjFDdzVHMzllQmMvaTlTN1JUQ1pGQldzVzNO?=
 =?utf-8?B?U2dGVTZNbEJEbk0zOG9GR21ObjlVbkNFWndoRVhGdWkydllSSjJXRHZqWktQ?=
 =?utf-8?B?cU80c3dXRFZKaXF2WEYrazdaQ0F6dnpqUXptMTk0WjlXb25NdVdjakFQRkdn?=
 =?utf-8?B?RGpHbmlCL0hUUEVYYWFBOE1nNjFSTndmb1V1bzhRVkNEWUJLNktYeFhQcGxG?=
 =?utf-8?B?NHRLYUpFZXJycEpVYWZXaTFWTVJBUDBCak5qS1dTelBCSHIyZ1VrWGZOc2xQ?=
 =?utf-8?B?TjA3dlFwc0VYZGlDMWpVSWVTSGdpdWdrUGtNL0NlRWY3dGw1MlZwVXpuaDNE?=
 =?utf-8?B?UGhwc2JQb3ZBSFRTSy90VzhMd2toVVV3dnhCby9HU1BkdWdjbnl2OEpYeVp0?=
 =?utf-8?B?cnBHRTBMK25ZLzBUZnhUMm8vQzFCRWtvSjh4dno1MkRXUnRiKzlmQUNOQ2F2?=
 =?utf-8?B?eHF5ZXlYallhTGwvWE91dC9RaStYdW92UkJKZjBwMFVJdGwyZzNoYmI0endq?=
 =?utf-8?B?Y1FRSEQyK0hYTHR6QlA1cDVDaFVCeklneVpSQzN0djRySXM1ZDVlTXp6NUpo?=
 =?utf-8?B?V0xWY1llMDlHUERjSit1QU5NMlAvYnh3bmdST0FHaEc1Q1NjNWMybmRyUkNG?=
 =?utf-8?B?Yk1PZTJXUGp4QlhsUmNvV0x1MSthZWl4N3UrcFZrY0xhWE03Y21BRy9NVUVM?=
 =?utf-8?B?V2gvUVY3WXkvSU5BTmtDdEgxeG1Qd2hYRG1GZmdBcGZ1c3hzdFVvdENRSVlk?=
 =?utf-8?Q?sob1AygXmlY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckhHbmNiNXhvSE04NUhBYWdOR3pITVgyU2k4bTZxRVRTbkRxYjVvWVpsWTZ3?=
 =?utf-8?B?Sk8raDgzOGRvbjNRckVMTmxQZGYwY082Rkt4a2xxdnorUCtSU2hIQ2NOWk5n?=
 =?utf-8?B?dzdpYklvYzVyRkJ1QWhYSjR3aGpRZEQyUHJmeGRpRXBhZ0xOZGZDeExBOWlP?=
 =?utf-8?B?a09XbHZJUFg5Q08xM1hKRmplQkZuSkdJMSs4WVA5S2dSRVBqRmxsKzVPSVFy?=
 =?utf-8?B?dHNJUjJLUzZXWE1xUFZsWjRpQk5Yb1JZa2ZIMHhDQ043V2RVd3ZyWCtZaUdV?=
 =?utf-8?B?dVJJbHNYeUpZQ1EwYW9mdVc0bUZuRmw4LytQb2xCQytXMXNweXI2bVcvNFZV?=
 =?utf-8?B?a1Jkd3gwcGw3RnhwSk40b2ZwMEM0Ym5QNHVReDBaejAwTHE5Vk56V2dPakNx?=
 =?utf-8?B?WXZDaTJ0TFJEdW9XU012dStDMUE5b1hzUUhPbmpia1Bua2lqdmRsZjUwdVli?=
 =?utf-8?B?a1BROEpjd0xuZWl1a0RreFA4dHExRDQwN2cvdVcramczcHdvVTl6TnhvOTRn?=
 =?utf-8?B?VExhd3J3MmJiUHN5THJNQnZBR1RhWlhIN1RMdVpKT1ZOMnRJdUpWS3dlanRB?=
 =?utf-8?B?UENXN0JINlRWZVBXQ01BV2pHMXhCeWdMZDduYkozd0MwODlKeUJDOFVDOUw3?=
 =?utf-8?B?QmxwZWxuNXdsT3NNdFNYNHZSTFhZQVBianI5cldvRFJEQWtkUlNZMDdFZXdQ?=
 =?utf-8?B?L3lFaEZGbFVRT1dwUWJBaDlrUzdJdUt5TktSS0taWFU0MysyaFVHTzZ4N3Bz?=
 =?utf-8?B?bHZuY1AweGV4OG9sUFQ3a0lselgwNzVqczdKTWFKeDN0ak5sLzdzMzhVT1hP?=
 =?utf-8?B?TkpuSWRaR3lxRndGb2FMQU1QbXRFMnVGdzRZUkpLWC82RFdoYmNSYllqQmpv?=
 =?utf-8?B?WGlVQ1g3OWhEUENuVnFlWFUxeHJrMVBBSWhmQmpDeEVBbmY2UHhzT3FEV2cw?=
 =?utf-8?B?aXdmOS9MbFBJWmgwdEdQUkFNK2JoNksvM0h1T1ZhRFVVd1EzV09CclpoTjlM?=
 =?utf-8?B?RGdnSmNua3ZvYVNVazVIYjlWejZFSWIrMGUzbGRzVWdzdWJ2WHc2Sy9CRTMz?=
 =?utf-8?B?YStZcVYxdGZtdHdwNlh4Znlod053WlRGZk1TV1YwUFhpL2p4cFkyMXkwK05o?=
 =?utf-8?B?UGRyYlQ1cE5sN3dzK2N6S1dOdjNwVUFJNjFrZzAzTitFN3RKaGVpWG1vbjN5?=
 =?utf-8?B?ZHE3THM1N21lQU15WEZrcWJQNE0xV2R1V0ZjOW16Qjc1TCtVcHZTdDFIRHJZ?=
 =?utf-8?B?dmRtNHBvTmE3MmQvWlZ1WC9qL0lKTkx2d2N5QjNZVkJMM2hGMlNXNGpiVWx1?=
 =?utf-8?B?cTFWOTM4dnAzL2xvVUt6bGlhUnZWUVhDT1k2dXF2T0IwZENZbTJKS3NoYWRy?=
 =?utf-8?B?WndpbzJFWDNBRDRUMml4dGJ2NVhjVmV0NVljQjhUc1hzdjhVbXFXT21lN2da?=
 =?utf-8?B?YWZYRkJleXNBWXNieWREd3RRaGlZQ0RreXU0UmhQYkRTOUhJaFZyRVdoNThr?=
 =?utf-8?B?aXFWZXhhMXJJUGRBNGx0VUx1ZlFjWDdNVTFnT1c1R1FiMGNFWEh2YW4rcDJs?=
 =?utf-8?B?Zk9HVjRWbG9XRjEybEh1cnFMV2VoWWJkbm9qS3E5ZlYrUTBHWHA4MkJVQkth?=
 =?utf-8?B?NC9RbmxvYWdRWlJpanlKNmtBMU4zZjhGeDFCK2Z6YXBiaS85NWZyLzRGeHhR?=
 =?utf-8?B?OUo4dFRCTDdCYnluQS8zQzFKM1d6RDJmQTkxa0NMZ0xYalJhZUp4ZTM1NzVo?=
 =?utf-8?B?MkJxYlIySHhTWTVGcWtUc0JHa2NJeU1pWksxLzNRd0xsWUo5MEYvc2tBbUtz?=
 =?utf-8?B?dGVhakJ1WmMxWkFvTzNLK2dYdUIzVVlBcWE1RTcrb3pXRUpkTmxzdEs0d3Fo?=
 =?utf-8?B?WnJPZGo0OVlZSUNqUU9JL0pDR09kdXIyVjMrZG1Kd2JGK25mei9ick1qQThy?=
 =?utf-8?B?TlBNRm81YThKaUIzMDR0TS84UDRQWEJtR1BRa0NwcEM2eEg5UE1YRGNuVk1B?=
 =?utf-8?B?dDY1UXg4VERIczFFL2twWHVVRkg1RTU5aXdxdnJHczFwbkVQYjl1MzZtNHQ1?=
 =?utf-8?B?bSs0TDZTMXoyVDF6aHkrc3BoUVdsQzBHc28xeFh2VmZqVjhldHgzUjMyditp?=
 =?utf-8?B?bGo2MHVtOHoxUUU1NHo3L2NGRkFtZFRVUmF4NVFaaWUxT0NKY001Sy8yNXZR?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb0000d-05cb-43a6-08f9-08ddc9b6f532
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:02:59.6462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzyJxkNQt6ujmwWIVuuWk8OXFvscyGRi5Zwmj3H+JyD4MMnMRf9Rz9NM+8OYhZ+XmFncNpfFIXMhap9uqB97TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

Hi,

Please add version history in commit. With that fixed, patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 23-07-2025 07:35 am, Disantkumar Mistry wrote:
> i915 and XE driver have different api for mapping buffer. Enabling XE driver
> support by using igt_fb_map_buffer function which call mapping buffer
> api based on device type.
>
> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
> Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>   tools/intel_dp_compliance.c | 22 +++-------------------
>   1 file changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index 99196a450b45..31572f6c3ebc 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -361,15 +361,10 @@ static int setup_framebuffers(struct connector *dp_conn)
>   	igt_assert(dp_conn->fb);
>   
>   	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
> -					dp_conn->fb_video_pattern.gem_handle,
> -					0, dp_conn->fb_video_pattern.size,
> -					PROT_READ | PROT_WRITE);
> +	dp_conn->pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_video_pattern);
>   	if (dp_conn->pixmap == NULL)
>   		return -1;
>   
> -	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>   	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
>   
>   	/* After filling the device memory with 0s it needs to be unmapped */
> @@ -391,15 +386,10 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
>   	igt_assert(dp_conn->failsafe_fb);
>   
>   	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
> -						 dp_conn->fb_failsafe_pattern.gem_handle,
> -						 0, dp_conn->fb_failsafe_pattern.size,
> -						 PROT_READ | PROT_WRITE);
> +	dp_conn->failsafe_pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->fb_failsafe_pattern);
>   	if (dp_conn->failsafe_pixmap == NULL)
>   		return -1;
>   
> -	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>   	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
>   
>   	/* After filling the device framebuffer the mapped memory needs to be freed */
> @@ -428,16 +418,10 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>   	igt_assert(dp_conn->test_pattern.fb);
>   
>   	/* Map the mapping of GEM object into the virtual address space */
> -	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
> -						     dp_conn->test_pattern.fb_pattern.gem_handle,
> -						     0, dp_conn->test_pattern.fb_pattern.size,
> -						     PROT_READ | PROT_WRITE);
> +	dp_conn->test_pattern.pixmap = igt_fb_map_buffer(drm_fd, &dp_conn->test_pattern.fb_pattern);
>   	if (dp_conn->test_pattern.pixmap == NULL)
>   		return -1;
>   
> -	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> -
>   	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
>   
>   	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);

