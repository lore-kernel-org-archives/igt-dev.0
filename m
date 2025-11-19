Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B26CF258C
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 08:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68F10E5AE;
	Wed, 19 Nov 2025 08:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0l9HG7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCEB10E352
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763541841; x=1795077841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2WuPrW0Rezz2yFNgMzP5694PkVtuUXnvvGs+/h7gCoo=;
 b=L0l9HG7hJ3fVSnN7FJVE3woFG7vaDONTJJJKjjyKlJ31c0U4N7CD16Ob
 ZaWspAAnbLrKzIH/u+TWt8OqL2bTPr1kDj7gORJFOZYwcOiteknbYg0n+
 IeASCCHvPxC12t3unT66GAoku4WtZ3b7aWUgN50G0rExmduuZ0ozY8HnB
 YgMxAlRWLfNGPtu84AnXfiEgmW7l+AX1UU4wgmdqB6fNINdjxmY9wIQhY
 RaO21Rphix/dAGlF9AUHJFU9mXasbTOQ93ojKmRqfWm1hFKdwdH06sBzb
 M/ZkDqxEPROhqj0uri1IT3p9MPn/WlCF8bo0b1Cn+n2mRPEVR3KLyWF3M Q==;
X-CSE-ConnectionGUID: mv6Fjao4Quir7CdpcMVLhA==
X-CSE-MsgGUID: sIEGTLTiTey4FMlsBffdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83201864"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="83201864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 00:44:00 -0800
X-CSE-ConnectionGUID: m65w+LG6QIy4liNLwDdfVg==
X-CSE-MsgGUID: QFuD/coPRz+bxnmQdVaeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="190249566"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 00:44:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 00:43:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 00:43:59 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 00:43:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxvGqHBYXlwzYo1elF2NNUEsEa1ozCGtTW3BPtgMTvHsrKEkaJf1TfHo6PDIfuu9sW57YAoZCXcsmiTX8bnfR0cwOdcfj3fedLhRdwEQXbHScStOcU2aGKRhq9KZ5PxPUw4CAzDRvS4dp3tzplVtDCdmw05P9IAKXDMYAn00CqpRDYgxbGohok2ND1mPs8mBYvzij1C6UoQp88EYwz34REdNS3aip/cDDWy3raC1LYTas5Nv1+3IqJlmF2r7T90pYItREJRJw4859j8YPq/TNKukrzBnXi1bcVxtX6jB5jcqNzYvLEAiLmzxj31mKM4X3XcO5odTByKFcrtYDLI5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwxyGer/NFkgAYQHj6SOaWxvf5rZB01xQPCRNvaIO/o=;
 b=rIGHbXY2y+mOXaiLaBu9rsaKMa6f9LvEPdvl0xoOmjQSNwjmPaufKj1b6j72Mxe0BEHscKgy4iWNSvJOWUZdj2nSl1NuFZPf2QaHNklO61GOOWPlxFEZaAuX4phMVQSeBDtmhukRkoA88Kk2L8mD0/r1OKVoEtUFgY5Rif1kyQUDWRZnUPr8DsXUT4o9D/KnGSQJUVUNunn7VLK2EfTyJlT7/IHEV4/RXw5G2PuCCk+EA4clkFHvb+xHg3T7DD8feNV4W1hn0NqRVjFcvBk/re/l29Wh4YpLJi5/K3LKs7s/QTnwySJM+4jF6K1v1AfDbe8pLEhym/EUFsTQAt1niA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by SJ5PPFF330187AB.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::860) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:43:54 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 08:43:54 +0000
Message-ID: <a0f99b54-8e62-4f83-9c1f-66bbd7c070a5@intel.com>
Date: Wed, 19 Nov 2025 14:13:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/drm_ras: tool to communicate with DRM Netlink
 Subsystem
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tauro Riana <riana.tauro@intel.com>,
 Iddamsetty Aravind <aravind.iddamsetty@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>
