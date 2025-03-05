Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F1C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26310E035;
	Wed,  5 Mar 2025 16:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDfkg7FJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCCC10E035
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741192066; x=1772728066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O8+AT2CDfoxPDl+Mt51Ry3Ao7atG/mUIAnZXUACTfZk=;
 b=nDfkg7FJXYgcZtqM6gKCRIIkHpE8gzzJ6hPNrHz6crjdmGoG3uOR3Zpo
 7oMOaeCI/aJ/ZNjeBxO+bVhl66yCtqElmtwKgObH77QhrblsJRKs0zFbc
 bX2vHjKUBIoVilxjSvUrPz3O5S+Zv6aACJRKp8fYc+QVligq1ITIESPrE
 +tZTB9AAjzieKx7dEVevHE0lJMwO0WbFps1ycJC7drqNSGhlDIHgWHD14
 JnWHfJLG9tcMMi8ltlvc0cPmTw72EiDrsRs97U2vf4RWKWGeJW4dtvJ1o
 illKvsEhgtgZ7xX7qWMOTnxiKJG4dTWXwSa4dI8wiB9H7si7PQBODPfdi w==;
X-CSE-ConnectionGUID: VlWPJnQcRtyFgKlv5DLP1A==
X-CSE-MsgGUID: uS4KKaQmRDK/DvV0JN+2FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53564339"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="53564339"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:27:45 -0800
X-CSE-ConnectionGUID: cFE9Dl+FSAGJApHK2KmZgg==
X-CSE-MsgGUID: n9Qp2vhWTpyz6iBpFFBw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="119242886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 08:27:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 08:27:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:27:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:27:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWLc5t+25VZaEFKSwADsDRolvcqoTefTU4ZETUAC5vJuIsu4VS5CXIHl8JGekE6hlDSy+hABXzp76At1Qy7vRxDTjnTLs9RUAD1pgI00aXuhKksm9EI4PjOXCeqOOvkgx2UnaJHYiYOxTFXv21NMmhDTXrV5SgQ/4OyIwZqLJ+AXXXKQC8ngD4rEDYl0n+OPwe6OmoydVVa+hOvcEnNIgoRke5kfRoPHlZLyy0WTcc5fVc5fVcTQKDT6FEV8BBLlDkzOCabUoC0yf8AdjrtVkOLwFQVaZYqMY4Co+ygWduOr9z6eVLP435l1POENFpCF5mZAdY9LDMcL1KsqgERe6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO8m3k+6m5/UJIMpS9nxiRN1l3bHs2EpO5sYd2AC3UU=;
 b=g6OQVMrEc9aJv0RMnrRjlA2LLaw/I6Nnk7XVtKAoWvL97eUAaViq5bQ5I1DUxEF5YBycJtszWOu+UwWgjiMzq8XqjXie9OxcAOxUHAamCfBKUYiogAh3dTSBzdftEbOZWobpv3IcOrb5VZqGtZLMfgGJKmldfttaYePjheRwFNBAFL7u/MuqdzrZHSbxSBXR+1Gdtr3u/rRbsfrzm7NSMZYRX3D3tnerOY3H+NhqTJDNuqFwYiuGiU1syvjJr1PfOrf7wTUaZCLOSW5jN3SVuwr3Y/InVaBV44R8E3EhYmPW9awUrtRA3eRy+zv4moW5GSEsUJLGHNjcqj+16MCmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:27:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 16:27:35 +0000
Date: Wed, 5 Mar 2025 08:27:34 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_oa: Do not discard single
 reports in oa-formats
