Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E50D73EB7
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 06:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415C210E908;
	Fri, 30 Jan 2026 06:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn+8lAAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8810E908
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769753810; x=1801289810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=s3grXAkoFgptLsJRSrUYvW4ojaUZqDA5kL3tDIgVpBw=;
 b=kn+8lAAJg5cBXv6VYABuslS1M3QIDMuOGzfXkBKxu+BIssFnbLzCsHkX
 hbspKhFR66sSjf6ZPrrygsQkzkzKk7KUDiIgSSG8VTcj9sgV358rEfWk0
 hQqZ5uwT/woMUODvlJm17RURS2fcXRpJH1UNuNxaa6OvvxSCRpo7KVwA6
 UXtjDcj88ZclL/U3+zu28Sl1h5i+bU9lFR+McOsSpYoEVrDu2lZwYV364
 10hkOhAEWACqA7NMa8L0O9tWUUEmki4kQM8DkJcz60gwop2yk/YyPmbQP
 PIJbQUCAtd/fz4r8/ofuHSeLzUjkdk3AWORReanjRbwqvpBv7UfL7kP74 w==;
X-CSE-ConnectionGUID: nTvq4j2aRqqI4uCao5AKWg==
X-CSE-MsgGUID: MrkgeRmJTk+qxb57ixTZDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70979985"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208,217";a="70979985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 22:16:50 -0800
X-CSE-ConnectionGUID: YRb4ZQuOSZ2Bnnxst7xmVQ==
X-CSE-MsgGUID: 72YUBLErT4K8ygelkePtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
 d="scan'208,217";a="246394363"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 22:16:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 22:16:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 22:16:49 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 22:16:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jU09lJLpBIQGMmYYjpOPQU0lIr8EeMWmFlgL3pZMfSZG82UCeqJM79N0PIIiErAjErqrIFCyoIM9BLB4rlN8ul3TivVGpLDAqPYzhV2iW3A3QRz5tcXCBkBkmyrJ6y5Zxy2gy8GGqknokjF6N7O6MrKZ5PrqRzC+8YwuAWB2NqVwrdBO6lOZxnRAuRoAVPF9E4NOGYSI4TXR/kwrXE8VcXl91QQNjjw4B054DQCMifm1If1c97Sbcs7NE1JlrnC0IzTcSn/dQdTqJ5I6+Z74XYcCGfb8dV+OL5twXR+w40SezJmgFS9SBFGN5EknyYKsy6M6BIGccszrat8Wfcke8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGzj5w4EISQXDlIMzJcdiFUlFWyTkkdKujW7qbOnaE=;
 b=l3mC3pe4T/iLZ6KujIDjbhaW6LjGPHXB0pmWqyF9w44GbdUI3wBxwIRQmuT9Fbp4jP4E+riE5tLlrQk9dW73CC0pjP8+sl7R4/OrMRBXZEfJCFl9hgWjFBJdBqCjiiT8/6yR6r68EjNjYC9osWMU4WBaHuy0NKbLYlshG3z61XsM3seS+QdBbFRAxogjYYG7NtxsZA8tDnaiCcaVTL5p6S6MS32I/b2UmuYsvYlgS5H+BCirgQjhXb+4oUgjMgzFFgbLUrPiH625ar0hotIqYYxXG4LrDvEjeHQT9yyUks5QVlFuCQ8xuR0pl5DNP6pUvmdCRIQcPrC1QODYyG0+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 06:16:42 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 06:16:41 +0000
Content-Type: multipart/alternative;
 boundary="------------6AH0DJeg0VSliYGOrqcMcEcG"
