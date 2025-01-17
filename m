Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5FDC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 12:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E78710E1E6;
	Fri, 17 Jan 2025 12:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SevwJrzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972A10E23A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737118182; x=1768654182;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MiZNYlT3/+weBsEPTjmHk1yh1poLl27WgDwVktQBBlE=;
 b=SevwJrztKgDgI4DHqLXPOZT9NdBuLGx63eEtC256tdnUVFdnJan9oO7h
 ZP+bV1m2JWJDwZ3l8noSBYvVyvudBu9eeEa82hW7H0sGt5qTz2/pxxrvT
 Y7rEY9+pyHhKARtGvXXPXRHqw+s9BRUNbkO+mKzIuoA5H+cDijfUekY9e
 AGM7WQSALUG7iUxwQKttkgoqBD1uqQ40I55MpdpkS3VWmitig2cTWYNSg
 gJjXedSlwV9Lf9WgJYdhN5RXx3+j/ZuLh7B2zm8JAcj71wOxBwr9etRy4
 /uSC0tlTc2qXzddVy63i6ht5UAEnQuf4wJqvdbqou7knt94NSnsrE7thf g==;
X-CSE-ConnectionGUID: KEmRMkklSp6sEepV2cRPyQ==
X-CSE-MsgGUID: fvC/z8yfSG66ld/g+iNolg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40357994"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="40357994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 04:49:42 -0800
X-CSE-ConnectionGUID: 61bL2g5gRdykopEYV+UBYg==
X-CSE-MsgGUID: 0Hxc6j+yQrmjWdKlRAWRdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109861132"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 04:49:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 04:49:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 04:49:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 04:49:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDlJbGyYWOVHP0+OQ5Nti1oLmnRXcP3sJafM+n5KwNl1L+RTYKqzu6l/Y1N0iHJO7wuFwGQRZQjBJjPm1CcKQiQIMaR/t+idGcAjXYHrfdl+DW9LqEbXo/+gN73cRQW2hLHsEsXfgkwLmf8+ox0POuudFI3x94552rVhtfTStIF4txzNWqAalYrPv7ryR9YE3ppmXsIMpzXXWRQMDf/IqzMXeGlqDRQ5CZ+XyU2Wj77yvVSb2/TsC0jjdklny2jofCDxrPRvEv4/2KgR2vCOQwz12BigobVzLc+S/gP/COT2cJQvi0ZXVcbeQk3aT/clfCv00cfzuP91Xi5UbwNl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAcFtFNR84qu680yjEk57bgnZKVTEjoTzSsnSgIWGAI=;
 b=Hdc/vmYHq5SoY0cS3U5fY6QNrGXGCK5NIPkuphCW8rnwu3XPQBDCScrRrJkvbAOnTuNm1jBFyQV8I57ZljHxka3YLlxeaTBNTUb3XCsiY2qjtT+6bFRNOgtiSzEqFI1A0PHQUhGEoh0QqcgOxtvnP0H3oQCVmpggt34E4HH35Y08TVhrqCBpi8WxSxp2lzWM448OuK3YOgzhDcFuI4fdaEgo1NbL/rvllW66vZHAbMCDnvIB5L4sNB5PRNz+JwwJnDDpcx6DdsufI2UuG+ZVOIsAspP+jitEVIMIz0gS3Jv/oL5yp4AtFqQ25QZzeSZwmByILraRcqelpGlrAJ4IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 12:49:34 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 12:49:34 +0000
Date: Fri, 17 Jan 2025 13:49:24 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_fault_injection: Inject errors during
 xe_guc_mmio_send_recv