Message-ID: <Z8h7dv4Vc5fCCK8x@orsosgc001>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
 <20250305005716.168646-2-umesh.nerlige.ramappa@intel.com>
 <878qpkt6rv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <878qpkt6rv.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: bd63a949-1c22-4bfc-3c87-08dd5c02a34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXhqcmlqeGc0cXYzTUQ0Sk1wQnVJUzFqWS9EWmNkdTB5YUVWR3l0a2RFWCtv?=
 =?utf-8?B?OXNOVFR5TmpwcXNITnFuUDhGSGtPSjZMVm1xN21YUGFqRjcwKzRwWXgxL2JV?=
 =?utf-8?B?MzlQY3JscURBbWd1TlYwMGdnUmwzelhaTzl1a3RpbnViWStiakRBS1lLbnR3?=
 =?utf-8?B?OS9wQWx3b2lCa0ZraHZoYU1aN0ZXU05GV2V5Vm1YalNWdlNudmREdmdSZE5E?=
 =?utf-8?B?TEVqU1pHbm9SaDhmN1Q2aFFaQ3pwNjR4SlQxSEcrV0NRcUNjSnhZL1BwYnUw?=
 =?utf-8?B?TnNSRjNaOWhOWTFncWVPWVNhWmZUQ3JtTEhObVlqaHl5RENKRkVYTDhXdHdK?=
 =?utf-8?B?dDFoUmxjenlOZzhmWWpkNTJUY216V0tYQ2M0ZkIxTkkzOTMyVUlEc3l1aFRQ?=
 =?utf-8?B?dTlxckFQcTFuYktxWkk3dUZuOTh1S0RmdVJiVzN4dDYxeXRweUhwQVNSeXg1?=
 =?utf-8?B?UWIxQUpVU0VtWEw4SkwzS3QrU1oyMHoyb0x3SjVXNWcyV2tQS1d0SzZXTHhQ?=
 =?utf-8?B?OCtUNkFrRGJXSkJlUHlsUnlWcUZCZVZXQ0JmZGJWY1JGejI4dnI1bkx6QU9z?=
 =?utf-8?B?a3pPSmUxVlloUk96ZGJLYi9Oem5HaDNSeDB3RmpJUGlKZ0ZRWlBEYlk3OW8z?=
 =?utf-8?B?V2g4UmlHQitGZlk0MXJ5UFhQWUNNL01qZlFKZ29kUWF6TUtqRXR0N3VHZlJy?=
 =?utf-8?B?WWFodTg2TC9UcWZuQVJnU25RMlFHdVBFK1BJOGxEcTROMllKSlRqbEVUVHNS?=
 =?utf-8?B?UDMzUnJXUGc0SmtiZWhFcnBJTVRoWmRIa1RNS3FFTk5oWVhtd0tlN01LVnhi?=
 =?utf-8?B?d0MrS2pkNVkrVHFVODBXVldiM0ZaNVlwTjlXd0ZzdVdiYmFBVVErWVRvc3RQ?=
 =?utf-8?B?em9va2VSUkJEUCs5UkUzcmY5NzhBOWdWM2lhU2lLVDZhZDJzcU9WV3hCUWI1?=
 =?utf-8?B?UnJtd3d5UVI5T2dLNVNlM2RmalkxM3RnajBpMVYrQktWVVJOS3NCOWQ0TUw4?=
 =?utf-8?B?OTljRy9GSklCckY5TXVCbXlDTUwzQm9oM1JrNDRnSHpOSkc3SUUvRnRnSlRn?=
 =?utf-8?B?anVublkrMFlucnhENFhYR0J3enJ6T0dRSmpRK25ES1B5VjZjSTk0QU11YTFn?=
 =?utf-8?B?UFIvcEgrcm5IQUk1bk9UcW9kOHo0NHJ1T2dFUW91aDNaZjhqTUxzWmphajYz?=
 =?utf-8?B?V1ZtcWVSQmtsZ0R3VFpzdm0wOWxmTW1wMDRMa0J1cXVjanBBc0h2Ty9jMXhG?=
 =?utf-8?B?QTZwTU9EV1hPRUplVmtQbFhIUXF4UFA2eFVqUVBLMEpRcFdpeUtZU3ZTSmho?=
 =?utf-8?B?NjB3cDN5a2hZSDRZSGJ4VCszS2tGRFkvcVZBbDE5REVlMkFWR01qZ3NnUWNY?=
 =?utf-8?B?bGREbnhCSDZ0TWF6WVNnNm5jQnZubytFWHlwYjRzUGNkdkp5RVdybWtEakh4?=
 =?utf-8?B?Zzg0SndBcFRqam1yRlJYYUV2SlFlcWhkNEd4UHRCblV4cE9BaTlHOGZMajZp?=
 =?utf-8?B?WENPVG1uUWVJZUV2c2hTcmZyZmlkZVE1UUZ3VEZiRDZLMm9EcXZ2MGRnazk5?=
 =?utf-8?B?aFozSnNyQXM0aDVrZXJ0SzlScmpnNDIyVlRUd1ZnU0FGN0FhcTdGZHB5cllQ?=
 =?utf-8?B?Q1J0aDlYaG9vZUFuVHJsTDB4RjNNbGRwVnVOUmlxUk9rY2dRZUo1aEQ3YjVh?=
 =?utf-8?B?MUZ1ZWhnN2xKSnNWOFhhSDlybVdjZlQ2L3RkWFpucm8vUjUxUzRXdHVkdnlk?=
 =?utf-8?B?ajA1clRjeDZjRUlkbnp5bG1XWWVUUjNGMnFKTFlIWk1pSUtzWUpsekJvZ1hM?=
 =?utf-8?B?VUZ6VUhVeFhNNUVaT2JrRHB5YWQ2L045ajE4TGQrTkZzTlBMbGdjVlJtU2d3?=
 =?utf-8?Q?bNm0et+FkMj0j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZTdUVIb3R4V3NoU3Zrajd5MjdZem5KUDFyWVhQcVlMU3piekJlaVhKMlVL?=
 =?utf-8?B?UDBDWFRQOXd4U09GdVQxeHZYT2paS0VRT2g5aStBWHNTQjByZVl5NE1jNGhI?=
 =?utf-8?B?cFlCdVBLbTYvdzVuRWVQd2dRajdTVlAyY1ZGcXZDb2pMbVlVbFpKVlMwSk01?=
 =?utf-8?B?S0VnUktkZDJSU1VhRCtZeXg4RFhCdWxJU0dVdWh0cWhEZkpLcVB0WllHejVE?=
 =?utf-8?B?aTE3ODVML205amg5VkJ6bUJvaDI2aytVYnM0eXFMa3l3cmdMcGQzZ3Y0OXlm?=
 =?utf-8?B?MnhXN2l1cWs4UGZhMzNHVDY4L2RXWmV0UzhBLzlFd0dnSnRuK2luY1lXc3k1?=
 =?utf-8?B?aGFFTTNqTHNUQmdwL1RGOWlqeGR0N2J5aW5KenVZeDd6VnBDeGtwSWFnazRi?=
 =?utf-8?B?ZzVjbnFITzR0QlcvSWlyU003T2xkUTNKWGFsZ2UyZnhXeGUzd0d2Wkp5UjhY?=
 =?utf-8?B?UlZoZ3hwaDB1aGFyb1I0SVpUUXpuZEdkQTJyYTZYQVpWNGFta2U5dEVYT3ZJ?=
 =?utf-8?B?dFVLaHQ1M2Y1d3FwOFZIdkprSUxnYjNCMERoaWVFWDIrLzQrMzBMeHhndloy?=
 =?utf-8?B?Y3FrcERySS93NkJBTzc1MFg2U0w5a3ozdnVCa3JDdGJZZE53dy9DaEczcjJm?=
 =?utf-8?B?R3Rma2ZtdERhNWROVFdMajk5RXBaVmxhZWZrYnBoU1hrMzBsdUVQVFJyNUlL?=
 =?utf-8?B?anVMU3pjdFRSQjRnTFk4OUZHOHV2bEYwWDhBZEE3dzQzc3g5ck1hdFIrY1F5?=
 =?utf-8?B?TVBrSFcvcDRVT0tTSjF1bFRNNFhXc0Y2bm14MkIvdE1lQXJYUmxEVzkzRlZN?=
 =?utf-8?B?N294SDBFSnl1YjIzK3UzYVl5RjhOeW1XVjdpbjhmYXJWSFBONDRCSnY3azJB?=
 =?utf-8?B?RjBUMkw0QXBNZ1AyUDNnMTNVcHUvYTR1eEE2OXJxUlBhTlpjemFaY2pyZnVT?=
 =?utf-8?B?OWdQelZ6TTRXVWxFQk1uOHVKWkFFTm5HbHRoeC9uZS9WdjBWN3VrSEJMeCtz?=
 =?utf-8?B?S09ncjgxWjI2TG4waVlWdzgzSGFBZlpDWUNRUDh5TDhZdGRpT0dyamV4eEI1?=
 =?utf-8?B?R05zbG5nNWRVd1g3QngydWVKYkZ0TjUxNzBmSk4ycmZnNTNJUGEyc0JReDhz?=
 =?utf-8?B?SkQ4UTE2cktmenJ4ZXJSUEZrNE5KWFpnNmxNVVhHZEtRN3lKdngrZTdCKzdx?=
 =?utf-8?B?WUR1bGFjMXp4ekNhanU5VkhqTEROZSs5TjdyTURzTEFkSlcwNGN2ZTI4S2Za?=
 =?utf-8?B?ZHEyMjkya3c2Z3ZONVplY0NYa1FqOWRuMjdYM1huTkhBc1BrSXhPQmNLdFQr?=
 =?utf-8?B?U25CeWJTVUlYbFROcGVmMXFsalFkazBqandvcnNOUE9WdXBhR1NxV0VJZjFL?=
 =?utf-8?B?ZXNXYVBiNDZKY0Y0eWdwbjUvSThOem5UQ24vNnpSdHF0aTlTaEJSeHh2VmtV?=
 =?utf-8?B?WEFia0V0V2tmYmNTaWg4c010RHNLeW95VndCMmNGeHBBVlJGckpNVWJWcHFq?=
 =?utf-8?B?OFBjVUNJZlNnVU14Wmh3eEoxbmRGVDhGSCtrY0pGSG85eERZZnMwMXNEY2RR?=
 =?utf-8?B?SkQrLzRQV3R2TG0vcHczWGMwbEtGNVFGUnRiU05WazJ1blJFc2p1QzVqbVNF?=
 =?utf-8?B?QWpEVE5YVDZTRlNwWmJNaG9zOVdIS3FXa21aaW1mc0FsU0QySlRzaWV6R0ly?=
 =?utf-8?B?V1M1QUViT1QzWC90b3VacGJpUVpnUGptaVNGSm1BMXhuVEtJamZFSWtvUVY4?=
 =?utf-8?B?MWN4dGdyZDc0djRjQVRtdk41eEVOempBQmpXbktYYTBqN29ISjZQQUszSnY0?=
 =?utf-8?B?aCtlaENDbG84djBFK2NmRThKaGNqVVFra1Znbm9Ecy9KdkZMSHZnUzhaSmQ5?=
 =?utf-8?B?OFV1SmR1Ulo4ZCtTUkFlSGo1OUtjOFlwVG84MG9pMUV2K1V4MWFQMFBlSGJp?=
 =?utf-8?B?VExBQzJsZnAzdnEwa2F3UXdhOUhmeGEvNU5nVmVpSnhpaUxiR3Z2RjROdDgw?=
 =?utf-8?B?clMvVHdPZmxRY3J5RHc4TVVoYjBJT05zUGgyUmgrNlJmNjQ3MFRtdzdacGR3?=
 =?utf-8?B?azEwK1RoWktJMWZlM0IwRlRSeG5oK1BuZm9YclRHMFhDQnBmTjZnclY0TnFk?=
 =?utf-8?B?N2o4ckxmMnlGcURwN0tjaVIvSzJNZ1hnbzd5RXFScVlGd0hNVnNNTnV0Vncz?=
 =?utf-8?Q?QOenXSpuWfu7tvi5EivQrmM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd63a949-1c22-4bfc-3c87-08dd5c02a34a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:27:35.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXJ8ZY2LQDPte3Jv+mBTW4Elv4TLM4WC5tQpd0CY3ig2RAzDBxsEIUFg4ANXjmKmj+Aee6ViupjQa+DUHYmBWGFr9N/q91bi770h3t5MzTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
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

