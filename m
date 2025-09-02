Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177ACA1007
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 05:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628610E192;
	Tue,  2 Sep 2025 05:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpc+FCQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3510E192
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756791872; x=1788327872;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QIkDxkiyrhg09wvbkKSEofEZ/sOICfDjQ5HDVNLvglk=;
 b=lpc+FCQqoxnJq78jPVrZh+51T5nAaDSSZR4aWaz4zhS0KHgnCB7FQrsf
 +mBNz8o2E6n4n3d4zExduBtdtnk5QUqcOS4psY06YKLyQPK80GGPJwXMr
 jkS/c2wBmpIDYXMC0LsSF4OtTWi5801aNA/8fw6VPYAbG8koMs6SmZN+z
 zhXWDKFFB9mM1jOt7E2uyK03U/s93XgaNgJC7YRlVMV779MlhZoGVNoV8
 QHiEAJN4tLlNi7KXteeYrO9GNyVGnNyhKFBCKaDk6rPpO+eacYt0mIQ+D
 gYOvNc+K2UoIgK9wBU/xwrNOxdok60la1bRyOWr6t0oLtuf1itktb268P A==;
X-CSE-ConnectionGUID: 32NjkpeBT0ajL3uQYtvslw==
X-CSE-MsgGUID: nTwvxFY0Toue/1zJmaIEqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61686502"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="61686502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 22:44:32 -0700
X-CSE-ConnectionGUID: epGA/LP6Sg6nwjEnPebg4A==
X-CSE-MsgGUID: 9VMIP96lRxKHfdPQ4bE3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="202124360"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 22:44:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 22:44:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 22:44:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 22:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmntaFrLmkxjzEVuU469aR49+g+vEl6wxAUvSP/5mEYIXOHs+78mqKLStG1DggwGqdwUSAKoXMTMkrfroDJmZdXvYBlfbalgX+xPr+GElYGpKjqFx4xfnGcsqdSL55XuzcNy6M9AyqdsiUjaTW/cVncGYI/2A6Em5W1ml5gvdYThHqrt3i22fkdlrkg8Q9/41Cgc18fvYkY29mc8IbFcfqNGDXgRK3qtvRFuMs+K3E0V8F4TmrIIcgVij2NIOhdmZKIAbIm5NS9EOFuk1q/whBn4LQrjlgDddEusGk4GCi4NmcdJX6zX9Lm84iTx5+e4MGRVHvIrGzBuof6blzkJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8w0Im7k3jfXta4ckAVtisG430FPXAkh2ltNzbh8EDw=;
 b=ePjO2UopdDAXlHXP9lN+JN5mIzB23WwnJhu8qG9hhThHLrWms95gjnY1FnuI5Mv7/eIelatzMIOfIzWI72Csnx9SlZmSVALRTVubotK+FZXZrXuKxDcSUt4XzsLSu3w6lmwD4Y6J0s7bdbBoSHHsSZWsOdj8z7NIsXLvjMO7DiwAjJVSzuZbqsv4z62dWFUIXaNkpBv44tPgIUVEjdI1t58Cjrk+/cVuIKIhaUl80gOGO4guyLa3QcbjAH9N9Oi7g1FljVhlcDbPJx4usz+K8tGxNrV1DW9qzsMFVgdivtblGak/gXjXKAFXPF66Zxgy/RwcOefvA5REOReyrF3SAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 05:44:29 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 05:44:28 +0000