References: <20251114100729.102365-1-ravi.kishore.koppuravuri@intel.com>
 <aRdbhmqXkJoR6iCN@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <aRdbhmqXkJoR6iCN@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|SJ5PPFF330187AB:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c9518c-e681-4863-4369-08de2747c569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjdHWWlpNjUvdHZOZkN6bkpITHlzZEZ6MHdUVjJyR0RtRnc0ZVlpblltYzFX?=
 =?utf-8?B?cUo5N0dBMS9oOHlVNVZocDA3RGR4TkZKaXRWQkVIM0dTNVBMUGFKT1l2OFFp?=
 =?utf-8?B?dGcrcmtGQ1JLYm9UdHlUbFlBbzBwNnhIV09heFB2OHA5cHJBcDVyWW40R1RY?=
 =?utf-8?B?V1E1dXR1TW0rQjZub0lMTUJrdHV3c01LeG4wdGlKcjhleDlXVjdCMDBxTUZq?=
 =?utf-8?B?dmE2d2J1TmJLdS93Sk9YL1NpMDFSQjhwWDUxK3Z4NjV1Z21DWmx3UFRrQUpm?=
 =?utf-8?B?dVoxaC9PMFI4ZzJaWTR0NUV4WjVzc2tYcU1laENUSVlwYkh5OEVlakc4U3c0?=
 =?utf-8?B?Zm1PR3E3WmlwNmYrRjB4UFBZdzB3VHpaUXJIV1Nud3VST3hUTHNIeGpVMU9p?=
 =?utf-8?B?NG90bDVRRFdrZm5wWGdxQzBIVjYrOWdnWVJWMjVtVDdybzN2K09xc3FKem9s?=
 =?utf-8?B?NHg5dnUyWGRtQVNReHNlY0l5bmhPOXJDYjVkaVZVMDB4ZVYvWm9vTTdENDc2?=
 =?utf-8?B?YUEvQlVMT05WUHVGbGVuYkNQekR3Y0xpSnl1QUZxb0JnNUVCZGdTZU0xdlZj?=
 =?utf-8?B?ajMrdnRjYWdBMzJ6VVJ5SEsxZVRrclVUVjZDZWN5cFlOME9BOHZvV2x6NXBj?=
 =?utf-8?B?anVaQlFtQVA1UmtsaXd6OWd2NUMyd3Z0MzRXdTJYZ0ZNMnl4ZEZVY29iczk4?=
 =?utf-8?B?RmgrMXlYNWU1RGRQcCs3a01BMHJEL0MxZjArMlR4UGNKRFBMUk1LOUlqTXE3?=
 =?utf-8?B?ZHhlMEwwZVJvUTREOTlUemFKc2xsOThJK2JlNmYyUW04UWx3ejl2UDM0ZGF2?=
 =?utf-8?B?V212Y1BWdnhseXZxS2c0OWFMckpnd1pVZzVZN2ZCUDJBYUxtNU8xZTBnZmFr?=
 =?utf-8?B?ckxPL284ZHhQdG5kdWNuWVNxSEMvOEMxMGh4ejFGaThsd25Oa0M1N0JKeGx4?=
 =?utf-8?B?STRuK3IzdGRrUTNaaXphSXdmM0ErMEZsWTVleVFEOS9zd0M5V0V0MG9qR1Ri?=
 =?utf-8?B?TUlCSGN6elZ6Q2RpcG1zUEFySjdEQWZqOVJ2SUhSSzNIVS9VQUFLTjVLamFQ?=
 =?utf-8?B?VEpZSUZIL3JxVXFEWWthOUlKMXV3VDRzRE9Na2VxcXhBdytDckh0dUJPekV6?=
 =?utf-8?B?YUV0SDZ1aG52elRVa3BuZ3luMndLb0NnWk1MSGlNMHNZM1dGTmpZeW1HV3JU?=
 =?utf-8?B?SDNUcVNacEtzb2pIcFhuK1R4S2JZRU1QbjlmNkt6VlZIMVhiMEdHSkp6Zzgw?=
 =?utf-8?B?cU0zRGZkME94TlU4S29qRkp0ektvbm1xRFZ1eVBsUEZKaXhJcEtnMUQvcFVz?=
 =?utf-8?B?c0NmbnlMZnBvaUZSV2hacndNNDN3MGREVVM1UEVHRnJQbFJxc1lSSXlzb0dX?=
 =?utf-8?B?TjhRWkVnekJhZEdMTDhFVGNlNjl1UVkwcGhxTjAyQ29YQ2djQ3A3eTRzYlRC?=
 =?utf-8?B?YWUyL1NVQmtlbk84NVZWMDVINVAzVVM3eTlNcVVjeVphb2F5MjIzQjkwWWtv?=
 =?utf-8?B?VnR4cHBMcXdpQjBmNWo2OTBXdi95MmZPWUFIdjNjaldUdVZMbkVrZDZ5Q2I3?=
 =?utf-8?B?T0FwejEwUVpXcmpXdmRlbko0Q2lpeFpvekExWmxLSXJRS2E1VVBaRXorOE1r?=
 =?utf-8?B?OVRhUUdzZXlpR3RFLzN2c2JvWno3c080aHFyMXBDNGF6SnNzUngyV2ViZVJ0?=
 =?utf-8?B?Z1cyTmJRbHhKRGt3YkpMSDlxUFZ0cTdUOWcyUFZxZE9peW41Q2toZC9xSmNU?=
 =?utf-8?B?a25rVWlaQWRSd1NFWTdLR2FMZzBuVm5SK3pJREE1Y2Z5aFJNQTlhM3E5Rm5V?=
 =?utf-8?B?b1Vrb0czS1gwREVQT2I4VWtZMCtXZ3NVNkFEcjI0U01CZ1dBVHNaVlplK0hC?=
 =?utf-8?B?QWdseHJ1ZUNtYWUySjNtNkNZUGY3OVdOV0owUXFJL0tDekVjNXl6d2Z5QWR2?=
 =?utf-8?Q?KBd8glD09kp+kekronN3DuaLJxw2Ue+n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNnYm45ajJ6M1M2LzVCWFNuQStBdTVSKzBvdXRUejkvYmRLWmFOSWd6cTdF?=
 =?utf-8?B?eURjZFNtWmRRYk45L1JxT2QrbytTS29XUmdNcDg2eWk2Q1BLSUMzeU1pdkJs?=
 =?utf-8?B?SGZaUlVMSGRWU1pXZElsY3V5TittcmJsRWpIVmhEQ2pES2tMdXo3OWpYZ3o3?=
 =?utf-8?B?eG5GQmJwUDI4N1ZLdnZpcXhpblZxcU1jK1NFRmRHcHU1Uzh2czBaRjlBMVRJ?=
 =?utf-8?B?bDNqNzVIQ2tqNjduSThBMXZQaFJ1ajBpaUtYQ1lERnFNeVN5S1BqcWdOUVVv?=
 =?utf-8?B?VzdCbE9KMk9EdmdabjFoSWYyMG9VYzZqNGhqYXorV0lYR3hjcnRsTGI1NkJl?=
 =?utf-8?B?bXpYcE8rMmJCeWtBbnZ6S1grZW92V2JLTnNlT084aFQ2ZXE2bldxYThXZmJL?=
 =?utf-8?B?OHFwc1Vsc05GTHU3YjBwN3cvNHc2RXpVcEFkVXFFcHY5RGFmdDljRGpsK1dF?=
 =?utf-8?B?RElWZUhNV3hiSmNPZ0QyRFZCdk1GZmNxYysyM0ZHd1Y1TzhqT3pObkR6UThR?=
 =?utf-8?B?WG5SQWI3d1FvNlNaZkhoQXhZcG1LM2JIQzRWMWVrMkxUK0drT1lCZVRzeHQ2?=
 =?utf-8?B?cW15SlZFRkpyeFRacWJxWi80WHFQQ2tNelVwanlXdTdFUnpSVlE4cE50ekJX?=
 =?utf-8?B?SEQ5ME5wQzlqT0RLWEt5eUI5MWFHOXlNWWZTOE16a21xOWNtcHNyaW9WZFRu?=
 =?utf-8?B?RTRaK3ZvNlFZekZEa3l4bS9Mc2phZC84aG9SMW5IVldGaU1HQXJlTWNxTEZ5?=
 =?utf-8?B?eVZTeEk1K3hFRVIrWmxrTU1BY0VBbEE5dHArQ2VManVQN0ZnOWRoUWV3R2lh?=
 =?utf-8?B?SWpnM3d6bm5EdjZhMitnK29pNmZtTGtFb0ZWc1pqbFVCc0VYRXdkbDNOTlhM?=
 =?utf-8?B?SmFqS1pLakxqNUppYWRkdXgvZTcyNVVVMmVoRjkzSE9Sc2ZTZnU3eW4xdi9M?=
 =?utf-8?B?dkN4amlMYkFyU3pkMDhIT3UzeG1QVkttZnR0bnZOZ2pzemd1UUkwMWN6c1Jj?=
 =?utf-8?B?RlhJQ3BTV0swOFlCYXpnY0JOZjYxdFBNYWtkV29PK0J0T1ZucDVvRU5YYS90?=
 =?utf-8?B?ejBzdkY4dkdmUkdOWWQycVhTdU5rTzE1Q3ZPUTEyKzR5R2tEUlBVdXRPeXBQ?=
 =?utf-8?B?c0cvakFGNk1sVFlpVEp3aWFEK3VldzlKMjFRaWtvSzZHU1V3bXZSVzhMdkYz?=
 =?utf-8?B?WTNsc3JFZ25PREp1elJjb3EwdWk3cFV2cDI4SkhiQXpKNUFaUW51b0JTTDJo?=
 =?utf-8?B?amR6a1did1VvYmExdGpyUEcrNzhaUTdaa2wveGpZMFV4YXZHNnZ4cVZLRENh?=
 =?utf-8?B?MWhHUkxzSFNzTFZ5LzZhMEhaWm54YmJSZ21kd2pqaU1oeDgzWHlYTDRPTXRN?=
 =?utf-8?B?cXNCcGhKNGQ5Z29aR2tSVW1KREJxZzVqZXZtMmh4VDFsY1FBQlI5UDJqdk9C?=
 =?utf-8?B?d2pZZmJwZmJpb2hYdWg5OW1SendvREMyVGtPNU83Y0l6UGFHbGlzV1gyUDhr?=
 =?utf-8?B?V0w4VXMzNzB3ZFN5bnIvdXk2SHN1YTNNeTRYL3A0MytWZUlsTXVIZWZYbExu?=
 =?utf-8?B?TW5ZWWlrSzZaU2xRSTJGZ1cyb3NaK2JrbTZsK1FWYkVndXdEaWpLemdESmVn?=
 =?utf-8?B?Q0NoakxHeXBZdTFJNXdsNXhwVnFaTExnaUJxM3g0ZE1IN24yWUpuaG93cHpt?=
 =?utf-8?B?cUI3MXJEWTI2eVkrS1o5MkhoUi9aanMrV000dXgyT05FdlpacUtjUTBKZEor?=
 =?utf-8?B?SlYvNEdzS2JWeUtNYkdXT3BmUFJ0dTY2YlZHbGxadFVjNys1YjQybmFRQk5z?=
 =?utf-8?B?a0tSN0tpaXFha3BrbkxrcXlhMm1qRXI4QnJHN3NWUWhIeHVnOFZ6SFhjOTBw?=
 =?utf-8?B?QVY1MTVtcUZkcDNQcFk3aUVNdlpuOUxHYTNseTBDemxpL1A1MW1Ca2c4TFVG?=
 =?utf-8?B?eDZpL2ptRUhtNlBGcmdkU1JlOHh2R3hiQkYzOTZCQ2lQQ0NPSmRQQVRmM01H?=
 =?utf-8?B?d2prYkN4elJ2U0RDL2w4dE15NjJIOHVLY2VRWEVVOFhQTVhIanpOeUt0dVBX?=
 =?utf-8?B?dXlrMVBWTTBQNHdRSEYyNVNNblNXNnM0dytDRHFKaXhkUU1IMlZNdGtGalJF?=
 =?utf-8?B?TWpwbjNXVzhENUMrYVVHb3EwZkYxM3RRQ0w0ZFRqSXVQb3VZaXNrUXkyYjZy?=
 =?utf-8?Q?6JRpGbqJ2TCae5oUuRaWAjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c9518c-e681-4863-4369-08de2747c569
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:43:54.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPKs1ik2wTtfCQRjCHTZ9z/hwTyj1oEeMS5vTOnhB5RdxfIX8YqnLXPR+LaXJyYQYE61haEo1ofZx6rjw/3B4APIY8ewcMDPUXTZfFBjnQtGQl+ZQrnOSfYispPWyifo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF330187AB
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