On Tue, Mar 04, 2025 at 08:56:20PM -0800, Dixit, Ashutosh wrote:
>On Tue, 04 Mar 2025 16:57:15 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Internally the test is expecting a single read call to return at least
>> two reports. If two reports are not read, the logic retries from the
>> beginning. This can easily fail if each read just returns one report.
>
>OK, you mean 1000 reads each returning just one report.

Right, I will add that in the description.

>
>> In essence, many reports are available, but the logic causes test to
>> fail.  Instead, count and use every report read when waiting for two
>> reports to be available.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index dd71683928bd..e5744d830d39 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -1314,13 +1314,14 @@ read_2_oa_reports(int format_id,
>>	int max_reports = default_oa_buffer_size / format_size;
>>	int buf_size = format_size * max_reports * 1.5;
>>	uint8_t *buf = malloc(buf_size);
>> +	ssize_t len = 0;
>>	int n = 0;
>>
>>	for (int i = 0; i < 1000; i++) {
>>		u32 oa_status = 0;
>> -		ssize_t len;
>> +		int ret;
>>
>> -		while ((len = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
>> +		while ((ret = read(stream_fd, buf + len, buf_size)) < 0 && errno == EINTR)
>
>Probably never hit this but maybe 'buf_size - len' ? Otherwise:

Yeah, but I think I will still change that to 'buf_size - len'.

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
>
>>			;
>>		if (errno == EIO) {
>>			oa_status = get_stream_status(stream_fd);
>> @@ -1328,9 +1329,10 @@ read_2_oa_reports(int format_id,
>>			continue;
>>		}
>>
>> -		igt_assert(len > 0);
>> -		igt_debug("read %d bytes\n", (int)len);
>> +		igt_assert(ret > 0);
>> +		igt_debug("read %d bytes\n", (int)ret);
>>
>> +		len += ret;
>>		/* Need at least 2 reports */
>>		if (len < 2 * format_size)
>>			continue;
>> --
>> 2.45.2
>>
