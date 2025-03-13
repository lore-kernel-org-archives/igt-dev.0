Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10AC28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BAE10E19C;
	Thu, 13 Mar 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdIBSngj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35210E19C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741836329; x=1773372329;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IQm94bHj/UW1emvcfoeZXM657JQ+IcCw/RqPAdFzwFk=;
 b=XdIBSngjghRSiTZxhVBnXGN1YBY3UVs745hTReXZxqYB9/x4u3sS4UtC
 4+OWY312l2qvQzOcq58WuoE7F8DiSXJ14fqFFHfmk2GptKXiysYxrwW/b
 TdqPCLTEb5omgD5e1iXyT41ElT40evkJxMA4a7aZzDNL/INp8+q3PHKgs
 m0RG/q6scEl5Qi0G8F/8YzzcZ3WKDJ88pcBfdT45Woe7Ce7v6aGPbKIzs
 ccl7tTCbpHKO0/EFwxEUhxenn83SARQLq8vbomNc98jmlCWW9jPGViCJE
 NEgH2TmNU/HMIJ0fql+c5egJ0GiO0ttWN0G/CRl+8tG8/pylpy7jM5YAW w==;
X-CSE-ConnectionGUID: WBapJqKITwKYyKxHIPwwCw==
X-CSE-MsgGUID: 3WkXXoDVQum1L4w1JVeL0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42191432"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42191432"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 20:25:29 -0700
X-CSE-ConnectionGUID: 2FoHIK7fRF+HxbavjMAFiw==
X-CSE-MsgGUID: Vk8PA+KSTBeqKocPij8F0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="125901152"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 20:25:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 20:25:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 20:25:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 20:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9Ca4p/QMst9u83ufbmakLrZ3LOi4PqaA61DDJQW6Bb/VOwrXmT1tHqn4nlp8Zeg7izyP3nCYWRGNhFZYpZMUX/iV4uqgxgkqB2jxSBUKyOhMztvOPqoZs4EZwuIrZN39aioLvQGbkMpv5ds7IVUvNGQ3A/KhFzjSoUWTGPijyUPq7jZCgMq2a8WoSiKnf2PguCjNVOZmc5J0Dwy4STcbyMkYvoHHD0HBXXfLT+1mg+uVdVSFlphRrUvaEzCRO7MSxxNUD5HG6bCfrINGMVTj82K5qAuDX2VWXWa4fp2M6Me/f+kgQInrocfK283p2zMPIk7ol80rSjcrE9RdhDn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt6JESWtaZibuX89sDBaz9EjZX3fBwgIkqow80DcQTY=;
 b=r2uUQZy9C1mKPhPAWgMN0YsiYWydRoZoXyDLc5u3fHbCqLGgLGahjXMl6YfX2aSOCcXfE/PlWt8jXvuFzZmShRFCJKpgSKgnMZ+kpzVeBCl8KdhmeaaKdKRUcbysIShdUqtfDcZmgxvyWLFCPVWdrIU7theq0DG4ke/K4u9aKHC8uld14z22wLxUGwDh/aLsc7bTdxikC3SZHQYR12EmSrjv/mPK+CsZHjW9wuHWISg9UADqNSKiMkvEW9BrCfUwWYoba0Z6ycdH4b4Wixy3oo9xJhNl7ADKUVa9v6iPlzAiBqeU/2/JyrGeJa+Fb5lEvwEpzLrGkS2cmcABz7edrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 03:25:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 03:25:20 +0000
Date: Wed, 12 Mar 2025 22:25:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_sysfs: Add support for device
 unbinding
