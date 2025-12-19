Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE97D767FF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 13:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3325310ED2D;
	Fri, 19 Dec 2025 13:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFus0FzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BFC10ED2D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766149709; x=1797685709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyzpndeZWWp61inhYOjALfvGYQjzFAR4qrWMk+IUXvw=;
 b=JFus0FzI79msS644tlN0Ly2OTWUs98CViS8Oh8SYE67fA1HsMBJYr1/y
 zfTT3CXg/KeZjLUT51Le229GLuH57UmiukOuETdB42PuMRzmWqd2PYd0C
 OIXHKrc+v3q1sw+i1ypMd95R/T0yg9uuqOBpiarslpZV5l3nXy2K0u+o3
 IqjvWeFxaTLIOMPt7FSbvwNvxuV7eVInZviMy1TVQx0f4NBbmVTiJ/XdO
 fnCqD8KSwP1lM7sTTnWNhkAQPfFbzvs7bnNJSIb+4Tf84QP+w7N0p1lKI
 v2NFec75bPV2eYfLRjhLny9hxt5Qu0AkeRyYxx1DlEJkjX46fGcLjJhcX Q==;
X-CSE-ConnectionGUID: Wn9rZ0RrSyiyXSvT0WEfaQ==
X-CSE-MsgGUID: vsDpl9gGSgyXjNFRq7Jyag==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79229157"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79229157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:08:29 -0800
X-CSE-ConnectionGUID: bWPUBb/ZRQ25D2phGJHoUw==
X-CSE-MsgGUID: LBxazMVBT2u1/Kc/vc6/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203948269"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:08:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:08:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 05:08:28 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQMGYJ6BFKCmkHXK3vykSPqVllH9Ob/CcHhgSl4PXOsFBLbQkHxEZz4nz7nGE+uBYQ26NhwxXMfSAtqhi2TyTMJdpmcOeH0Q/ACxDd6CDC2y1N/nJwkoGxsjsdpIm0+jNUxZgkZdcqHLVhcNPkVYtrAtjHrdYYwpV2bFTiSBxO/NLyfGO+o3l9JlhMeX7JO2puU+kB7ei6u8HFABvNfDkWLNHXUsQQECzyzqpNvdRqtXI0sY0eDicWNMEd6DpvMGosMAAQiDO2VLDLR8glfmT3XGgAUWGbWNAN3nnj7IQelDyDrZdvLzwp27FVg2wZ8Vi0dQ108jn8Uv0CfNcOMo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZZ2o/ZhOv+YLJBmDJwl31ec8gIAhTJEGgNki9Zjsos=;
 b=ONmsqE04XcWhbvrJT1iDsIFqQz89iWRPycslYw+9xRIaFazCkwttbGv/SkkIW43Zu1psfYF3Tt1FIEisgjAScdRuCsFZ7Qa7KAhrUqY7T+I/Jbbp1GkcOijeA1/03vpFv8Sp7vrjBCo6HolQIp3ZVpaHZ8qyonxq00jROl1tE0Zw0VgDj4Ekuk9PyVLGHwpCDpCNHoCZc3swqk1ULbJ59kqvOC30ko95PgjP0FwaUURDXJnrzdb8WvKYYNCOp2viP0pzR7//1BxaVOb3pcGTYy/jyOjEW1sc3WenHnxuAi0OwZNhTFdQDOwi66urx/rdlptakI3M0FLHvCMiCf/oYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:08:21 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 13:08:21 +0000