Message-ID: <9073233a-42bb-418b-bbc8-766619d5fdb0@intel.com>
Date: Fri, 30 Jan 2026 11:46:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>
References: <20260123183556.1649959-1-karthik.poosa@intel.com>
 <ca032654-19e4-4f22-a775-b0906aa852f8@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ca032654-19e4-4f22-a775-b0906aa852f8@intel.com>
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ1PR11MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3559a667-653b-4dd8-8b82-08de5fc72287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2JPWVVsb3lrc1MrNW1GbnZKNkNXS2E5Y3pWNFBaRDNQeUlxN2lBcjA5dkx0?=
 =?utf-8?B?U0ZhNndwcWgwOWlPcXpZblFPV2dsQm16UUYzaGNSNEY1Uk0rYWFqVWFqaytL?=
 =?utf-8?B?OC9mZzd2WFVtd24vWXU5WkV1dkttajdOSGVyWGlpOHR2VExqRVpWeEI3ZnZx?=
 =?utf-8?B?eGZNbE0wUGdoemJVUjJzMUxTUFd1Ym1hSHM0OHNKeXpZUjY0TGs4OFhYSzAy?=
 =?utf-8?B?c1luSHEvd0o2ejRLVkNkcUN6cGpPNnpXNFRSTjFkeFVTdGpOa2pLVm9IZVFD?=
 =?utf-8?B?QTdYQ2RtTk1MYURzUXVQVWpMK0d6UFRnUW1iLzVmTFNuYXhNSXJoUkFYbTgz?=
 =?utf-8?B?cGkwMm1ZZVVOaklldWZsSHVpN0VMSURqS24wK21oblBIQlNjYVVmMFFlV3I0?=
 =?utf-8?B?YjNhNWJ1NHR5NGJlVkJqZHUySUhObUsvMys4Uk5QNCtLV1F4dURsQzNqOTJD?=
 =?utf-8?B?clp6YjJGVW1mVDBMV1VnbzZlSG14OThiNnJoYlBxUG1KRVFFR2NBMFQ0QVNs?=
 =?utf-8?B?M1NvOUd0L29CbW0rRUJ4d2J3cGRmMHZHRWpDb2VoWUhNUlM4b0RYbFNrTHg4?=
 =?utf-8?B?UXZCWmpDenRxaEwrSFVaVXZrOThZWlV2dFBSbzVuTDRuaWpoOE50eDJ1YnVD?=
 =?utf-8?B?MFdPT3hiZDVMV2lUSENrTjdxdzlhcHV5YjMzY2VVemJSd2d6Q0h4YUFKeWpX?=
 =?utf-8?B?aU9UZFFIazJQc3JSZGhvbGluTkZobnNDeTFhYnlTNWNMVUM3a1hIcVQ3RkN5?=
 =?utf-8?B?U0xqd2laMHBNMUMrVEdqVXh1RTFqZUdiMlFIUEVMK3UrMjZOM0ZuWFFnLzhM?=
 =?utf-8?B?bVVxcStHdG1lNmEzbnlLVnlCMk1qZTRKM2U1RmtzZVdjcmZVZ3M3VjJUQ0xk?=
 =?utf-8?B?ZUZjRVh5Wk9CK3Z3aWpWZXFFU2RYaVRiR3BQazJzbFlOaHBCc2pybTg2TVZF?=
 =?utf-8?B?b1V3ZUtKZkJTN1pCckowQUpCVUxJRFZUcGVKN212a0JaRFpPYThKVkZ4cVh5?=
 =?utf-8?B?TjFJeVlUbVFmVDhlTHA0R0ZiMDBVOVlKcXI3Rlh0T3RnamNaUGxzWElFeFF5?=
 =?utf-8?B?aGQvYktJTWJwUlByNGU3bCtKUmMrUjRkMGJ4dnJRWnBET1AvZGd3cWwvZ2E3?=
 =?utf-8?B?NU5XYVRaZml5ZDNuMGJyMXJPQTJoaElTQnkwQUpOd0ZlbkZ0Sk1sL1ptZVhJ?=
 =?utf-8?B?cEJpWlVDWVIrQXVYV0hYWlY5cVZMbk1ZVExhdys4SGxFaGNaVEZWc3l6SElI?=
 =?utf-8?B?ekNLSnBPYmcrYVpsVzdOY2VqelAxL0o2c0pJbVdoQzBqdjdvandvSUpvc0xx?=
 =?utf-8?B?eTR0KzBrOGtoRGp5a1U1OUdtS2h2UUFtWFY4T0lXelROMElMdkYzQlBiZnlF?=
 =?utf-8?B?WitWem90YUp0Vzl6M2VseWlmaFl6T1V0eFhJTFFlUFMvdG9MdnlQSlpBbU83?=
 =?utf-8?B?VUFHakpqZkV5OHpqZmdlVWI1dnJ2V3dsaTRlcTJoeGhmYzgwK0NpMExjNFZD?=
 =?utf-8?B?OUNzME5kNUpsdmxJZDlWRlpwQjhLVG04QXFYbTNHYzZTWkRrWHVPVnRHczQz?=
 =?utf-8?B?eElvOUhsRDF3bmdacDFyVEk3Znpkd2VCMDlNWGlIR1hYSDdsTjZUS0hBVitV?=
 =?utf-8?B?akxsODJlUGcyUm8vWjZNZ2xCb1cvY0RjRk1CTmthMWsyZGFLeTRsdUZmdThK?=
 =?utf-8?B?WUJTM1VjdzRsYzN4dHJkMzU3TXNWak9OVVR3MlRRYklINEdtamRucXBEVCt1?=
 =?utf-8?B?Z2J4SEFieVdlR0RCN09KMGNIQTZOZVV0S2ZqRjZuRERlMWltekhmMWlCSWlF?=
 =?utf-8?B?TWNNOXFMdzJjWExOa0J5N3k3WnpVdzBwb2I4R0tNdVQrb0VacGQ4NmM4dTRZ?=
 =?utf-8?B?NmZOZ2kzWUhJVFFUcllOK1gwcVhIZmdTRDh5WXlaaUVRNjJheW0ySVhwNHVl?=
 =?utf-8?B?OFgraXI3RU1oeGpoMXdVeDlhdWRkdDdBa3F2aDBrYWFlejdOdVZISlpoSkZ5?=
 =?utf-8?B?bUhWcVdlTzFCZjBPNzF6aUZKWWFDdEdjcmxoTHZaNFBsRDdPd1ZKajBObG5w?=
 =?utf-8?B?WVlRSUZ0ZHdnM29TcTJVdnM1YXJ3clBlUWE5N2ZkeVpHYm43UXhWSUlNSnRM?=
 =?utf-8?Q?sQ2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FXN241TDRLNEt3NDlIZ3ZLLzhyRUdoWUVWeWVsMmJNcFJiUEdjbFhxUDNV?=
 =?utf-8?B?MWhkamZnUHc0VXBtR2gvZWx5VVA3UG5XakRrc3lVenBLNExOKzc5L3VLY242?=
 =?utf-8?B?STk3YjZaeVBQUmF2b2l0YVpibHFsQWM4M3Z0TWlkMzUreDRseHhKaUtSbkNZ?=
 =?utf-8?B?cnJqdldCNk5hS2lKM2ZRQmNzNXg4VzlHRHBsZlpnU3FxL3UrTWVzdUlhNGt4?=
 =?utf-8?B?cXBweTVIM0I5SDRFb0RSaVZsUzIrdkprL0N1YkR5bkltRDRCZVUvWTlOQ0s2?=
 =?utf-8?B?TUJFWFR0eVlxZXRHcHVsS05PUVNpemp3bCs1dTRRYmplRzBYU3JId0RWODhF?=
 =?utf-8?B?Znh6MEcvWXN0cTE0akdqKzRhMFB4MFBxWUw4V2J4TjVVU0s5RGxTc0FIcmVi?=
 =?utf-8?B?T29vY2JCcWhISHRDUy94ZU5nVUV3eEtxSDJNOUp5SE9FbDRROHRHWHFhUG9I?=
 =?utf-8?B?cDZiV2hkTUxCTnhNOTlKQjJBY1cwU2JoYkFrcWNpZ1RaZ3FBbjVvU2QyRFA2?=
 =?utf-8?B?MjhFdjZNcGlhYjc1SG9zUCtZckVSQU91SDQ3T0hOa0ZXTUUzU1NNNDVwR09K?=
 =?utf-8?B?TzJ0OWNjNjdWb3c4NVRLekFqS1p2TThFeTJtT3pFd1dveFNpaTBkVm1WMlVO?=
 =?utf-8?B?ZTJzYzNLbHRoN1RkbldHZUVXL3R2cWE0alk0OCtEZnBvTkp3UTVJMzVIQUUr?=
 =?utf-8?B?MTB6OVBZak9vSS8wMXIxM0FHOExMVExzM3FXYVlsSVF0aTVHOUI1WmRUV0cw?=
 =?utf-8?B?Q2lQekYxRE5kaTR5V1FHV3IxZE0xUWJQUGdOZ09sUDRLMWs4UjV6aVk5RlZH?=
 =?utf-8?B?M1BsL1Z1OTNxTHAvZk5YaVZIck9wU2EzUEZjUlc2b2pDWE1TYUh2N0FldEVn?=
 =?utf-8?B?Qzhyc3BOTDYydU5oUWtuTjVkV3doKzNzYU1OWmZocWhGcFlvS0k2TENYVWUx?=
 =?utf-8?B?bVpkUU1uMGFyQUhWSmhZLzFyU2x2MVFVeVNBMzlTZFJncncyU2pRMW04djY0?=
 =?utf-8?B?aGlLWUdRQTJxbnNxTFYxUllTN2hLOTVoak95QkhRL0VHNUNwOE4ySTkwR2h2?=
 =?utf-8?B?K09sc2NmL1ZMemJvNnpIWGJrcDBqNTBaekRjVVBCWGM1b21SMHNUazQ3SElu?=
 =?utf-8?B?WDlsTXVpSW0vRTh5N1FOWlJvVXJBbzRYTXVKNklzZXVkRlZWekQvMS91UVZ4?=
 =?utf-8?B?WGlkMkpLY3dIdXNVSndoUksyakhxaitUVDd3WW9CRGt0MURYd21EMFIvV01x?=
 =?utf-8?B?NU8rUEhjUlA3T2FUWFJVcm5SR2ttTXlVREYvcm1iclpyVDB4L0EyZ3FOU01t?=
 =?utf-8?B?ejZtcXR6Rk9VTzRIYTVhMVk1UlBrclh0TVU5THNZZDBzOC8xMFNHR2lxaXJh?=
 =?utf-8?B?SXM1TXoydmRJTkJESGFsSVZWUWtzbTNNYmJiTjNPYkgvcERiR3hOM2VDODJv?=
 =?utf-8?B?YUQxWXhibWdYZFlmcm83TDVMUjJkM3ErYjlmVlg2bWNTYXFTcUtYWHVkY0Nu?=
 =?utf-8?B?akt5cVF6TXd5QWJMeGRQZDl5Tld5a29HZUlBS1o4NzZ5Qm12eEFURWhmN0kz?=
 =?utf-8?B?ejR6cU92Nm1vN294YlNVSGxJVXBtL0JrZWx5Mmd5TDFmejNHdVBablRBMlh4?=
 =?utf-8?B?Rm1hWjJpZ2NaSjVOZkxlZHA3cGtxdzJYKzNRQXZPTjFGSmxMY3BSWWVlRHpk?=
 =?utf-8?B?VmZvZHE3S2xrMFhkdkNtUUJ6d3lqNWdvOVgxS202TGRDRXNCRTRVQjNvdGdh?=
 =?utf-8?B?YnZOcDRMK2VKbElnWVAyeHNXcXhJNmZadEYzc1hVcVJKNjJvNkt5U09MejJ3?=
 =?utf-8?B?WStVUXo1bGxENlNkc244ZURjQlU2WmROSm0vdGFKZmFHNFE1WVRFemxGQ0Vi?=
 =?utf-8?B?Q3lCMnFWVnhyaUpuVDZLamhJeDYyWWcycG54M1VEakhrQlhEWnFRZmQwWTFm?=
 =?utf-8?B?NHNibzBMMGFldHBYbjd4YTdqSk1kVDhRTzlTa3lydDZ1dGN0N0Y4bXUxbzln?=
 =?utf-8?B?cDlGaTlERnZHU28zeW5iMXJXWWNkQUswUCtST3VPWmdhUFExcy9VTzZJeU5r?=
 =?utf-8?B?MUw0MU12ZUJ4aUo2QWNSRDYvdmtVTkQ2a3RRbzhoY1QySVdibmpnemhuUmlu?=
 =?utf-8?B?Wk93ZWk2R0ZIY3VJZVEvS1l5eEtWR1lZbUxldVNZOXU3cjduVWJmUk4yajVM?=
 =?utf-8?B?Tm5YdXJWL25qNGYxNVFwVmRCMDZvVDQwbDVTR0pGZ3lUSUJyM1BRdDAxUU1R?=
 =?utf-8?B?L256MFhxNW1pMWs5UnJwZGRyOGNGRDEzNUJna0M3aml3TE5HU3JtaTFGZXlR?=
 =?utf-8?B?TStjSEdnWjJrSXVxV3lVWW8zM3J2MDJuK2x4dGRuNkFZYVNXYmIwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3559a667-653b-4dd8-8b82-08de5fc72287
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:16:41.9468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BCUH6MQy1IQhyjev2HyKn6rOE9TvEqVBMjSZHfiJD1/KrpbIGJ34mrkvw99anJsdkDAkhKZ4mRY857ascPM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