Message-ID: <Z4pR1PnwDkRSlb1O@fdugast-desk>
References: <20241230084451.17488-1-satyanarayana.k.v.p@intel.com>
 <20241230084451.17488-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241230084451.17488-2-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: f8309b02-d597-4fd6-b0b7-08dd36f564f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LytJa2VFMVVUbmRuTThFdHliU2NtOWtibUNHMVRMbzEzeXV2WkNZcmhjWGQ1?=
 =?utf-8?B?TG44UlNkK0lod0dlVitTMytYUmZjY3JNTjR4MW9DWU1QM1BWMEY0Y2huaGpS?=
 =?utf-8?B?djhDN0dyZzlDeWZodjAzUGJKSklhRFlVc1pxVWNzQTJ5ZkJMc1BIS1YxSHcy?=
 =?utf-8?B?Uk5lRThERXVYbmJiMUpmNDRzN3ZFd1NMVnY0cnpjL3FzSVFWUzdOMlc2bDVB?=
 =?utf-8?B?UVZ3a3JSUFRTWTlSSkVaTU9ObXJCSkd0YkFVY0dDMEk0WnZzcmdwWUdkb2lH?=
 =?utf-8?B?ZEUrcXBna21qOUVpVGQ5SlAzOG5Benk3Q1hRU3NpbitxeWEvUDA5RlJKU09v?=
 =?utf-8?B?aW5hNVlPenJKYVR0R25vVkF1UXo4UWE5UUZKNXhBaHlwSDlrTTRRS01NT0NY?=
 =?utf-8?B?OVUvUk9acEQvckNnVGxDcERWc2pQTW1FajhKeTNxT252dzYwWWFrV0FGNjFC?=
 =?utf-8?B?VFh2TkZObWtRUGJZaTBmNWdiVXZlbCtvbUltSElycGNJU25hb0tKTFdNM2dh?=
 =?utf-8?B?TWJ6NFBHNURTWEh5V3JFRUs5aldWVDVEM0N3VjV4QzhiOHd1Qm1SbCtKdUhC?=
 =?utf-8?B?S1I5a01UOXN0QithenFQc1pjSTZ4SEtDTDI4YjZ4TTNtb3NQZlpiSHlKVENN?=
 =?utf-8?B?dDB2elY1U3haZ2JOSnJ4Z053TGlOUFlQRnFpR1U3TFVhT1YreElGQXZ2NmFQ?=
 =?utf-8?B?MG1ZRkIyMWdaOWlHcUJ3UTdwbXVFcktqcEFxWnZZUHBqUmZMTkdiZkNCWk5V?=
 =?utf-8?B?NnIxVHJ1NGQ5RE44dit0ZFI2QzVjbFJxZEZxZURqbW1wSHlRQzZWWE5ZL2Iv?=
 =?utf-8?B?RlZMT2Q3akk0RWxKZkVpQ2V4dXQ0SFM5ekxVZHM5cjNqUWRjTjRldjR0d1FQ?=
 =?utf-8?B?WmhLU3N4dXk2ZzRzWThxV2ZpcHZJZjhBYlIxV0dKUEY2KzVhZFl2VFVsRE5L?=
 =?utf-8?B?UWF6OXpNSlVEKzBrQkVwTnVEK2F3c0RleWI1Rlh3TERmdUk1RzVNZ1F2T2Nu?=
 =?utf-8?B?WGxFeHFNd3ZheTA0aXcvVzJBSCtCalVlTHpvOFJ3SFQ3Vkt0aFIyWERHN0N4?=
 =?utf-8?B?ZmpwOHo4YXZGYklVZFVPM2lIRHc0TndDcTk4bU1lVGFXYzVLWTc2VmhzWi9u?=
 =?utf-8?B?VTJKNS9ielpHcnFxSEt6aTdTSW9qdDVzN0t2UndnZ0lIME92c1Frclo5MzZh?=
 =?utf-8?B?ajVwUVNrRXhIOUJQK2xjZzNXY0VOS1R5M0lCbFBTNkdLWURzRmp1NFJqbC92?=
 =?utf-8?B?OWlmSm1xRFc2cWtVbzFhcitOWGdxd2RjV2xsRWNCeG01bjRla1I0cXkyaWVl?=
 =?utf-8?B?Uktpbks2VVNkb1kyV0wycUhPZmlxM3R5OVByVlN4Sm9MbzFrYWVvU1ZleGdO?=
 =?utf-8?B?WHF0TDdLSU8vWnhJMFMzdU5jenMxREg3MFpiL3NMb2tqM1JBNlBsMStJV25o?=
 =?utf-8?B?SG16Z2ZqejJLMUVqK0Npa2hWTlJLbk4rM1BNdDllWlJndFhoa3E3VVRad21h?=
 =?utf-8?B?MXZoaytlV3RuNURZY216SmtINEhlUWN5NjdQV05CYVhoK1p5d1V2TFNSUUIw?=
 =?utf-8?B?YWVGREo5MUF0dVRMSU1nTHEzSm1VbWh6WmRJVmtnUVdURlRpSDRhczUyTUJO?=
 =?utf-8?B?SjhtUjFjYVdqMktZQTV0N1pwaGtONHlvYnNSZVpyVkNpU1FKQ2gwOEpaRHY1?=
 =?utf-8?B?NjRXd016S1BNNTFQRGpxZ2xPSDBIVWJ1WGp4a1hnZ1RHQytra0h1U3p2NWxo?=
 =?utf-8?B?M2FLVmNwYS9tanpRUldvK0xCaHVuWnpUYU5zZGxDVVh3OWYyOW9vcU5qTkl5?=
 =?utf-8?B?Q3BwMUxaM1QraXk1ZVp4aHhNSGtTSGF5WktzNW5vM01xdGlvMnRqTVF0SzJj?=
 =?utf-8?Q?KsXODZTzpTRET?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXA3U0JGc0ZJSVp3K210emRkc1NzOFJ4WjRHSzJndnhuOWs4NmhWNXNxWDAv?=
 =?utf-8?B?UlhsUTR3akxiU24rL0dDVUVydFVXMnQvaXV5L3dFU0lBTko3V0hyYmRCeGh5?=
 =?utf-8?B?S1FjR1lCU1R5dnZSK2xJOG81OHRvNmg1MmFCSmY1QXlsU1N4OFVCMTZrQmFX?=
 =?utf-8?B?NzNaa01IVFh2czE1eGJ6YXh4VllKODNtZzVhNGN4b25sSDFScm1OWnhrSXdR?=
 =?utf-8?B?eDVydEFmVWMzaXJuaGh4b2FqMnYvUitFVkZmQ0RTcEN0SzRBS2NTQ3ZFVmcr?=
 =?utf-8?B?dXhBTlRhTHpZeUhUK0FWcXZQOXFCak9ZZXBNdm5Sb2lrdDNwSzVmMFFJeHdl?=
 =?utf-8?B?bjNtM3RTVFpTbldBYU5oYUpqczJFUGMwMUhWZEd4dUQ1NXB5aDFlL0RSZHNB?=
 =?utf-8?B?N3VyakdFN3FCd0lIcnRUd3pxWTBJRmNpWlo3Y29NZ0tueEY0dTRzd3ZNOEdr?=
 =?utf-8?B?dGIwUjV1UGYwMmdxZkc1T0RnOFBpN1RQSHZTSWxiVHhwMUt1ZW42SkZDRXZC?=
 =?utf-8?B?RkN3UThCNWo3SWZxbXNTUnVPS3JGc3NFWnRxTFlySlIxOFI1ODBFd0daUjI4?=
 =?utf-8?B?aXBTajRQczFUNXZNaDhPdmJmOFNqY0tvalZLT09McEZqRWt5SU1oSzRMOXRs?=
 =?utf-8?B?ajRNbU1tRGxGOE5zMlVYeWcwZURScUdYeDFGazhJVCtoNHJNT2liUndJZnY2?=
 =?utf-8?B?aHhLaVlpdEU2VkdVSVFiazJYcFRTU2NONm4vV3pYMEdPOGVlejNOeGR0R0JB?=
 =?utf-8?B?UW9Ob1FINHd4ckprY2ZNcENVUE9LdjBoL3RTa0tvQkJMMll1VGROWUlDbXVC?=
 =?utf-8?B?Q1BNM1FGY2VUM3FUSHIxTlJUcUQyQXdlZGlOb0JUQUtDNjlXSDREWHNEbml5?=
 =?utf-8?B?b0xmemtWRkk3T21ZQzJtcXRMalVLM1lGM3ZOU0xsdlZtWEJxR1JmS2xPbGpL?=
 =?utf-8?B?U3RxVFBHZ1BEcjJML2ROUEtXME5sNTVXa1FHT21JRzBhamxBdDlSYjZTeDhk?=
 =?utf-8?B?RkNKbHFRUmhBTWlFVkhBOGJrdzJRbTdYYjU1TkJLRHNLQUVScnMvQ3BhTktF?=
 =?utf-8?B?WmVvSlhaaVJCcWgwYlNlN1VWaWdsN3MrcHA0aUt1aDlHanJlNUpZZWNEWFAy?=
 =?utf-8?B?M1JMTVdwR0Y3Z28xK0lPbmxZNnRxdlIwdWFuSTdSZTBkN1orZ25WdXdHRmt5?=
 =?utf-8?B?OC9YQTVYV082ZnFVT3FMZTdIcWFwT1pERURDVkRZcHhUaDd3Qkd3VUIrUU1u?=
 =?utf-8?B?NUMzQkFZazRFZ1poYksxdTR0d1FjVTFlSTVBQnNjekd6ZzFnNFd6OGlXR2Rh?=
 =?utf-8?B?Tk1zRlRId0k1WmcwM1pxYXFiNkprU1kzUU92RWRHdktqNkpBbm90RW12d2Fo?=
 =?utf-8?B?SlJMMm9GSUFrL1Y2cTc3L3U2TEo2WHlKT2dVSC9CZzhyZTRYbGVsV3AwNGVY?=
 =?utf-8?B?aWcrcHF5a3NqVk84cGl5MHQwd05lK0RkMUd0TzZtWDI5WmhHRUNlY3lWZlRk?=
 =?utf-8?B?NjBKQll5MWw0UVRYREUySHZOeFVGS3FIaldCb3ZwUjBFVGdRa2R5YkdtK0RU?=
 =?utf-8?B?OUFrYS9pTnN0ZWpZZWNKNk5sdEM1dVdNNVgrMytYQms5S1RpZmtORmdXUHFW?=
 =?utf-8?B?R0kwOEQ2T0N0VnhPcjhKRkJ5Q2hQV0JMNEpsRWpYTGl3OFloT2NGSEJ2d0FX?=
 =?utf-8?B?NVVVbDcwMEhweUlxdVlqVnNKSG1FVHRhU214eHhFZkJqMzVVK3N1ZTVIcU9t?=
 =?utf-8?B?K0l2Ry95cmcvRVhZUENCQzUzUEgrSnJjeStSNVNGRmNFcFFpRnRMdjhDei9x?=
 =?utf-8?B?dkpDYmFOa1ZmUzExeWRhSkl6NSthd0JvMmI0L01ZRFdOTHVpMjd4MVJUYnVY?=
 =?utf-8?B?RXpNTlBZZTlvMFZmc0Z0WXZnRnRZV2hQSHJNTzZvT3JDUlpjejJtaEZ2VVMz?=
 =?utf-8?B?dWxjSzRDZDNndFljeVpjYnk3L3QvWEU3amN6NVllbDdEOStaUElvRmZ2T1Jx?=
 =?utf-8?B?Zi9pUDhUVGNJVnc1Q3lqcXFIY29NV3pOM1VkM1N1bE14eUVzb1VZbE9DKzhq?=
 =?utf-8?B?bDV2Z0RSZmpnT3h5dXpzeC9OckVhbnRYRUtXY3BzcHNnTlZWMlNQc1lxY2xW?=
 =?utf-8?B?V1JNbkV3aS9uQ1FKZE5NRlp4ZXFGbDhMMFlKU1pFRFhmemdmTHEvdS9ob1k4?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8309b02-d597-4fd6-b0b7-08dd36f564f5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 12:49:34.6345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSyga0DConQ5U6CnmHc/Mp+F3/hE33VhKGOz1O1k8/7dTOOUpbSEAfH3mjI1HVE3vGEiYkR52bx/z1SOhFaMyPGEukcq8gDjGsWAol3tUXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
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

On Mon, Dec 30, 2024 at 02:14:50PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time when executing xe_guc_mmio_send_recv() so that
> more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> ./xe_fault_injection --run-subtest inject-fault-probe-function-xe_guc_mmio_send_recv
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..ef3bbb7ec 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -170,6 +170,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_uc_fw_init:		xe_uc_fw_init
>   * @xe_wa_init:			xe_wa_init
>   * @xe_wopcm_init:		xe_wopcm_init
> + * @xe_guc_mmio_send_recv:     xe_guc_mmio_send_recv

Please keep this list sorted.

>   */
>  static void
>  inject_fault_probe(int fd, char pci_slot[], const char function_name[])
> @@ -301,6 +302,7 @@ igt_main
>  		{ "xe_uc_fw_init" },
>  		{ "xe_wa_init" },
>  		{ "xe_wopcm_init" },
> +		{ "xe_guc_mmio_send_recv" },

Please also keep this list sorted.

Francois

>  		{ }
>  	};
>  	const struct section vm_create_fail_functions[] = {
> -- 
> 2.35.3
> 