Message-ID: <ea13a188-d033-4c7e-b6d2-609c03336b6a@intel.com>
Date: Fri, 19 Dec 2025 14:08:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_test_config: Add SR-IOV VF FULL
 testlist
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20251217165929.49760-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251217165929.49760-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::34) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 9229550e-337e-4083-7488-08de3effaf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K005SzEvVDd4ZjZpQ3J3QzlwWEZEVzN1OEd5NFRqakJqc2tjYnNFVk5tTklk?=
 =?utf-8?B?N013NjdieWhreFcyVy9yRzJvM2MxQVdDQlVTdFYzbW1od25OUm9hTnZTVk1Q?=
 =?utf-8?B?cDBvQVRCc0VDWTAyWXFaUHh6Z21FS3lYYnB2eWNwWHBrUG85UkJ6NFVXOVUy?=
 =?utf-8?B?NmZTMUFSdGdqQ3A0YnM5cDh4WnRxRWpLclkrMmdiTGFQNmlnZ2JPaklpWWNn?=
 =?utf-8?B?WHJZb0NESGhWTWllN0RLemhYRnVZTWtjalpVMG1vWE50cndTdnZNT1MxLzMw?=
 =?utf-8?B?L0N0dk5RaWFic0Qwd0dmZzdCNFpQRlJmUVRKcW1sYmhvdUJsWjQyNmFqNWZa?=
 =?utf-8?B?ZWVWTG15YldSQ2t5eml1Q0dLRFlqaTU0bnh5cTBORlQ5Y05ERm9yNWdqUms2?=
 =?utf-8?B?cm95QXVqOXRPK0dZUjlzQTd0K2RuM25PRkt6eDN6R2FCSkZGblJQbjh0UXph?=
 =?utf-8?B?bkxoK2w4U0J2QUdpeUo2YVVpMUIwdDNIVS9pdnV0QkJKOVdxN0JFemFZR1hX?=
 =?utf-8?B?TThnZG4zODJLWEozSER3YmVydytBTVZuYjBlMEswVVZHejMrbkRPOUxiN0Nw?=
 =?utf-8?B?TTNnTVMrZUlMK3A5N09uaGY4Yk5MTldJN0xlYVMwa1dnV3h3c1ArNFpOU3BI?=
 =?utf-8?B?Q2JIanVqcWUxOGpaZEtwMkNOQWFxNG55UFVpcUZsWkhkZHlXdmhHN1ExaVJO?=
 =?utf-8?B?L3A2MXd3bWlzUXVROHcvUWJJNDQzVVhoaEQwMjFIRVFzMEJMVkNDVmVmTEE1?=
 =?utf-8?B?bmxYcXpWRkNJQzF3cHNvMFFuOC9lakhFWENiRkFub055OXdvZnBBdlhHSy9V?=
 =?utf-8?B?K015UEpBWmR0UWR6aWgwSER4Z2xNWVg0bzhJWFFveTJmUUlSMVcyemNDL2JE?=
 =?utf-8?B?ZjVBWTRrVDRaV2daRGhoUUxWUXlQdm1NZUJDTWcwZVFmVUROK0lac1lNeTI0?=
 =?utf-8?B?Q1VTYzVtS08wZVpGcTZNcXVBdURwS0NYdW5JRStjQkZacHNia3poMjQvQ1hM?=
 =?utf-8?B?WHlPL2NrQ0t1ZU5hNlVYbU1Pb2MrWXNTSUlvWllVK25TWGlFcG10aXJUYVRL?=
 =?utf-8?B?UmJQT2dlWlZFVFAwNTZGaWl6K01rTWpjeFBIVjYyMThtNDlKRENVWWFEWFFy?=
 =?utf-8?B?bnJVdGZVOUNTemUrWDZMc3AwUmNsU3lIYWg4YVZ4MFRzV1VlQ3hid3BpMGVs?=
 =?utf-8?B?YUFuQVFMdC9WSm5ON0NFa0poQ0dkZzQwUVFVVGgwQU5Jc1RDeFhqYTdjN3hM?=
 =?utf-8?B?cHRZUTM4NHFLa05rY1NaTzh2bXJXTDh4Nnc3RnRnRURDR2NsVFZrajNQaFRP?=
 =?utf-8?B?RUlGR2NaZ2FWS1N0cCszWkZERTVzVE05WGQwalM2anErRjg3OWV6Q0gyM2Zh?=
 =?utf-8?B?NkdnUHVKbUgvOVc0TE8zc0dSMlZ2WWpHZlNaL3M4NUFLVGg0UjZOblNYUC9h?=
 =?utf-8?B?VHZxdkxFbXFVem1vTVBsZGd4NE94RTBoUCtzNnpuYnZTblZhWjV2WS8xZElx?=
 =?utf-8?B?WlNlc0JkQUhkK0Zjb2p6c2tYTFZnajBYUWg0OGNnOERIdGpYOTFQK1IvcFdY?=
 =?utf-8?B?K2NEUVdtZXM5amNIamJLQUtEd2hKV0k4QkJUbFF2MjRpU1YrcjlyLy9FQnkv?=
 =?utf-8?B?RVhoVE9iYlVXVXJCUkgxOVU0OU00RXpzYjJaY3g2QkJMc1hsMm1JdHM3bDNS?=
 =?utf-8?B?a2lZdzcwMnh5Y05KNEFyU1FOdjhkY1RJbDI0RWNkcENwV29tUWdxdHF6bXdr?=
 =?utf-8?B?UjlicVYyME5ZUG5waVdMTjJTdkoxN01lWktzMTVobkx1NFcycFAvNjFmbmNn?=
 =?utf-8?B?Z1ZlelNVSkNsem91WkUxcnpoM0NXRk90b05DakJaUGFrV3owcW03N0VsSGtX?=
 =?utf-8?B?UUNtWFZUTG9EMHk2VEVrMlRaaTBrbFM2RTNFYkNubWhFRVN6YXhaRDAvaW03?=
 =?utf-8?Q?IeIaJxxrXltSETTMDBuLdErQoiz3awoz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWFneUc5ZjNyZzNDcCtyZVdlQWN0Q3Jxa0pEeGY5ak1NZy95NjhZdlVCKzc1?=
 =?utf-8?B?M05XRkR4ZmVIY2s2OFI1dG9CTmI2c2NEeEVTd3RzYjNZYUdCN0JlelFyb2Jj?=
 =?utf-8?B?TEVVZWR5djhqTTBLMlc1OXZ6MXNqWDdZMFp4Z3UxNWNmT0FVK0FMTjcrOS9t?=
 =?utf-8?B?R3NWeTZmc3hMSFZkZU5MQ3dIc2wwUEdKSXZBbU5oUjhjUXhINGY4SlNEM2lX?=
 =?utf-8?B?T2dheEdxVC9ieU1meEV0QTlLcXdxaGhKR0JwTXhGOEk4YkVzcURSK1NFUFRX?=
 =?utf-8?B?alBXUXcycDhCbUsyQkorNzI1L0NhYmsxOWVGVkwxMEd5VTFVcGN5NDBuVS9n?=
 =?utf-8?B?RmFZd2dpbjNiSzJLR2lzSkNoaXpmN3FvWlg4eFQ1aXJzenlXSndpak91NkZV?=
 =?utf-8?B?Y01GYUZadHZET3RneW10VWZ4UVRMK3ZnSzJpV0RkOEpGN2ljM3dDLytFL0hu?=
 =?utf-8?B?Tmk4cVFsQWpuWmhsdkcveXMzSmpEMTc1VzZVVHd1Q1hkT2hjdFhnSUJ1UWsx?=
 =?utf-8?B?WWJsNllzMUNIdUZ2ejlGaklBNHVXWEpGUHdqQzdMazZJQkxSc3VwOW9FMUQx?=
 =?utf-8?B?K3orbXlnMzBLREZBMHl1V1gxdjVMMjJETnp1RGFUWkJzSVp1d3lmby8rczZC?=
 =?utf-8?B?WmJzT1RlRFFCSDNjdjd0Skh3OENjY0NvWTBqa21EZWRnSWxKSnNTeEJDQVIz?=
 =?utf-8?B?QUtPNTlBc2c4MVNDMkcxQjA1WmxGZGlsV05rMWJ4ZTFWYzBBSDhGR3dqOFR1?=
 =?utf-8?B?UlpDZUVzTGFZb2JYUGQ4Qi9JVTdObFI3cVA0Zzd5SVpNTXowTllMNVBlbFZ4?=
 =?utf-8?B?cVR1QmVzOVdGU2ZaVGV3dDQwTksralNzclh0TDBqYll4Z2N1UHY5L1l4blZn?=
 =?utf-8?B?UkYvOU1tbVAzbW1xcnZvWlVtTUhzTnJoRGJoTW5YYVI4S0NmRTNhRUdjeThQ?=
 =?utf-8?B?dXl6d1VGUGJTRXdwcmttZXNkNXV6RUo1dUh6aHRVRjdSaXNacmdPZGk3by81?=
 =?utf-8?B?ZnZ6aXZkTTJuOTQ4Nkk5cTV5M1R3ZVRTbDFJa005ZGdVREJMS0hmeFUyVC9F?=
 =?utf-8?B?MHZqeDM4dEhPUTlDaTAvU0RCTU1JV0hEbEFPVHZVbWVGSXVlQkN2MThJS2hr?=
 =?utf-8?B?aTl6UVhjRTFIaWd2VERGYkJBMkEyaVBqZlJCRldNOHR4WXBoNTl2bmQ5Y2da?=
 =?utf-8?B?OWhXdW5tV2NtSVRDeHFsaTgrZEZ5aGs4ekQrKy9LdUU3YzF4VjJQektEem9k?=
 =?utf-8?B?N2hmODdja0tsb0dWbkNESEFpcDhhNjFaRWNkQy9iWjBvYmcreDljQ1laY3VP?=
 =?utf-8?B?TFZUYmNUMitxa3FncWVMS1lKRm9qT3Q1VG1qNWtlNEcvOEJWMWtTZWZoL0p5?=
 =?utf-8?B?RWcrQU1LY1AzYmd4NGFKcVF6L3BXWmlWcVcrWFBOR1pqZVUrZGdObzNISkc3?=
 =?utf-8?B?eU9DUTBaVkl0RzJxaStzdndTTVp2bXhOY2pSYnpGOVJOU0dvbzhMbXZncmJi?=
 =?utf-8?B?QXV5bjU5QWZWdmZsNDE0MUxvc3ErSXMwRTZuQ0Z3S1JpUFJtaTJ3ZC9IcTdM?=
 =?utf-8?B?ZFhjOGhDNkpqcUovTDl4REh4cDAvMGxLa0VJWUYrVVZscWEwZmhoeUNoZ2Nu?=
 =?utf-8?B?V1pvYUNKekFrMFVqaVhZbW56MUx2RkxJNmZMOHVESkNFeURkQlZKQmdiTUFY?=
 =?utf-8?B?NHdkbTRGeXo5QjJwSjROYlFhL3l6SzhoZlZlZFE3SFl1RmdseGNLRnNQQUgx?=
 =?utf-8?B?Mm9XTTdyMnA2Z0M3dDRCTUdMd2pUaS9MeXJuOSt0a0lTYjlyKzJJQWhLK3ZL?=
 =?utf-8?B?ZGZOdVk5T1Z4Z1FvYWQ0MXpuOXJVQjhCcnRjTVovbSthMDhjM0VBU2RBSENu?=
 =?utf-8?B?MTAvTGoyUVRsZmlZd1dMemZFTS9hSmNLQk1MRjNYbTd0djJhNmw4bWhnRFNY?=
 =?utf-8?B?ajRGb0JFRVd3dG5WQ1huVTZJUUJyYXdCOTFMWnpPQkcxa0tNcTRKdTFIWjly?=
 =?utf-8?B?dkFhMDl6NkFIYjVoVlBoS2ljdnRKTHc1OUh5S05nM0d0dzZBZGNXZWg4YWxs?=
 =?utf-8?B?SkplOVlPc2U1UnRlT3lwOEdYNTJrYlFxK2ZoWXlHOG55aEZiN0NCaEdSd1Na?=
 =?utf-8?Q?fTqqq8Pf7PM2VOsoychpgiuKN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9229550e-337e-4083-7488-08de3effaf55
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:08:21.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNovSOE9j8O3K9k+xAPQSpgOx5aLXHPT2LHHy2D0RFwjlUAbjEsaSX1PAiVLx2cuIOJwck292vbXaC4/HQJjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
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


On 12/17/2025 17:59, Jakub Kolakowski wrote:
> Currently we have BAT testlist for VF runs and both BAT and FULL for VM
> runs. Add missing FULL testlist for VF runs.
>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Acked-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/xe_test_config.json | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 65e685470..4d76fbe0f 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -11,13 +11,13 @@
>                   "default-testlist": "FULL",
>                   "update-from-file": {
>                       "exclude-type": "regex-ignorecase",
> -                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
> +                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VF, Xe FULL VM",
>                       "include": [
>                           { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe.fast-feedback.testlist" }
>                       ],
>                       "exclude": [
> -                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> -                        { "Xe BAT VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
> +                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VF, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> +                        { "Xe BAT VF, Xe FULL VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
>                           { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe.sriov-vm.blocklist.txt"}
>                       ]
>                   },