Message-ID: <4550c9cf-6c5d-404e-909e-ab01011f3f5a@intel.com>
Date: Tue, 2 Sep 2025 11:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 3/3] tests/kms_hdr: Handle HDR panels requiring
 DSC
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250828093913.1630962-1-chaitanya.kumar.borah@intel.com>
 <20250828093913.1630962-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250828093913.1630962-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe608f5-69b8-4e05-95b7-08dde9e3c84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWt5cTNCdVR2M2ZFNXRZcjh3aWovdHFQWlpTdjJhQ3kzWUxNWUhVbStvZ3FV?=
 =?utf-8?B?UnpEVnNHUWlRQ2dJa3lCd21RWnVEMW14WjAzalJQUlhsc3JiMmNkWmJ2Q3N2?=
 =?utf-8?B?Znh1VGZtTDFpTDI0VkROLzB3MUdCSlZoWmRhWXNkbXFnQjhEM1poT2hNR1ho?=
 =?utf-8?B?dDRNQjEwc3liU2ozL1paVzBiaGpKK3V1ZUFLdW1pVFBiRklTaWY0amlBNFBm?=
 =?utf-8?B?NjIzODRHYVZBNFM2ZStOMm1SY2NZdnV3V2E3SDliQ1hwTlRwdUpkMnZVb28z?=
 =?utf-8?B?R3oyaThOOFBiRDBENWNHaEx6cDNOckhTd1E3VkJyRFgzbktwL25IWGo3RXln?=
 =?utf-8?B?VjJpbU5PSmxKeWR0dm1ZR0s5WlI1YnV6R01xUEZiUm41cnRCTHZPTjFPbGNz?=
 =?utf-8?B?ckcxRmpMYjRNZ2d1MzBQUUV4YmVNM3BxZ21jVzdtZ25Xa3UzYjNvZXhtREhV?=
 =?utf-8?B?MTdRQjd5VFQ3Q1FPNzNGU1FkeFNhalFYVkZSbzgvRDRuRFFqMEFud2dzaUdN?=
 =?utf-8?B?YnVYcXlwVmM3Ly8zWndvZGNsTUc4NHoxVGNPSGxCaDFub1NNeWtXbFRwVG5G?=
 =?utf-8?B?S0xDTUJQYmVzbzRQS21RVm0ybU1FSXk2QlNDYlkyc0szRzhGNjBkUmxYbW1B?=
 =?utf-8?B?MFVuOVdQT09DR2Y3Y0pORFlLM2dEaGR4ZlFUNGZFRXVTeWVpbkhybXNiOGFK?=
 =?utf-8?B?MnQvcngyRHE0UE5sUDFEUlFuaU9yV2VueVFObTZ2WXNXRlZGaDZRc1VJcTBX?=
 =?utf-8?B?dFpUTVNHR3RlSFF6TEZKOHUxOWhXOU0wMENjcGREdERVQkxWRjcvTXR6dlJZ?=
 =?utf-8?B?OTZhd2JQTUZRWFB4YWVkb0FSeXd6ZlV3cHdsVXR6cFl1Mk9GNUgxc1FsK1NH?=
 =?utf-8?B?RjFOVjR4WGwwdTZ4OTJwOWxudFhETHBiSWZSQmpWRkdqYzdRS0tvYW53aXk5?=
 =?utf-8?B?bGVsY0FuRkI1UmpJSHVwWkYrbTJibnlrUzUrYmJ2WVB5c1FVTlJGdExPU3dM?=
 =?utf-8?B?by9jeHU2WWxSenlKcDVLaHJtaUx0YzZ4aFZGRnlOWlBFbG1LbzhjaDVVdkpn?=
 =?utf-8?B?Z0lmUXhicTBUaE85clVpbHJyS2ZJOTFiMXdPSzA0bS9GV21qaXBKamxSZDVN?=
 =?utf-8?B?dHpnUlRzVE1SSTJaMXNWVjVPLy9rdTZOUUd4b00zOFBFV0gyMDdzWjFKVitM?=
 =?utf-8?B?Z3EvbGNSN01nUWRPM0RHdnY2VGxQd2JnRklTR2tmMDhBekhxOHVhdGNHeHFj?=
 =?utf-8?B?eGdaNkhZSVNFQ3RBb1MvQzlHT1hITFRkcjlKVytvVStqT0ppL2Rndm5WZy83?=
 =?utf-8?B?VUVvMVI5OVl1SzV4aitqaHQxN1hQVitYZkh1OFM1c1JwL1MxUXpLL0FlUmkv?=
 =?utf-8?B?dUhrN21oeUV3MUtjZE1EYytFbVdMTnR6MVdsWU91L1pMYStQN0tnTjFUalpF?=
 =?utf-8?B?QTBLT0F1d2hHdFEzZnEvWlRKUWlSZEVYOHhMcDBUZjFUMnNobEJmQlBHb0pa?=
 =?utf-8?B?emJOOWFUQTNqSUx4dEhCbEZNSy9vNUNBQjJWaWE1UkorN21hYWxpbm1JQXFp?=
 =?utf-8?B?OVp2RWN0UFg0cDJlWFNvckFUaXh5NWdDUTVlWFc1VnM5L3J6U0hhdzRvSEIx?=
 =?utf-8?B?enRNdUcxeWkxUE1nWmduNk84d1Q4WmU3QlRqNFc5bkhNdWVRMzVZOCtoV2M1?=
 =?utf-8?B?TG1lakR1K2NrZkpuYVpyUVNtMjl1N3lTQm1tanlSNnlZNmlBVnNRVzMxTGg3?=
 =?utf-8?B?ajRCSGRua01nNW5aWjdFT0NJTlEvZkRaZzUwZytiNCtnaDZZRE9US3VCRHAv?=
 =?utf-8?B?bTJyYXc3QkZWSVY3Z05jRmZoTXFUbWlldGk1b3E3eHRNU0M1d0hEdjRpNFNG?=
 =?utf-8?B?eTJQLzRId1pxQlh1SmtkVy9yWWxad1JUTVlCOFdoaGdqMnJwNHZ6NUlIYnls?=
 =?utf-8?Q?5/CClp5bfd8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRLZnZ1OGRZYWxyNEM1U3owZ0ZxZktSVy8xbEU3SDgydHgybzVFNHhCaThl?=
 =?utf-8?B?Z3NKVVRDR2Y0dHhSc2N6QTZnMXlORURjOThqN0tIRnZmd25SRkpBRXowVWJ3?=
 =?utf-8?B?UTBtLzVHQ2FMREdtMFQrNlZtUXVZTDdybUxacFc3aEhPL2YwcHdxSG4zQlhL?=
 =?utf-8?B?WnQ3SngrRjR5eVVzb3llaXhtRjdncndQT04vOHJtQ1VqS0o4Tk5QdmswYnNB?=
 =?utf-8?B?R0svcFdVempENnorSnFYM2kxT1dkUk5Ndkt1dWhxaTZFMVhML2lmWk1LODZp?=
 =?utf-8?B?ekVSWnBpV3ZVMHl2WWdYZVJGZk1LUVAxZEdiYko0V1NSRThLZmZycWp5Mmll?=
 =?utf-8?B?dUxSVTlrREIwSU5BdjFxUTJtd2hWK3V3eUlzOXJCMGszL1hIclBsZ2hpNzdh?=
 =?utf-8?B?V2pNWjdyZy8rWXhHY0hydDVFcHltTTlOVHk4Q1QrU0VlcVAycDNtOCtDelJC?=
 =?utf-8?B?bDVHcklGeVkvMlFVbkYzcmU5dlp3QnY3OXVBaWdLTjRGZTN6R3RUN0ZXUERR?=
 =?utf-8?B?R0J2Ujl6b013VmdSdEFCVHh0WVRSZ2xRc1lIblloV21FL3d0TTgvSmUzaDNC?=
 =?utf-8?B?Rm95Q2FmUFBlVHU4cUUwSWx5NDFJRW0wWFpWNEc2NkFncUNGQXZhN1pCRDcw?=
 =?utf-8?B?UnQ3MTJ6bi9Xdms2ZDJZbkc4Uk9uTEEyOU9xNERuVkljV1YvQ2hxR1VuYmJt?=
 =?utf-8?B?bTZ4NExodkF0ZnpnYUd4c3FpVGhMYjRLcWxGTzNiYkhEdVh5akZpNjduZW9t?=
 =?utf-8?B?dUhpRTkzci9HRm50Z1MzeTE1em1yYU1GQVgyLy82ZmVRMEhTelJMcm00dWYv?=
 =?utf-8?B?RFg4NWNMR2pCRDlwWENqWXBIMFNaZUp6azVvYmg3Rk55ZW55djRaakVaekJF?=
 =?utf-8?B?ZW5Sekw2N1J1QVVuZDFqZ2pmNWxSN2NPbElkUG8yQ1llT2EyNEZidVlGUnpo?=
 =?utf-8?B?Nm91YTFzNnJkRFdzWHZ1cEJkeGtyenFDaVY2cnVhdC83NEw2eHh2SnBDZHpL?=
 =?utf-8?B?NnBucHpkSFR1WndoUVBnbnFKSklQSWxmYWxHMVRtUzBiSHFNVUtYbUFqY1FT?=
 =?utf-8?B?dklqUEpvRzM5Zm4yelJ4QUNxelA4Ni9UTmhZRmtpMXhtVGRWRTZ3WEpjVjE2?=
 =?utf-8?B?cjZTRHcrNWk0YjZiaWFpSXJoNW80K3ExMXFhZzhCUlVQKytBdnJxN2puellh?=
 =?utf-8?B?U3QrUk5TZm9zazBEOXBpL0dVYm9DN3FYOTZPUXloaFVOOXRYcGlWeUEvQm92?=
 =?utf-8?B?VVFUSEZOWjlTWnhYN0xkUklubFJ4bHBKVUxhTzg0bnFSOEQveWM2MlZjeVUv?=
 =?utf-8?B?SDc0TVVmYUlNUU01Qm9MNDFobHl0UU9lQnJjNiswbFF1V3BFWlRJak40Rmk4?=
 =?utf-8?B?MmtJb2ZNK1I3dVUxODhINEppemRHMVRTRFRvdXBSaEpHRzduNTFLUzlHZzMr?=
 =?utf-8?B?cDBaWDZCU0NYeGlKWEJzbFZINjB3bG96Rjh3ZDY2N3A3Y25ZTEZYMklXbnlZ?=
 =?utf-8?B?QldEaXN1TGRNWXJnWnk1c1FwRXdINFpiZTdSVDdnL2ZhUXBPOXZrSzFaTjA5?=
 =?utf-8?B?aWIvZVROb1NGY0tYT0paZE96YlRhak5zRTNXRTdwSjNENVZmQVR6N1NUeGVI?=
 =?utf-8?B?SnhGNTZpUGtOaE5tQTR4YzVTV3RwczdVeWZzQlVpMWJueGdaUEF4NlA5Ry9Z?=
 =?utf-8?B?VkQ2ZlRDNEtGK1J2OUM0UllnWFhhVmtpU2pqdWlEaS9FL2N3ZVdnUWJzNWw1?=
 =?utf-8?B?KzZZQU84QlRlRC9aWkMra0F3Skw0MXRkeFNkWXRuVlpZK0dwN1RleWY4Snlk?=
 =?utf-8?B?WGJjbWoxaVRVazdCdFZzNHQzZlZpYllEVXB2dGczaE9XWUdXd0hkUFhJOHAz?=
 =?utf-8?B?Q1oxSm9HNnEwYVlIVm1Pa0w1WHNFbms5U0VmQXVhSjZQM04wN04ybzRPdGFW?=
 =?utf-8?B?ZDNJUDh3V1liYWpNYlF4aU8xa3U4KzFSTlVraCt4WGRPUDlXT2dSYWNaY0JC?=
 =?utf-8?B?eE5ma0lwQ3NCd3ZrQ214SUYrdFF1MWZUMnVEalNhV25YdjZGVUNDVEI5RE0z?=
 =?utf-8?B?MmNVdDZGbElOQzAvK2lXTDg0bENrYVhyV01RNlNDNUFaNWlyc05UN0VFQ0Vu?=
 =?utf-8?B?V3REbXlaUE1jYzdFWHlxUnpjUG9icWp3NEFkMXJkWXIzeGZLRElrK3NQZWJ2?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe608f5-69b8-4e05-95b7-08dde9e3c84c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 05:44:28.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yp5rJgYMFNclcea5mNTJtYdFaK768GZwfQK9nnaoIJq9RFQEu5/mgo5yXujXdXDMfFOO9WDkEu+xvRWZNrYIyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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