--------------6AH0DJeg0VSliYGOrqcMcEcG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28-01-2026 16:07, Mallesh, Koujalagi wrote:
>
>
> On 24-01-2026 12:05 am, Karthik Poosa wrote:
>> Improve hwmon-read test to check if current temperature
>> is above critical temperature limit in hwmon-read test.
>> This will help identify any thermal issues with the
>> setups during test runs.
>>
>> v2:
>>   - Address review comments. (Mallesh)
>>   - Call check_temp_is_valid() only for temperature hwmon entries.
> Please change check_if_temp_valid() function name
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
>> index 103ae69cd..9deb48a00 100644
>> --- a/tests/intel/intel_hwmon.c
>> +++ b/tests/intel/intel_hwmon.c
>> @@ -26,6 +26,28 @@
>>   
>>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>>   
>> +static void check_if_temp_valid(int hwm, char *sysfs_name)
>> +{
>> +	char str[32] = {0};
>> +	uint32_t cur_temp = 0;
>> +	uint8_t ch = 0;
>> +	s32 limit = 0;
>> +
>> +	/* Get the channel number and sysfs entry suffix. */
>> +	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);
>
> Buffer overflow when string length more than 31, we can use 
> "temp%hhu_%31s" as defensive.
>
maximum length of hwmon sysfs attribute is 32 Bytes