On 14-11-2025 22:10, Rodrigo Vivi wrote:
> On Fri, Nov 14, 2025 at 03:37:29PM +0530, Ravi Kishore Koppuravuri wrote:
>> User space tool for querying GPU health monitoring RAS events via
>> Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
>> Available Commands are
>> 	- List Nodes
>> 	- Get Error Counters
>> 	- Query Error Counter
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> Cc: Tauro Riana <riana.tauro@intel.com>
>> Cc: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
>>
>> ---
>> V1 -> V2:
>> 	- Removed device_id from the input parameters
>> 	- Updated help() function
>> 	- Incorporated error handling logic
>> ---
>> ---
>>   include/drm-uapi/drm_netlink.h |  79 +++++++
>>   meson.build                    |   5 +-
>>   tools/drm_ras.c                | 421 +++++++++++++++++++++++++++++++++
>>   tools/meson.build              |   5 +
>>   4 files changed, 509 insertions(+), 1 deletion(-)
>>   create mode 100644 include/drm-uapi/drm_netlink.h
>>   create mode 100644 tools/drm_ras.c
>>
>> diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
>> new file mode 100644
>> index 000000000..af893aa36
>> --- /dev/null
>> +++ b/include/drm-uapi/drm_netlink.h
> This confused me. Please don't change the filename.
> It needs to be a straight copy from the kernel name.
> in this case drm_ras.h
>
> This is likely what also confused me in the v1 where I thought
> your code was based on the old implementation of the netlink.
Sure. I will update the header file name as suggested.
>> @@ -0,0 +1,79 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>> +/* Do not edit directly, auto-generated from: */
>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>> +/* YNL-GEN uapi header */
>> +
>> +#ifndef _LINUX_DRM_RAS_H
>> +#define _LINUX_DRM_RAS_H
>> +
>> +#define DRM_RAS_GENL_NAME "drm-ras"
>> +#define DRM_RAS_FAMILY_VERSION	1
>> +
>> +/*
>> + * Type of the node. Currently, only error-counter nodes are supported, which
>> + * expose reliability counters for a hardware/software component.
>> + */
>> +enum drm_ras_node_type {
>> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
>> +};
>> +
>> +enum {
>> +	/* Unique identifier for the node*/
>> +	DRM_RAS_NODE_ATTR_NODE_ID = 1,
>> +
>> +	/* Device name chosen by the driver at the time of registration */
>> +	DRM_RAS_NODE_ATTR_DEVICE_NAME,
>> +
>> +	/* Node name chosen by the driver at registration to identify RAS node inside the device */
>> +	DRM_RAS_NODE_ATTR_NODE_NAME,
>> +
>> +	/* Type of the node, identifying its function */
>> +	DRM_RAS_NODE_ATTR_NODE_TYPE,
>> +
>> +	__DRM_RAS_NODE_ATTR_MAX,
>> +	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
>> +};
>> +
>> +enum {
>> +	/* Node ID targeted by this error counter operation */
>> +	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
>> +
>> +	/* Unique identifier for a specific error counter within an node */
>> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
>> +
>> +	/* Name of the requested error counter */
>> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
>> +
>> +	/* Current value of the requested error counter */
>> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
>> +
>> +	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
>> +	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
>> +};
>> +
>> +enum drm_genl_error_cmds {
>> +	/**
>> +	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
>> +	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
>> +	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
>> +	 * on the nodes.
>> +	 */
>> +	DRM_RAS_CMD_LIST_NODES = 1,
>> +
>> +	/**
>> +	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
>> +	 * node. The response include id, name, and current value of each counter.
>> +	 */
>> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
>> +
>> +	/**
>> +	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
>> +	 * for a given node. Response contains id, name, and current value of the counter.
>> +	 */
>> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
>> +
>> +	__DRM_RAS_CMD_MAX,
>> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>> +};
>> +
>> +#endif /* _LINUX_DRM_RAS_H */
>> diff --git a/meson.build b/meson.build
>> index db6e09a94..f7807660e 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>>   libudev = dependency('libudev', required : true)
>>   glib = dependency('glib-2.0', required : true)
>>   
>> +libnl = dependency('libnl-3.0', required: false)
>> +libnl_genl = dependency('libnl-genl-3.0', required: false)
>> +libnl_cli = dependency('libnl-cli-3.0', required:false)
>> +
>>   xmlrpc = dependency('xmlrpc', required : false)
>>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>>   xmlrpc_client = dependency('xmlrpc_client', required : false)
>> -
>>   xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
>>   if not xmlrpc.found() and xmlrpc_cmd.found()
>>   	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
>> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
>> new file mode 100644
>> index 000000000..bb7d0dfa0
>> --- /dev/null
>> +++ b/tools/drm_ras.c
>> @@ -0,0 +1,421 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <sys/types.h>
>> +#include <unistd.h>
>> +#include <ctype.h>
>> +#include <getopt.h>
>> +#include <linux/genetlink.h>
>> +#include <netlink/netlink.h>
>> +#include <netlink/cache.h>
>> +#include <netlink/genl/genl.h>
>> +#include <netlink/genl/ctrl.h>
>> +#include <netlink/cli/utils.h>
>> +#include <netlink/cli/link.h>
>> +#include "../include/drm-uapi/drm_netlink.h"
>> +#include "igt_device_scan.h"
>> +
>> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
>> +
>> +struct nl_sock *mcsock;
>> +
>> +enum opt_val {
>> +	OPT_UNKNOWN = '?',
>> +	OPT_END = -1,
>> +	OPT_NODEID,
>> +	OPT_ERRORID,
>> +	OPT_HELP,
>> +};
>> +
>> +enum cmd_ids {
>> +	INVALID_CMD = -1,
>> +	LIST_NODES = 0,
>> +	GET_ERROR_COUNTERS,
>> +	QUERY_ERROR_COUNTER,
>> +
>> +	__MAX_CMDS,
>> +};
>> +
>> +static const char * const cmd_names[] = {
>> +	"list_nodes",
>> +	"get_error_counters",
>> +	"query_error_counter",
>> +};
>> +
>> +struct app_context {
>> +	enum drm_genl_error_cmds command;
>> +	struct nl_sock *sock;
>> +	struct nl_cb *cb;
>> +	uint32_t node_id;
>> +	uint32_t error_id;
>> +	int error_id_set;
>> +	int node_id_set;
>> +	int error;
>> +	int family_id;
>> +};
>> +
>> +static void help(char **argv)
>> +{
>> +	int i;
>> +
>> +	printf("Usage: %s command [<command options>]\n", argv[0]);
>> +	printf("commands:\n");
>> +
>> +	for (i = 0; i < __MAX_CMDS; i++) {
>> +		switch (i) {
>> +		case LIST_NODES:
>> +			printf("%s %s\n",
>> +			       argv[0],
>> +			       cmd_names[i]);
>> +			break;
>> +		case GET_ERROR_COUNTERS:
>> +			printf("%s %s "
>> +				"--node-id=<node-id>\n",
>> +				argv[0],
>> +				cmd_names[i]);
>> +			break;
>> +		case QUERY_ERROR_COUNTER:
>> +			printf("%s %s "
>> +				"--node-id=<node-id> "
>> +				"--error-id=<error-id>\n",
>> +				argv[0],
>> +				cmd_names[i]);
>> +			break;
>> +		default:
>> +			printf("%s is Unknown Command\n",
>> +			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
>> +		}
>> +	}
>> +}
>> +
>> +static int list_nodes_handler(struct nl_msg *msg, void *arg)
>> +{
>> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
>> +	struct nlattr *nla;
>> +	int len, remain;
>> +
>> +	len = GENL_HDRLEN;
>> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
>> +		/* Validate whether the attribute is with in the range or not*/
> I will randomly chose this point here to do an overall complain about all these
> comments in the entire patch here.
>
> Way too much redundant comments. A developer can read the code.
>
> Also, most of them are in different formats and with missed spaces on the begin
> or at the end.
>
> Please only use comments when the do tell something else that the code itself
> is not already telling and use the standard formats all across.
Thanks Rodrigo. I will update the comments as per the guidelines suggested.
>> +		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
>> +			printf("Unknown Node attribute type: %d\n", nla_type(nla));
>> +			return NL_SKIP;
>> +		}
>> +
>> +		switch (nla_type(nla)) {
>> +		case DRM_RAS_NODE_ATTR_NODE_ID:
>> +			printf("%-18u\t", nla_get_u32(nla));
>> +			break;
>> +		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
>> +			printf("%-30s\t", nla_get_string(nla));
>> +			break;
>> +		case DRM_RAS_NODE_ATTR_NODE_NAME:
>> +			printf("%-30s\t", nla_get_string(nla));
>> +			break;
>> +		case DRM_RAS_NODE_ATTR_NODE_TYPE:
>> +			printf("%-18u\n", nla_get_u32(nla));
>> +			break;
>> +		default:
>> +			printf("Unknown attribute type: %d\n", nla_type(nla));
>> +			break;
>> +		}
>> +	}
>> +	return NL_OK;
>> +}
>> +
>> +static int query_error_counter(struct nl_msg *msg, void *arg)
>> +{
>> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
>> +	struct nlattr *attrs[256];
>> +	int ret;
>> +
>> +	/* Parse the attributes */
>> +	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
>> +	if (ret < 0) {
>> +		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
>> +		return NL_SKIP;
>> +	}
>> +
>> +	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]) {
>> +		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing");
>> +		return NL_SKIP;
>> +	}
>> +
>> +	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
>> +
>> +	return NL_OK;
>> +}
>> +
>> +static int get_error_counters(struct nl_msg *msg, void *arg)
>> +{
>> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
>> +	struct nlattr *nla;
>> +	int len, remain;
>> +
>> +	len = GENL_HDRLEN;
>> +
>> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
>> +		/* Validate whether the attribute is with in the range or not*/
>> +		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
>> +			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
>> +			return NL_SKIP;
>> +		}
>> +
>> +		switch (nla_type(nla)) {
>> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
>> +			printf("%-18u\t", nla_get_u32(nla));
>> +			break;
>> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
>> +			printf("%-30s\t", nla_get_string(nla));
>> +			break;
>> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
>> +			printf("%-18u\n", nla_get_u32(nla));
>> +			break;
>> +		default:
>> +			printf("Unknown attribute type: %d\n", nla_type(nla));
>> +			break;
>> +		}
>> +	}
>> +	return NL_OK;
>> +}
>> +
>> +static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
>> +{
>> +	struct app_context *ctx = (struct app_context *)arg;
>> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
>> +	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
>> +
>> +	/* Verify aginst the expected command response */
>> +	if (gnlh->cmd != ctx->command) {
>> +		fprintf(stderr,
>> +			"Unexpected command response: got %d, expected %d\n",
>> +			gnlh->cmd,
>> +			ctx->command);
>> +		return NL_SKIP;
>> +	}
>> +
>> +	/* Route to respective Command handling function */
>> +	switch (ctx->command) {
>> +	case DRM_RAS_CMD_LIST_NODES:
>> +		return list_nodes_handler(msg, arg);
>> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
>> +		return get_error_counters(msg, arg);
>> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
>> +		return query_error_counter(msg, arg);
>> +	default:
>> +		fprintf(stderr, "Unknown command: %d\n", ctx->command);
>> +		ctx->error = -EOPNOTSUPP;
>> +		return NL_SKIP;
>> +	}
>> +}
>> +
>> +static void send_cmd(int cmd, void *arg)
>> +{
>> +	struct app_context *ctx = (struct app_context *)arg;
>> +	struct nl_msg *msg;
>> +	void *msg_head;
>> +	int ret;
>> +
>> +	msg = nlmsg_alloc();
>> +	if (!msg)
>> +		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
>> +
>> +	switch (cmd) {
>> +	case DRM_RAS_CMD_LIST_NODES:
>> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
>> +				       ctx->family_id, 0,
>> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
>> +				       cmd, 1);
>> +		if (!msg_head)
>> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
>> +
>> +		printf("%-18s\t%-30s\t%-30s\t%-18s\n",
>> +		       "node-id", "device-name", "node-name", "node-type");
>> +		break;
>> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
>> +		if (!ctx->node_id_set) {
>> +			fprintf(stderr, "Error: --node-id is required for %s command\n",
>> +				cmd_names[ctx->command - 1]);
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
>> +				       ctx->family_id, 0,
>> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
>> +				       cmd, 1);
>> +
>> +		if (!msg_head)
>> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
>> +
>> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
>> +		printf("%-18s\t%-30s\t%-18s\n",
>> +		       "error-id", "error-name", "error-value");
>> +		break;
>> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
>> +		if (!ctx->node_id_set || !ctx->error_id_set) {
>> +			fprintf(stderr,
>> +				"Error: --node-id and --error-id are required "
>> +				"for %s command\n",
>> +				cmd_names[ctx->command - 1]);
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
>> +				       ctx->family_id, 0,
>> +				       NLM_F_REQUEST | NLM_F_ACK,
>> +				       cmd, 1);
>> +
>> +		if (!msg_head)
>> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
>> +
>> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
>> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	ret = nl_send_auto(ctx->sock, msg);
>> +	if (ret < 0)
>> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
>> +
>> +	ret = nl_recvmsgs_default(ctx->sock);
>> +	if (ret < 0)
>> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
>> +
>> +	nlmsg_free(msg);
>> +}
>> +
>> +static int get_cmd(char *cmd_name)
>> +{
>> +	int i;
>> +
>> +	if (!cmd_name)
>> +		return -1;
>> +
>> +	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
>> +		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
>> +			return i + 1;
>> +	}
>> +	return -1;
>> +}
>> +
>> +static int check_for_help(int argc, char **argv)
>> +{
>> +	for (int i = 1; i < argc; i++) {
>> +		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
>> +			return 1;
>> +	}
>> +	return 0;
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	char *endptr;
>> +	enum opt_val val;
>> +	int  ret, opt, option_index = 0;
>> +	struct app_context ctx = {0};
>> +
>> +	// Check for help option before command parsing
>> +	if (check_for_help(argc, argv)) {
>> +		help(argv);
>> +		exit(EXIT_SUCCESS);
>> +	}
>> +
>> +	//Parse the input command
>> +	ctx.command = get_cmd(argv[1]);
>> +	if (ctx.command < 0) {
>> +		fprintf(stderr, "invalid command\n");
>> +		help(argv);
>> +		exit(EXIT_FAILURE);
>> +	}
>> +
>> +	static struct option options[] = {
>> +		{"error-id", optional_argument, NULL, OPT_ERRORID},
>> +		{"node-id",  optional_argument, NULL, OPT_NODEID},
>> +		{"help",     no_argument,       NULL, OPT_HELP},
>> +		{0, 0, 0, 0}
>> +	};
>> +
>> +	optind = 2;
>> +	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
>> +		switch (opt) {
>> +		case OPT_ERRORID:
>> +			if (optarg) {
>> +				printf("Error ID: %s\n", optarg);
>> +				//Assuming input is in Decimal Representation
>> +				ctx.error_id = strtoul(optarg, &endptr, 10);
>> +				if (*endptr != '\0') {
>> +					fprintf(stderr, "invalid error id %s\n", optarg);
>> +					exit(EXIT_FAILURE);
>> +				}
>> +				ctx.error_id_set = 1;
>> +			} else {
>> +				printf("Error ID not specified\n");
>> +				ctx.error_id_set = 0;
>> +			}
>> +			break;
>> +		case OPT_NODEID:
>> +			if (optarg) {
>> +				printf("Node ID: %s\n", optarg);
> no need to echo back
Ok.
>> +				//Assuming input is in Decimal Representation
> besides the comment comment I made above,
>
> we don't assume, we check...
Ok.
>> +				ctx.node_id = strtoul(optarg, &endptr, 10);
>> +				if (*endptr != '\0') {
> ...but we check before the conversion, not after.
>
>> +					fprintf(stderr, "invalid node id %s\n", optarg);
>> +					exit(EXIT_FAILURE);
>> +				}
>> +				ctx.node_id_set = 1;
>> +			} else {
>> +				printf("Node ID not specified\n");
> stderr print and exit?
> or if it is not an error flow you don't need to be that verbose...
Ok. I will remove the verbose prints here.
>> +				ctx.node_id_set = 0;
> init the node_id to -1 and you can avoid this extra variable.
Ok. I will update the logic accordingly
>> +			}
>> +			break;
>> +		case OPT_HELP:
>> +		case 'h':
>> +			help(argv);
>> +			exit(EXIT_SUCCESS);
>> +			break;
>> +		case '?':
>> +			fprintf(stderr, "Unknown option\n");
>> +			exit(EXIT_FAILURE);
>> +			break;
>> +		default:
>> +			fprintf(stderr, "Unexpected option: %c\n", opt);
>> +			exit(EXIT_FAILURE);
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* Create a Netlink Socket object*/
>> +	ctx.sock = nl_cli_alloc_socket();
>> +	if (!ctx.sock)
>> +		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
> why do we use cli_fatal? and when using it, why don't we exit?
nl_cli_fatal() prints the error message and terminates the program 
immediately. So I am not using exit() explicitly. Also, I am working on 
to update the error handling logic in my next revision.
>> +
>> +	/* Connect the allocated socket to NETLINK_GENERIC protocol*/
>> +	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
>> +	if (ret < 0)
>> +		nl_cli_fatal(ret, "Cannot connect handle");
>> +
>> +	/**
>> +	 * Resolves the Generic Netlink family name to the corresponding
>> +	 * numeric family identifier. This function queries the kernel directly
>> +	 */
>> +	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
>> +	if (ctx.family_id < 0)
>> +		nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", DRM_RAS_GENL_NAME);
>> +
>> +	/* Modify the callback handler associated with the socket */
>> +	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
>> +	if (ret < 0)
>> +		nl_cli_fatal(ret, "Unable to modify valid message callback");
>> +
>> +	send_cmd(ctx.command, &ctx);
>> +
>> +	nl_close(ctx.sock);
>> +	nl_socket_free(ctx.sock);
>> +
>> +	return 0;
>> +}
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 8185ba160..74ff97713 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -70,6 +70,11 @@ if libudev.found()
>>   		   install : true)
>>   endif
>>   
>> +executable('drm_ras', 'drm_ras.c',
>> +			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
>> +			install_rpath : bindir_rpathdir,
>> +			install : true)
>> +
>>   executable('gputop', 'gputop.c',
>>              install : true,
>>              install_rpath : bindir_rpathdir,
>> -- 
>> 2.34.1
>>
