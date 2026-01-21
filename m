Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8F6D4694F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 16:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDB510E832;
	Wed, 21 Jan 2026 16:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILjbL9rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370B10E82E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769011906; x=1800547906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kN6X9IFXZmNtzxV1mMMics39SSeKXtcdYl1StHrwMMg=;
 b=ILjbL9rk/fd2aFRcI1zeqbynu08AcMoY+SaE4HnvfFYctnhoQh2vVzP+
 K9nHmGE/vvBQ9PhwKxbeD+ppUVNaUMItAcLGpnazoLGVs8I6Whm08v7M3
 0xR2O9/U5M4mAI9tq1Mw+6a1Te72CRXW7uXz8qeGpGRJxNtwYRU/oKvlU
 67MlUyb+k8KYGh92OnroDYNjD8YM6b+AUqge+jB9BOOvkeoyOgtUC+CKE
 L9lCWtIii4e7TNXjTjMdllad67k/aBZhYHHYgEl5rmUd5jnPHKX39zsF7
 NvnFN3JoXZrKGPy4z2jgWkGv7YYwoiDnVc98Q3iSbzLYGJo0ar/DdVVwr Q==;
X-CSE-ConnectionGUID: QAY8N+uESHiIgo9G0bjMkg==
X-CSE-MsgGUID: F6WOWI7HQ4+vrAsJxFhoMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70142140"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70142140"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 08:11:46 -0800
X-CSE-ConnectionGUID: QRq+ig/oQaCi2eJNgk132Q==
X-CSE-MsgGUID: tTBagAkTRHKVrXA2w/frPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="205623493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 08:11:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 08:11:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 08:11:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 08:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh9B7OgJNyIEuigCSu+6aBawGidvmoN7b458btBV0yE/0yD48O0IorH1EL12iC/OEVAlGXQJsOBFFE7HhrfoqBiNq0XPw9n1X2CZMhBkmdKaOHiaqZIw5maGOBROuwt419gftBuXuB7jIfuELheCjmc+Lqf4mkE1H6eRxQ8/e8gBmi0EdWKKclsZOFN/bsjzhu421/XLsJ56hm4tlcE/K/WPRK/pO6YF+1bijJt0wmNA4/q9vsY9AN2RVlC/yiEe/Fgb4QskW0bYFPesiFNuZzvEF5U3aElGrHfdjPhqydU+p6V6y17sC2hSFL9LwYNMbIXBGuEZpxpsawSwVgITaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfm2Q0mrpt2bkVi4iXvKRzxrmURJmyIypcP6XO4xWoY=;
 b=VgXvl4WHZqfXNCNYsnQzKax8GjpV57STdoiIqPS8SV+K8aFjSJoa7P80mC5q0tJB9n9x7usYhPEuyUcxnFP42raLJ9HZs4MBwNzsM8/GD6CTdRxU3NuGO4P1Y1bOI1Bv3WH1QHlENv/T09Oc6B2nDMnRjLCpF53qyC6pgiUq4J8fKm1jmwud2FSOIkH9mtTC0lVqsgsx64EhxGl4sfe4Bfhg0hMeVsEh5eI5PS+TXYO+h0mAhOUcQTAZC/w/HPQtfa3Jk5veBaQbTBQP1pxevdGBZAhalkYnvCEJUCDtmC1ACyXBO+MrtaLvj8lMViXudZsO3gXKTBiu9WSlS/R3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:11:41 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:11:41 +0000