See: in drivers/hwmon/hwmon.c

       #define MAX_SYSFS_ATTR_NAME_LENGTH      32

So existing 32 bytes of str should suffice.

> Thanks,
>
> -/Mallesh
>
>> +
>> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
>> +	if (!strncmp("input", str, 5)) {
>> +		sprintf(str, "temp%hhu_crit", ch);
>> +		if (!faccessat(hwm, str, R_OK, 0)) {
>> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
>> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
>> +			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);
>> +			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
>> +		}
>> +	}
>> +}
>> +
>>   static void hwmon_read(int hwm)
>>   {
>>   	struct dirent *de;
>> @@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
>>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>>   		igt_debug("'%s': %s\n", de->d_name, val);
>>   
>> +		if (!strncmp(de->d_name, "temp", 4))
>> +			check_if_temp_valid(hwm, de->d_name);
>> +
>>   	}
>>   	closedir(dir);
>>   }
--------------6AH0DJeg0VSliYGOrqcMcEcG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-01-2026 16:07, Mallesh, Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ca032654-19e4-4f22-a775-b0906aa852f8@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 24-01-2026 12:05 am, Karthik Poosa
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">Improve hwmon-read test to check if current temperature
is above critical temperature limit in hwmon-read test.
This will help identify any thermal issues with the
setups during test runs.