Message-ID: <fvh6tqhtox7iw7lov2cok6575fprql7d4aa5crpt3yxktycfcf@ibfjqf466jmp>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
 <20250306101041.26827-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306101041.26827-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 8775d7b2-bb3e-45b5-c6d3-08dd61deaf3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVQ5QnMzQVEwbVQvb2dBUFJQTmlpYlJZZyszc0w3WXc3YkdOZU1XdWRNVU9L?=
 =?utf-8?B?THpPZ2NjK3V1R3FldWkrVEl6R1MwSk1HODFaZ3lCS1creXVjT0ZXbGEyUGFK?=
 =?utf-8?B?VVNlNXhSVVVVaUxzZnY4S0JhSVc3VDFCSEx5M00yaG1KVTNHYVV6MDVqOVJp?=
 =?utf-8?B?eWhIcHB4bEZxVE1uOXhNUVhLZ3dCajQ5S2hocHoyQTYySnVWQ01XOUlTbzF0?=
 =?utf-8?B?b0lCVm5sTXhzRWZrYWIwZEdBQjk5T1lGT09qR0tNUjF2QkpQWjZGTmVtUGdC?=
 =?utf-8?B?UVNyWUd6TTE5enc0NVA2ejB6N3oyUTA3MmxyVCs5S3lDNGw0Uzl3MGpQSkNs?=
 =?utf-8?B?SVpJQ2tLNlIzYnZid1g4a0M0WEwveUtkSThVYWRQYzhpODUycnN6SmRJVDdq?=
 =?utf-8?B?dFl2STR2WHlIM2ZUcEowV01GaU1kVmUwTERMS0tXeTk5ajd1dUU4aDcyZjBi?=
 =?utf-8?B?QUlQbE5pU3Q4TTg4MkY2Z2RxRHRjYXRvVzhNUGVLVlBURDZnNGpta2dJb2tG?=
 =?utf-8?B?Y0hlbkpDcXdjcnlGblVzVmJ2MUlVOE5tTE5mOFliNnhBcXZIeS8wc2IzK2FH?=
 =?utf-8?B?SnV2UnRmZTE5alV0WTROQTg5cmJPNnJ0Q0hidDNNOEpTSlpkdStDU0RENytq?=
 =?utf-8?B?LzFTSTN4eHVtTmU3dkhkbmxJYXc0NEd1K04vTHIyWjgxdXVMS2NwakRaWlU4?=
 =?utf-8?B?NFNwYjZNTUF5dzRjZjFZNXliSnFOckZQRXpWaVZhWEpScDJnblFBZVkzM2c1?=
 =?utf-8?B?SnRnRlV1UEFxOXZManVPT3dEZjAwWEsyYlRjK0RvWjQzMjU5L0pQNVZSRXBs?=
 =?utf-8?B?TkhMMWlaVHRpcGgyZnoxNzZZMTEvRzZhQlBxUzR1NzlBRmpCYlJOOUc5K2dr?=
 =?utf-8?B?cUtKc0RyTFVzUGZtTEVobUVIRDZlV3A0aDRBcHhIT3BielArK3hoZlVYTFp0?=
 =?utf-8?B?Z0wwOHR4NFp1WWxpT3kyT2tUL3hXK2NjekRWWmpiZ2VxN2d1RTFxeHlqWVhX?=
 =?utf-8?B?c2Z4L2h4KzZ3bjUrcXVxa05tSkI0dkxwTHovcElwbmU0ZUd4Z2dYZElyWnJU?=
 =?utf-8?B?ZjlhWEFKTEk5enhqWnpMcFlGUHJxMTNtYUQ1SnRjam5rZ3RyS3MycnI1eXI0?=
 =?utf-8?B?cjI3NWcwNnBXeW14SE4zblN5MWZGd1oyc1I3VVhqaklveE9xbytRMEJRdy84?=
 =?utf-8?B?RUhuWHRTWHJqb0w4SXU4UFlFRnhvRmNsZmQyQVVkWmhzVVdBUVhiazR1cGV6?=
 =?utf-8?B?NVBrZXRUT3FodWZ0SXpMSnd6LytBc1pwYVN2K0dOTzV1VFNXVG1jWVYzQVMw?=
 =?utf-8?B?akt1U3pvc2JQTnBNazFyU1NwUVZ4VHdkUjlpbVhtNUx1S1BlWkF6NWZNdTlR?=
 =?utf-8?B?NGcxTEZGVFQwQ00rMlpJcGpiVWowU2dMSmV2YUIvVFJFTzB1eXhLNWk1eGRx?=
 =?utf-8?B?S1ArVFhmYUU2aFBnNjlHSzhWeHNYYUMrZUdPZFQ3UVBHYm1GUnVMQWZHbThm?=
 =?utf-8?B?N2FMVU5mWkx2UDF1cldXMjNXYWFpWDRPQW5LbHpHL2pSaGUwYVk0dEZPUDM0?=
 =?utf-8?B?TjIwNHYwYXpjd1RvZEl3KzJTV0VxU2FBQ1hzNFhqeUIwbWt3QXZCYldtQVF1?=
 =?utf-8?B?RUMwZzJYRGozbXlVdXJTUkdOajI3ckFYMDJidkFaaWYvL1FQcHZvb1BOSzBO?=
 =?utf-8?B?U2J4VXgzLzBhR1RZZXBsbUVhb1lNZzZoTCs4aFZZamhhbEtkS0FKV3hlRTI0?=
 =?utf-8?B?S0dXSSs5T1ZWRUt6dEtDK2JmZ0hMWXgzalJaYmRFRkpPUW1XcnlFQmgxdW5z?=
 =?utf-8?B?TTBUVTdvYkpaY05qNHFET1lYMUFLa1N4UW9LMlVMRE92eFMybitaN3RjY0Nh?=
 =?utf-8?Q?G78P7QN9MHbL+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVc5ZEpCUUR1MmxYOFJEWWJuR25WN0FOYmI2UngveDM3eUZFMWg0bVZ3MjVF?=
 =?utf-8?B?MVNjTmpyRjRqSnpJclF1OFBjTEMzUlZxRUJEZ0pPN1JBWU9OVDFTYW95d1Zm?=
 =?utf-8?B?M3VKZDhMU2NFQ0daWno0RHNNNEtmQ2FQRngwOTBUczR1ZWFRVE4vRkVXdFo4?=
 =?utf-8?B?emh0bVpuRTNKUUFKTFZiTWg5Lzg0eUhtSnlEbWpJTGRyWkJhemIxd1ZUQXhi?=
 =?utf-8?B?RUo4dHNubW9OYVJYQXhZRjFVanR6ZGRKSTdLUE5rRG9OZ3dKM05QeXZtNUdW?=
 =?utf-8?B?NnFHUjRud2ZhM1d6V0VacVpKK25SY3FPZFQreDE1MWRmajRqSC8xVkRUUzZ4?=
 =?utf-8?B?OWRPeDZGUFBsYjF1dk5HV0lxTFN5aWNhbjRhcGJNbkkxci8wMXJ6d2F5RW1i?=
 =?utf-8?B?eFFNRjduTjFMTUZ1TWQyNE9vaHNOSUVjTmRNY2FrOTZ3VlJJb2Q0T3ZUOTQ0?=
 =?utf-8?B?KytGa0NhMlNaYlVmTUduSHM0Mi9aWGY1RFVaWnpjOC9YZGtBT255R3NPUWcw?=
 =?utf-8?B?bGdldHU3QXJWM0ZCMWt6bk5KMlpoaGU2OEdRbDNYd0FIeFRWSmpUd3lWRjY0?=
 =?utf-8?B?YjJoNDFiU25pUE1wckF5enhtd1Q4QnMrZUFSR05ROGhoOGtmRDEvTWlxSjJl?=
 =?utf-8?B?em96dUZmaUQ5SE5zdTg2M0NuQUROWGpBUHpjQlN4dTFrNU5ZN2JWUkZJcTZC?=
 =?utf-8?B?N3c3TFZGaXhmeU11REdaSldPc29tcU9ISFlLRWZEeStQVmhHdnNOdS96aFN3?=
 =?utf-8?B?dE9WTEZYL1YwcjZqeXhjQ3BsTDFZR2xSeHFCV3dlUFlKSkdWeVI2RGVmVFJL?=
 =?utf-8?B?L3pmbitrSkhMamlqeUtsR04xeTRPckNkWHhOenArWVgwK0FFN1BsUWNjMHA4?=
 =?utf-8?B?Q0grQjJ3d2U2M0x6ZWtDN2J0d3pmWFE4amdzQnpwRXQzZ2tGMWNCMjVvYUpn?=
 =?utf-8?B?cmozYW5WSW1LZnRuUHVyNDJ4WnlDcmE2cUZGUmE3QVNXbFBub3BjV1g5QTRM?=
 =?utf-8?B?K25kc0c3aDAvMXFnNlJXbGVYdHhocnpzcHQ5c1FCZEMyMkN1UmFOUk9YNGg1?=
 =?utf-8?B?UGhBK2VSTVBjc3FaWFowUFBSK1g3ZWo2MElRWmd3YnQrSjhOcUtEbktucXRs?=
 =?utf-8?B?OXRwY1ZZY3MwUDZEZk9tY3dnVzZ2dlZKcitKN09Qbmducll3Y2wreDVycmI2?=
 =?utf-8?B?M3V5WlNKSmhwZm84SURFcDRLSHpuRkVZZGJOdmhrd0VITEM2Q3QrWStGMkd3?=
 =?utf-8?B?cGQ4T093YlRXRGdDM0ZGYzVBaDEwdmRzZ1J3aUF3UnZSb2FVK3BrMXIzblJq?=
 =?utf-8?B?MytocDN4YjNiZEhtTnZqbEdnSlJLN29jTnpCWW5KV1FlakU4dzBlV2FCODJJ?=
 =?utf-8?B?V1dsWGFSYkZBSE9lTEpDdGxybzQ4NDI1czVXQTh3N1pPYUZrRDhhYU5SOXh1?=
 =?utf-8?B?djN1VmRYankzamVieklRMWNaa1Fzc0tHdEtJY3ROSTlZK0FGbW5QNXF5WEJW?=
 =?utf-8?B?RG90Y3ZRdzBVTjJZekU1bW5xeUxNMlVnMkpvMGpXbkZkYlplUmorQTdBTXU4?=
 =?utf-8?B?blpWQjZ6S0pxczJWZllKbTY2UHU3d1NqUXd2WmxUK3pVS2FscmFLWXUrbXU4?=
 =?utf-8?B?eHphOTBiTENlTXhYYXNRUFJ0bnRnQ2xpZmw3UEYvWVIveXgwQ0srOTFkN2ha?=
 =?utf-8?B?Rjh4MFhDWE9kcGgzM3ZKRU56cGVydHhPTDZWTW1lQUxIRm5nSG9oMjQxMmkr?=
 =?utf-8?B?bFYxcGkwOXIrRkpwMkI3MXFtS1lxcEM2OThNOTQ1ZzhmbmU3emE1UHZoM0sx?=
 =?utf-8?B?dUhxbHhxU0xwUHlKMGtNMlVNWVgrOXJhYXdSMk9la09SbUNMY1llTTJEcGdS?=
 =?utf-8?B?anBvYXF3YUdqblc4Nk1Nd2pjZU1FTkdhUkpyS2t5Q0ZXVDREZzgrS09PWUtt?=
 =?utf-8?B?RVowaDZNdmJrYjMxcTZQdlVodVZmU2xKYk9KODRoK3VaVFQwMWZIeHB0c09O?=
 =?utf-8?B?WmljRFIxNFN5UnRLa1d3L2xjZC9Yall1Y3NJNlZtamlSV3hDZGRyVFphTjdK?=
 =?utf-8?B?STZKOGJ3QWZyV3dXNTl3THJGY2p1ZE4yQS9Ubldsd2NZaGNKRnNpSnpjYXJt?=
 =?utf-8?B?bDZQeXQ1eVIzdWl2d2ZtOFdRcHpRTEpSbEZHUlRLLzNHZk0yRXowaW54YXZH?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8775d7b2-bb3e-45b5-c6d3-08dd61deaf3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 03:25:20.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD11Go3PJk3yKg6whKls42FlBqpeY5yTNudUPMH0+hLjHWKQ7j2N2q3+IpuTL8Vl0SPDLyTTZ1FIP4f1mrKCEFpiyc6CdQIr9pzUmuDiR6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Thu, Mar 06, 2025 at 03:40:36PM +0530, Satyanarayana K V P wrote:
>It does not harm anything when we try to unbind a device which
>is already unbinded. We do not want to throw assertion when
>the device is already unbinded.
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>---
> lib/igt_sysfs.c | 4 ++++
> lib/igt_sysfs.h | 1 +
> 2 files changed, 5 insertions(+)
>
>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>index 2e4c2ee63..3fffaf96b 100644
>--- a/lib/igt_sysfs.c
>+++ b/lib/igt_sysfs.c
>@@ -1509,6 +1509,10 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
> 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> 		close(sysfs);
> 		break;
>+	case XE_SYSFS_DRIVER_TRY_UNBIND:

oh no, this function uses the wrong design, let's not make it worse.
xe_sysfs_driver_do() should really be dropped and we should use the
proper functions.

It's also in the wrong lib layer. igt_sysfs is for supporting sysfs
things like opening, writing, mapping from a device to the right
directory, setting an value, etc. We shouldn't do to do arbitrary thing
**using** sysfs.

Finally, when we want to unbind we shouldn't really pass an fd. The
caller has no idea if the library function will close it or not. That
triggers several different paths in the kernel as userspace holds or not
an fd open.

Please do not more to this function. We already have igt_kmod_unbind(),
we could have igt_kmod_unbind_device(). As we could have dedicated
functions in the right layer for all the other actions here.

Lucas De Marchi