Hi Chaitanya!

On 28-08-2025 03:09 pm, Chaitanya Kumar Borah wrote:
> Some panels needs DSC to support HDR (at least in higher modes).
> In cases like these the output bpc and crc comparison fails if
> the SDR/non-HDR mode does not require DSC. Therefore, force DSC
> when in SDR mode so that output bpc and crc can be compared.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 41fbf3766..efa5964cf 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -97,6 +97,7 @@ enum {
>   	TEST_INVALID_METADATA_SIZES = 1 << 4,
>   	TEST_INVALID_HDR = 1 << 5,
>   	TEST_BRIGHTNESS = 1 << 6,
> +	TEST_NEEDS_DSC = 1 << 7,
>   };
>   
>   /* BPC connector state. */
> @@ -491,9 +492,20 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	set_hdr_output_metadata(data, NULL);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>   	set_hdr_output_metadata(data, &hdr);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> @@ -518,11 +530,22 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
>   	set_hdr_output_metadata(data, NULL);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   cleanup:
>   	test_fini(data);
>   	igt_remove_fb(data->fd, &afb);
> @@ -558,7 +581,7 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
>   	meta->hdmi_metadata_type1.max_cll = 0;
>   }
>   
> -static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
> +static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, new_crc;
> @@ -577,9 +600,20 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_plane_set_fb(data->primary, &afb);
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	/* Enter HDR, a modeset is allowed here. */
>   	fill_hdr_output_metadata_st2048(&hdr);
>   	set_hdr_output_metadata(data, &hdr);
> @@ -602,6 +636,10 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	else
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
>   	/* Enter SDR via metadata, no modeset allowed for
>   	 * amd driver, whereas a modeset is required for
>   	 * intel driver. */
> @@ -623,6 +661,11 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	/* Verify that the CRC didn't change while cycling metadata. */
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	test_fini(data);
>   	igt_remove_fb(data->fd, &afb);
>   }
> @@ -722,6 +765,11 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				break;
>   			}
>   
> +			if (igt_is_dsc_enabled(data->fd, output->name))
> +				flags |= TEST_NEEDS_DSC;
> +			else
> +				flags &= ~TEST_NEEDS_DSC;
> +
>   			set_hdr_output_metadata(data, NULL);
>   			igt_display_commit2(display, display->is_atomic ?
>   					    COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -736,7 +784,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   					test_static_toggle(data, pipe, output, flags);
>   				if (flags & TEST_SWAP)
> -					test_static_swap(data, pipe, output);
> +					test_static_swap(data, pipe, output, flags);
>   				if (flags & TEST_INVALID_METADATA_SIZES)
>   					test_invalid_metadata_sizes(data, output);
>   			}