Message-ID: <66e8f7fb-402b-4703-ba98-7cb2eb7218cc@intel.com>
Date: Wed, 21 Jan 2026 21:41:33 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_i-g-t_v2_1/3=5D_tests/kms=5Fplane=3A_Split?=
 =?UTF-8?Q?_pixel=E2=80=91format_validation_into_modifier_specific?=
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevan.b@intel.com>,
 <juha-pekka.heikkila@intel.com>
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
 <20260120045545.102676-2-ramanaidu.naladala@intel.com>
 <CAJ=qYWSmWEi26YKLF2WvG5rVEoFw=nZFdnyK19+gA8wOc86UNw@mail.gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <CAJ=qYWSmWEi26YKLF2WvG5rVEoFw=nZFdnyK19+gA8wOc86UNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0097.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::12) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b33c798-051a-4428-55a3-08de5907c35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmpxclpOYTA0WXlVeXlIa0g4YmFRSTNFV0hHNmJhQkU0NkZUd2tudDE1UjBT?=
 =?utf-8?B?UURjK2dIeEgydStRbFlZenZSVjBzVlhGem5Bb0RMdnBUM2xxdktOSWsvb0gv?=
 =?utf-8?B?d3FRWmlwOG5ueGFSMDJWeGRoYXhOb2xJNjJDdmoxWWF3YlBjNmtvRGVDc2FF?=
 =?utf-8?B?TkRJRUtGblBwbmJFZkVIUlM4czdyL0V6bm9zVXZtNG1Ra3h4eVlBblhGSXRG?=
 =?utf-8?B?VCtuQis1eUFUdGkzVEZGeVRIZ0FZWHNSbTdxVUNDMkxYbHgzWTF2d3ROM09s?=
 =?utf-8?B?Sm5KNE4xRURRSjFvV2RhUFVsVlRTV1lHam1DcVpvV0Y3ZGJTaG9OSlBOZDRr?=
 =?utf-8?B?b0lCZlFTdkxRWFZidnNpbU1LV3k1cGl1T3FsblA0UEMzUUQrWm82YW4zWjFN?=
 =?utf-8?B?R2FUR0FJa3JtcUloUkVjN0xaWTlBYTlUMi9BOFRBTnNHQUs5NTZHQ3p0M2xH?=
 =?utf-8?B?Z05EVnp5d0dwRXBpTW9YekF2ZGEyT0lJd3hVZTFYaGhUYnBrWWNjaW1pa3Fk?=
 =?utf-8?B?c1ZLK3l0MXRwdUhNZG5Ja1gxMDRiOTBVdmJjbWhISHB1YUhsalBocGo2ZUZE?=
 =?utf-8?B?R1pJV3NneDdrRVQxa0tSMXc4eFRpUmdBQTl4RXR0QUR0eGJ6MUcySTYrd0lD?=
 =?utf-8?B?Y0NCekh2RnRMYzRLNlBrZ1RlZlh0bUtYbHZzOXZtZEE3bFRoUEpjL3pkaWZT?=
 =?utf-8?B?eE1Nc1FLRWRORXlVZjBmUVBnV3FzRnB0NnlqNDc3RTBlazlucFMxQzlEbFMw?=
 =?utf-8?B?RlF4cG9YVi8ybzRpQTFibSt4WUVROEcvblcvQTRPMnQ1RnZ5emJVSFpJMFBm?=
 =?utf-8?B?K25MQUI1c3B2TElDdlB2WXIzQ2FWaWpFL1VQRVhjREdoU1l4QkEvbW1vb3dL?=
 =?utf-8?B?cmVUSzNobXp6QzlvakdPcGZORGhBZ01DWDFtVGVOY0l2T21IVk5VYzh2Lzdy?=
 =?utf-8?B?ak51eHlpY2NkZG84RE1GaVU0cnNTUkJlU3I4ZFVEc2hKNU9VSzNnTTdTL2l6?=
 =?utf-8?B?WHVudUt3NktuTms4TFVRdEpMQ0ZaWUtyZitkOTVYQ1JabG9JRHdXWkN3Q2lj?=
 =?utf-8?B?bzF0aFpVTGdRbEdvMzRVTDdJdTBnRko0S3M0YTJZQm5zMktUa0ovM0VtbTlL?=
 =?utf-8?B?OTgwMEN5TWlCVDFEb2N3ZVlkUDR2V2hSck1GSzYva0JsSTZXNDhBREpCenI5?=
 =?utf-8?B?dDErdjJ1VnFaL2daRFB5SDRVcWJ0bVRRSG1GRkgvN3RUTFBpQVhqZkxESUxO?=
 =?utf-8?B?OFdSU1hxM2dQZjN2VDJqQVkzampGcE1PcXdCTVBYcHBYb2dpbktHTU5tbjMy?=
 =?utf-8?B?TzFTaFhIM2w5S1hmbGZIbXVGTmpUQUo0ak9PN2s4MmxXREZzUFU3S2Y0c0ZE?=
 =?utf-8?B?RThidnBJeDlhSHh6NjhGNVh1V2F6ekxHbnhpSVZiV2JLUHdVUEs2VEJKWXMw?=
 =?utf-8?B?K0c1WVJ0aUwvZW00RnphNldKdkZuQmRCTndzTUh4ZTZiTFpiMGRIUVcveVhl?=
 =?utf-8?B?OTJUT3haaXZOcHNsTlpubG85MnB3OGdVK3RpOTE4YmtFN29YRVpVa0FHSmpT?=
 =?utf-8?B?ZXVuUXB6Z1VXencrUmV3L0ZBNXVYSmhGakt2R2xFQnpSeUNMeWVIVldIVUlH?=
 =?utf-8?B?SHRpUkt4OHAwTjRYcXIrSmlnaDFqYmUxZ0dqMUpkSCtnTUVzS1A1K1VTRXIx?=
 =?utf-8?B?ZHBYcjdNc1hGeVZXQy9hTUczMW45TUlUL2RWVVVYOE15bDh5TFBkS0tKaDN5?=
 =?utf-8?B?Y2d1NDllS0tSbUovU2FiaStvVDZhSDJ4dXhESk9oekw5aHJOZ3kwQjFrUXZw?=
 =?utf-8?B?MjhWNWdhUnl0VExOQ0hlRUh4a1Ztb0tIRk5LYTVJblkyT1pSWjVxV2xsMHM3?=
 =?utf-8?B?M1h3ZkQrVms2SkRsVlgwYW9GblkvUXNsSzBMQVovTGJwU0VYK2VxME1PWHNo?=
 =?utf-8?B?SUVXaEZtRlAyVzhLYzFhYXNNNGR5cUJ4eGFCbkpRQWdDL3RrZjFzdzN6UjAz?=
 =?utf-8?B?R1ZjYlVjKytlbzJqeXN4OVo0MGNvRkdGSzloRDh0eVV4bVhQTkdwOUhqMURU?=
 =?utf-8?B?TzU0ZjFOTEVJcjh0UTJCbkozdEtQOFBBVS91T2p1Z2s3MjlGWXFOYyt6ZjFu?=
 =?utf-8?Q?ScVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRlZUJqcmJvLy8yL3dRbnFRSzBmTDVTSENzVVE5cFUxY3VqMUsyOHorU2pr?=
 =?utf-8?B?aHNhT0orMWloVHphOENkNHYzWjhXNVZ6eWp4V29USGN4UUQ2UzJJUVNRYytQ?=
 =?utf-8?B?Vll3T3hFQjhTTjJjOUVEcGY0Nzc1Y1lGS1NjdGIwMFJWWjJ2bExweWVEK21k?=
 =?utf-8?B?VitqVHNpSFpMWUt3ZmU3U3BtS0JkYUZiaWZ0d1pnMWJsMGk1dmF1TjdQTW01?=
 =?utf-8?B?cUhwQ1JRRDh5ZG90V2lBK1F2cGt4Zzc2RStJbU1Ma0RoMlNKclgweTFuaENv?=
 =?utf-8?B?NE44KzVwM2hkU3pnd0t3MkJIckN6QmxKWFdtaUNpSGk4bkhGTkdKTVpoejlI?=
 =?utf-8?B?cG5BZGR2YW9sNUU5ZHBxeFRtdkEraDJLRGR1NVFmMDc2QnphMnFNWTFnK0hX?=
 =?utf-8?B?NVErdklacWhDK1lhL3ZoNnNwMUkxUlV0YmZzSjR2NHZNNXQveHk2dHJySnEr?=
 =?utf-8?B?amF2U1dlamdERUIxWDlnVmhUdlRCMW85b2hBT09sU3VzOVluRG1QcG5ZUlp4?=
 =?utf-8?B?Szhob0thbEwvSzFvaHAyM0xueFBmb1NSeEdBalpqUXRXclgvNno5QjFuU2Nn?=
 =?utf-8?B?ZTg3cW9pSXNqMUZMY05HdTVHejB6MzExcUROdC9xTjhXbTJIaE8zTFJrYy9K?=
 =?utf-8?B?bG9CY3c5c2pQZTB6RHJoSGZyMlM0bXllbmZma2hPOVRRaVE5cjB1MHJDdDFs?=
 =?utf-8?B?cVVPKzR2aklLSVZrc0ZiK0xQc1kzUWlhVUVQVjJYMkVqWjYxaENXU1FhNmVn?=
 =?utf-8?B?eU45bzdkcUlFRG5RQ2VYalhqOFpUVnhVeFlHR2FnelVqOGlZbzk3ZkJHekli?=
 =?utf-8?B?VTFHYXp1VDVHMW1JRlpZTmFxNXBIM2kwNVYzR1NkaThZR085Y2tWMVhOWS9x?=
 =?utf-8?B?Q1NyNFZBYTVIYXFqalZMOHhhVXVETG1rWUlCb0U1clM2cWtmK20vcFNlQTNx?=
 =?utf-8?B?UE40MllybHlFY1hTaHI5L0VvVHZwcEtqb2RXcUU0bG5FeStYNXREeExkWTI4?=
 =?utf-8?B?dTlEc2Y5TC9saFN3eGJJVGE0YVBWdnJDbHVyM3VpN0JvdDNnR2VTZEFnNkEz?=
 =?utf-8?B?dklmYzBoVCtzS2dWeW1mK2I1MEZFVGp6Zk1GYitGMmlaaXpVdFIyVEFrOEhQ?=
 =?utf-8?B?b2RJOTlmN0preE5Jd1Q5UWpDTHBOdGtzYUppeDRZTE9WcHRsZzI2Q3pHdHIy?=
 =?utf-8?B?enJhL2k1ZDNBWVlMYUduR25kNmZZdld6aGtERmM4SkNuV2V1SElvUGFmQURz?=
 =?utf-8?B?SVE5NVN2NWlueENMa0VtZTVjUW0rbEpiRHE2eHlUQ1p3S1p0R0ZNWXdwZnpX?=
 =?utf-8?B?UGljUUtQdzgvSVp3RHJSd3FyTGE5V21hcVdvd1g5OGNIMnlQdCtHWlVnZm0y?=
 =?utf-8?B?Wm9RWXZuNGFGNEhlWXpmdnBtREdIUDFXMVRVem1lZ3RtQzBpOWdiOGtxY3A3?=
 =?utf-8?B?cWdwNkJUc2tkTkpoV2lSQnJqb0k1WGpGRmJrUjc0emFOd2c5YkMrOG9FWk9V?=
 =?utf-8?B?NGVSQm5lZEF1OWtqUXRBdnRieGs0T0w0K3FuemdPNDIwWG5JQWlZQmV6dUlY?=
 =?utf-8?B?Mm9jbmVOQWhEdTBleFN5Ni9ZeStUS2tpczlDT1d1dDNwVDBPOTB1MnBhRXZ0?=
 =?utf-8?B?eUtwQlZTZUc0STNNblhZU0pUQ0xEYWY4Tkp5NnhUT3phOGhXT0s2RXNreVZU?=
 =?utf-8?B?TnZ3ZTNwS2YvVndZZDdtaEIyWTdXdWh5MnEvdUVzWXMxV2ZlTDBJOUFPNTlU?=
 =?utf-8?B?U3FnRGYzZVdESFhmd0NrbU94MGQ4aHlzek5hT21DTi9yOFFVTHJKWE1nc3NK?=
 =?utf-8?B?emFzYUl2d2x5KzkxUXRSSGlyb1NyOVI3VXdtUE1IdFVHRVZsVmMrYVFNRVZK?=
 =?utf-8?B?c2dxOFIwekMyaE83L3RKK0hzVjJ3WGZBTDVzamNZRTR2Q2x2NFRIMXl0eFBY?=
 =?utf-8?B?THFXV1RjZ2xGUTZrVmhwa3RtZ2NDRmNFT2FkbGFKanZJU0VmYTBHT25Sd0tN?=
 =?utf-8?B?TUNSRTYxVFV6YnVYampJT2lrQXdJSEVxd28wRnlFRzl6NExnaDdtd2swVFMr?=
 =?utf-8?B?L2l4RDZWYnVYRytVVmdxL3g3VDlzeVk2MjRxa0Yxa2cwdVFxdlgrWktwNFg0?=
 =?utf-8?B?aGl1TUZDd2I0V1RURGVRSFAzcGlxVzRIVmtGOG9sb0k0MFQ1VWtjTXM0N3hj?=
 =?utf-8?B?NEdBSFVlVHRqKzBmc2pSaGhoQ3ZBZWhySTFlbnFYNGlvd1FtSnF2WHdWREVQ?=
 =?utf-8?B?K0lUQ0Q0QmZxdVRybkg0TUwzVjd6dHdIU3dxL1ZFZ0owS2ZPdUNKOEFrZXRD?=
 =?utf-8?B?Q0lmMDVWUmVjaHZyNHVIQmo3cG5LWHJOendrSUxBbkZ0VGxvTjJrcTdKRERR?=
 =?utf-8?Q?wPDWIsQKe66flT8E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b33c798-051a-4428-55a3-08de5907c35d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:11:41.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD1q0Gg13lLMUNbJmanN4V1n65/8UbRjhWBRt1CXAt5l5tqku1juiZzELKP0tw+0t4Qx04K/XWOHDlyCwoNam/RZC7N6BlliEtDM0s1n2p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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