v2:
 - Address review comments. (Mallesh)
 - Call check_temp_is_valid() only for temperature hwmon entries.</pre>
      </blockquote>
      Please change&nbsp;<span style="white-space: pre-wrap">check_if_temp_valid() function name</span>
      <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
---
 tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..9deb48a00 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,28 @@
 
 IGT_TEST_DESCRIPTION(&quot;Tests for intel hwmon&quot;);
 
+static void check_if_temp_valid(int hwm, char *sysfs_name)
+{
+	char str[32] = {0};
+	uint32_t cur_temp = 0;
+	uint8_t ch = 0;
+	s32 limit = 0;
+
+	/* Get the channel number and sysfs entry suffix. */
+	igt_assert(sscanf(sysfs_name, &quot;temp%hhu_%s&quot;, &amp;ch, str) == 2);</pre>
      </blockquote>
      <p>Buffer overflow when string length more than 31, we can use&nbsp;<span style="white-space: pre-wrap">&quot;temp%hhu_%31s&quot; as defensive. </span></p>
    </blockquote>
    <p>maximum length of hwmon sysfs attribute is 32 Bytes</p>
    <p>See:&nbsp;in drivers/hwmon/hwmon.c</p>
    <p>&nbsp; &nbsp; &nbsp; #define MAX_SYSFS_ATTR_NAME_LENGTH&nbsp; &nbsp; &nbsp; 32</p>
    <p>So existing 32 bytes of str should suffice.</p>
    <blockquote type="cite" cite="mid:ca032654-19e4-4f22-a775-b0906aa852f8@intel.com">
      <p>Thanks,</p>
      <p>-/Mallesh</p>
      <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+
+	/* If entry is tempX_input, check if it exceeds tempX_crit. */
+	if (!strncmp(&quot;input&quot;, str, 5)) {
+		sprintf(str, &quot;temp%hhu_crit&quot;, ch);
+		if (!faccessat(hwm, str, R_OK, 0)) {
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, &quot;%d&quot;, &amp;cur_temp));
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, &quot;%d&quot;, &amp;limit));
+			igt_debug(&quot;current temp = %d limit = %d\n&quot;, cur_temp, limit);
+			igt_assert_f(cur_temp &lt;= limit, &quot;current temperature exceeds limit!\n&quot;);
+		}
+	}
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de-&gt;d_name, &quot;%127s&quot;, val) == 1);
 		igt_debug(&quot;'%s': %s\n&quot;, de-&gt;d_name, val);
 
+		if (!strncmp(de-&gt;d_name, &quot;temp&quot;, 4))
+			check_if_temp_valid(hwm, de-&gt;d_name);
+
 	}
 	closedir(dir);
 }
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------6AH0DJeg0VSliYGOrqcMcEcG--