Hi JP,

Thanks for the review feedback.

On 1/21/2026 5:30 PM, Juha-Pekka Heikkilä wrote:
> There were few things that caught my eye but I guess they don't fall
> in the scope of these patches, at some point will need to start to
> think about restructuring this test.
Sure. Will do next changes on top of this change.
>
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>
> On Tue, Jan 20, 2026 at 7:02 AM Naladala Ramanaidu
> <ramanaidu.naladala@intel.com> wrote:
>> Change restructures the pixel-format test flow so that each
>> modifier is validated through its own dynamic subtest.
>> Previously, all supported modifiers were exercised within a
>> single test path, which made failures harder to isolate.
>> The new structure improves clarity and debuggability by
>> generating explicit subtest names for each modifier.
>> Subtests now run only for the selected modifier, and
>> unsupported combinations are cleanly skipped.
>>
>> v2: Fix review comments. (Jeevan)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_plane.c | 91 ++++++++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 79 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index ec3245c9f..653a911ad 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -72,13 +72,32 @@
>>    */
>>
>>   /**
>> - * SUBTEST: pixel-%s
>> + * SUBTEST: pixel-format-%s-modifier
>>    * Description: verify the pixel formats for given plane and pipe
>>    *
>> + * SUBTEST: pixel-format-%s-modifier-source-clamping
>> + * Description: verify the pixel formats for given plane and pipe with source clamping
>> + *
>>    * arg[1]:
>>    *
>> - * @format:
>> - * @format-source-clamping:          with source clamping
>> + * @x-tiled:                     x tiled
>> + * @y-tiled:                     y tiled
>> + * @yf-tiled:                    yf tiled
>> + * @y-tiled-ccs:                 y tiled ccs
>> + * @yf-tiled-ccs:                yf tiled ccs
>> + * @y-tiled-gen12-rc-ccs:        y tiled gen12 rc ccs
>> + * @y-tiled-gen12-mc-ccs:        y tiled gen12 mc ccs
>> + * @y-tiled-gen12-rc-ccs-cc:     y tiled gen12 rc ccs cc
>> + * @4-tiled:                     4 tiled
>> + * @4-tiled-dg2-rc-ccs:          4 tiled dg2 rc ccs
>> + * @4-tiled-dg2-mc-ccs:          4 tiled dg2 mc ccs
>> + * @4-tiled-dg2-rc-ccs-cc:       4 tiled dg2 rc ccs cc
>> + * @4-tiled-mtl-rc-ccs:          4 tiled mtl rc ccs
>> + * @4-tiled-mtl-mc-ccs:          4 tiled mtl mc ccs
>> + * @4-tiled-mtl-mc-ccs-cc:       4 tiled mtl mc ccs cc
>> + * @4-tiled-lnl-ccs:             4 tiled lnl ccs
>> + * @4-tiled-bmg-ccs:             4 tiled bmg ccs
>> + * @linear:                      linear
>>    */
>>
>>   /*
>> @@ -114,6 +133,7 @@ typedef struct {
>>          uint32_t crop;
>>          bool extended;
>>          unsigned int flags;
>> +       uint64_t mod;
>>   } data_t;
>>
>>   static bool all_pipes;
>> @@ -149,6 +169,30 @@ enum {
>>          TEST_SUSPEND_RESUME             = 1 << 4,
>>   };
>>
>> +static const struct {
>> +       uint64_t modifier;
>> +       const char *str;
>> +} modifiers[] = {
>> +       {I915_FORMAT_MOD_X_TILED, "x-tiled"},
>> +       {I915_FORMAT_MOD_Y_TILED, "y-tiled"},
>> +       {I915_FORMAT_MOD_Yf_TILED, "yf-tiled"},
>> +       {I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs"},
>> +       {I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs"},
>> +       {I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y-tiled-gen12-rc-ccs"},
>> +       {I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y-tiled-gen12-mc-ccs"},
>> +       {I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y-tiled-gen12-rc-ccs-cc"},
>> +       {I915_FORMAT_MOD_4_TILED, "4-tiled"},
>> +       {I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4-tiled-dg2-rc-ccs"},
>> +       {I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4-tiled-dg2-mc-ccs"},
>> +       {I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4-tiled-dg2-rc-ccs-cc"},
>> +       {I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
>> +       {I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
>> +       {I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-mc-ccs-cc"},
>> +       {I915_FORMAT_MOD_4_TILED_LNL_CCS, "4-tiled-lnl-ccs"},
>> +       {I915_FORMAT_MOD_4_TILED_BMG_CCS, "4-tiled-bmg-ccs"},
>> +       {DRM_FORMAT_MOD_LINEAR, "linear"},
>> +};
>> +
>>   /*
>>    * create a colored fb, possibly with a series of 64x64 colored rectangles (used
>>    * for position tests)
>> @@ -1040,6 +1084,7 @@ static void test_format_plane(data_t *data, enum pipe pipe,
>>          struct format_mod ref = {};
>>          igt_crc_t* crcset;
>>          bool result = true;
>> +       bool found = false;
>>
>>          /*
>>           * No clamping test for cursor plane
>> @@ -1047,6 +1092,17 @@ static void test_format_plane(data_t *data, enum pipe pipe,
>>          if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
>>                  return;
>>
>> +       for (int i = 0; i < plane->format_mod_count; i++) {
>> +               if (data->mod == plane->modifiers[i]) {
>> +                       found = true;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       igt_skip_on_f(!found,
>> +                     "Modifier " IGT_MODIFIER_FMT " not supported on plane %d\n",
>> +                     IGT_MODIFIER_ARGS(data->mod), plane->index);
>> +
>>          igt_vec_init(&tested_formats, sizeof(struct format_mod));
>>
>>          mode = igt_output_get_mode(output);
>> @@ -1101,6 +1157,9 @@ static void test_format_plane(data_t *data, enum pipe pipe,
>>                          .modifier = plane->modifiers[i],
>>                  };
>>
>> +               if (data->mod != f.modifier)
>> +                       continue;
>> +
>>                  if (f.format == ref.format &&
>>                      f.modifier == ref.modifier)
>>                          continue;
>> @@ -1433,17 +1492,25 @@ static void dynamic_test_handler(data_t *data, enum pipe pipe)
>>   static void
>>   run_tests_for_pipe_plane(data_t *data)
>>   {
>> -       igt_describe("verify the pixel formats for given plane and pipe");
>> -       igt_subtest_with_dynamic_f("pixel-format")
>> -               run_test(data, test_pixel_formats);
>> -
>> -       igt_describe("verify the pixel formats for given plane and pipe with source clamping");
>> -       igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
>> -               data->crop = 4;
>> -               run_test(data, test_pixel_formats);
>> +       for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>> +               igt_describe("verify the pixel formats for given plane and pipe");
>> +               igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
>> +                       data->mod = modifiers[i].modifier;
>> +                       run_test(data, test_pixel_formats);
>> +               }
>> +       }
>> +
>> +       for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>> +               igt_describe("verify the pixel formats for given plane and pipe with source clamping");
>> +               igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
>> +                                          modifiers[i].str) {
>> +                       data->mod = modifiers[i].modifier;
>> +                       data->crop = 4;
>> +                       run_test(data, test_pixel_formats);
>> +               }
>> +               data->crop = 0;
>>          }
>>
>> -       data->crop = 0;
>>          igt_describe("verify plane position using two planes to create a fully covered screen");
>>          igt_subtest_with_dynamic_f("plane-position-covered") {
>>                  data->flags = 0;
>> --
>> 2.43.0
>>
