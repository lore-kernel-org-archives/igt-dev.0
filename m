Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F725C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2D10E7FC;
	Wed,  5 Mar 2025 16:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtEcGTzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCFF10E7FC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741191462; x=1772727462;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4BTKexjrYmERt+bGUIulmYMjr8VOqBvk2DXgaFhUW5w=;
 b=CtEcGTzRW7QHNeAWkHFK757Sm2kLsaENcYi2FfcXJ3xOi42bJ4ByDn+T
 8k+rcJlgNBVlCysmCeDb+2NZnlPdgfZXu8FT2JdfG7nHGludVg6VGI/Y0
 +Jx5/0G0WIAGPItTopVnuX9pWsAscfKv4VF6rJrcCJcA7SOKMFp9w1Gbv
 nxbmNdYQzBzVPZa5LcHjT2y0dFYppOPa4swv7IxHBcjaT1YhTOgRctS5+
 /+mvveCLyhNjRs4JgDWL8S65TO3sa2gFOrLl09TdgJ/aOkrS7fAgRTe9W
 /iJ53wCO2vPvGa87N3IjsTakq40lMhUtMl7Q4poAHeQLsNcp9BWfanG/7 Q==;
X-CSE-ConnectionGUID: D61O8JVMRCqHKXAhBKd4lA==
X-CSE-MsgGUID: H0xmAnGlRue9G/JwkT72Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45934913"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="45934913"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:42 -0800
X-CSE-ConnectionGUID: gTnXW9DQSKmYDFpk3gDZRA==
X-CSE-MsgGUID: esoH/MBYTkOtlzaQMes9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119650572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:17:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 08:17:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:17:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:17:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xp4Hgha+ddmDvjYqW88D+JXgjXOHJHi6Lp3ejaW0/1FcnM7gRRVTc3P4jWeU1fz4RVBnxixH+AS4ePy4Ha5ErFC/XQD3K2Iq3SfNS+dy3hAIVkrTBWLNuORioCq6ri+ZtBCR6RZgxA7WkofPsLg/jtKd6QcbscPyvwVkIhiKP9RbflXzZ9Kxwbc+MGFjKcVSBBSniFdeBEOZwq2gloj2vTgRBrQA73tXP6z0jWWLU4yPl05rPkRJplQew+4eAa7eAixbV4edlpwWI9xiVhaAXSOOdgegit28jQf/D+2/aWrzD+uKdQrBnexNKH7lSsSO07GDrsA6U1QZUqYqVlUfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X540ioRAl7l7wFjhG8P/tw64GR0B8fxD14h5ijnzfFg=;
 b=bSETtbgTY96d+ef7jXmVdP74WfqoZIGwr4Z+5ARQUU3VIE7uhZexhzu4vXWfWF/gMORiE+23DuIYSZAvsNL9hA24IapNXfcZ7o3Cox0HFhGa0D13KVvIrgIXxjut1oHm58fhOtwLc9eE3O80hJ9R/uUyzv7fW8EFI5qyE/d6RiNGe6BGM0Ou3/ahkEMzvoseNlyE6lrG4v/XI3q6Slzcq83UfR809Bru2FjHu0yEm1/ZLwwJuSaa9NUyuEuPztjdqL7zN5bhMOBLfOK7J3zZfshAasOe15tH6P3vXAjO33162Kc5OShEwc0fLysiqgikYrU7+eeEKS4JdFBytSda6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:17:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 16:17:10 +0000
Date: Wed, 5 Mar 2025 08:17:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Modify some OA tests for simulation
Message-ID: <Z8h5BGExl6nS2wZZ@orsosgc001>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
 <174114628867.898356.5193432287277216277@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174114628867.898356.5193432287277216277@b555e5b46a47>
X-ClientProxiedBy: MW4PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:303:8d::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d48b2b-7ebe-409f-a536-08dd5c012e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azZZZ29KUnBpK1RMWlM0V05tZkJZbEpIVDlucUQ4ZzN1N2ZaYzVCcUZETElY?=
 =?utf-8?B?TWZIdzUva2hvR24zVnhlcjY3dkJVQmFHYmxSMitmWUkvTnU5K3ZOckhrcVhN?=
 =?utf-8?B?bkViVU5KRHJqK1JmQThKMkFaUHlLbjROVm1LQjQ4ZzBFeVltb3JVY1dIRVlh?=
 =?utf-8?B?akpmVXBOZENVSkxVajNheVNPd3dFU2NmTUtBd1duWlNTOGdLSXBrMlFyS1lS?=
 =?utf-8?B?bmMxVGVoQlBvdWdKdVpVWGJyeHNsQ0JZVGxYTm5vU3ROUDFZVVEwQVQ1aklL?=
 =?utf-8?B?TUMyU3pTdDl5Wm9SN1FhMUdOcHMrRmo5SFNZUHMySEtEMk5rYXNBS1o4aEZC?=
 =?utf-8?B?RE5BUVJVYjc5b2psQ0VMWit2bG5FTmpIaVVwQzJyQWl5L3d3dElhYUJxZjdy?=
 =?utf-8?B?alhSaTZSako3TnBWYUYwUUFQNEo5dFdpa0tiSFNpYUxFKy9IVDJjUmR6bENo?=
 =?utf-8?B?V0oxK2JtTURwUnkrMGxtaW9LUFhKY2NhM2o3c2ZWeW5HRFA0Z1hkeEhGNGUw?=
 =?utf-8?B?aktoU044TGdmUlJhdFphdVhsbEtKNHVYUWVFOGFwVnBkV1pORzN6VjYyYUly?=
 =?utf-8?B?TW9iWFhwY0pRQ0w5ZlBvOVJCQzlIc2g1S3EySldqMkNxSVpRZHNrQXphb2VJ?=
 =?utf-8?B?RFF0OW1CQ3k5Y1VOdUtuNTljM1dNelZaQlJTMWxJVm5LUzRqVzNTdGk0UFdS?=
 =?utf-8?B?eGRlem9yRzhEcW1mamxPL1J6bEg5OStPUEZHUjlpMitLNXJOcjZiZ1JiTFJX?=
 =?utf-8?B?NzJLYjhtd2VzVVRYRkJRYjQyOWRraW8wcmhTQm9Ud01sRmZiVU1iVnNzdDFo?=
 =?utf-8?B?dm1XNVYrVWVTOWgwQXJKMm1mNEozNmJTYUpsYW84TkhwOXRzeDJ6SUJ6V2lO?=
 =?utf-8?B?WEc3aU1idFpJc3N3VHE2aFh2N0ptWU84bXFqQXkweXo2dGJWMEFTRDUzOUpt?=
 =?utf-8?B?aVN5c1E2MHg2VDJOd2hMenZLMGUxWG9UMFpyNFJCcWZQTzVNdTQ3bFNmVW1n?=
 =?utf-8?B?T0I4bVRLcC9NRWQ2OWxoS2pJdERMZzh4WFNueDZRTHpFSEVmb0dvM0p5UzBZ?=
 =?utf-8?B?SEdnUHpseFYwVm10TDYveGtOaGQwVEkwOFdvbkNwMG1BaEkyQVNTbmlUR1ds?=
 =?utf-8?B?S2ZxbFRCeWh0c243QlZjbzdMNk9iSkhtNFJLZmYyMEtobWlRZGVncDVaVUZs?=
 =?utf-8?B?QlVqeGxBOEt6d01naWhFUmVkb3RKSlVhK3o2UkhiazV6VGV2U2JQNXhRaVh2?=
 =?utf-8?B?eW1iM0tPSTBvUkIzcGJFcXR1UW50TnM3Um0xbjM0d2UzMVVHdE9rd2hqb1Rr?=
 =?utf-8?B?T3BMak5vbCtTcHVPbnRXSXBTN28rZ1NyODcrTDBRbXplTk5uZWd6dTMyWGxI?=
 =?utf-8?B?bE5tSEwxcGVIMFVVbWw3MXZKWHhGMzduWG52UlMyaFZBYlFzdUpTRHpnWE9r?=
 =?utf-8?B?bnVvblZNc2p5TFlMUUJxM1hHeTczc1hQazE5dllkaDJHS0tJNmpvNDIwemNC?=
 =?utf-8?B?YVlQbFVzS3hxdjlBNVVLV281T0dOczdKSkQwdExmem1uS2NwQ0FqUWVjWkhm?=
 =?utf-8?B?OEwwYUNkWFVoVGFBNUFLb2RhZVQxK2dBMjJHVHZUL3lyQW9SclF2S21vdWZj?=
 =?utf-8?B?dVhnaHY2Z2xMSnc5N3hyK1FDVU5xOCtIV3lzSHhwN3pzUENDMktBNzBCZXZR?=
 =?utf-8?B?akprMlIxeFdXOXBTbUNzQlM3Z1FqdW9JMUtXZk1jeTZvZ29HZ0w5bCtSb3FW?=
 =?utf-8?B?NG04cFFUL1FFTTFqS2xjbUN4Z0RNWnBXUitucldCTHJjbnhGUEFZUzNsQmlK?=
 =?utf-8?B?TG1YWFliSW42MEFmVG9vQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amMyT2g4d3NUSS9SRFE1Z2Y1Qzk2MUhKdWtNRUhkY1F4NlEwL3BpOFpvS3ln?=
 =?utf-8?B?aVJoTythYnZ3QVRSdmpsQ0ZuUnUvU2x0YTc0TGdVTExCYlg2c0dJc3ZsRlht?=
 =?utf-8?B?aUsyczYrZDFKLzg3blRKY1BTS1JuYS8zQWdoY0RCNW8ycmNEbjcxZHd5Ulpp?=
 =?utf-8?B?Z1JuUVN0TzNaenpMaTAxQ210aDVuV1N0TzRRMnIxQi96dCtDZTZtbzdVNVc2?=
 =?utf-8?B?aHZVeHU2U2c2K2VLOHpwL1oxU2l4NGYvSDQrcGxBa292L1o1OGkvOE93N3pO?=
 =?utf-8?B?ODNJWmJOVTZ6TUZDYlIwYUhSMEJHNXVYWTFkRDIzQXQrTnNZQnp4THU3MHZB?=
 =?utf-8?B?L1d1ZGszWExvTlhvdEFqUVRhblZCL1N2UWdEamErZGFmajRacGZTSUFuM0Fz?=
 =?utf-8?B?VmJXZnp5cDhUbE5kMThhbEhHY1BpQlk3d3E4NGVwYnQ4SXVOc2I2ZmR1RW1L?=
 =?utf-8?B?WnhHT0VTWTcxbVA1QUZ3R0dSS3dXd29rZUIwYnlKNjV4OVlUOGNXRWVMTk1r?=
 =?utf-8?B?OUVwdE5zYWRUMVhCRWQyM2pYQnF0TmE3SlB4ck5QZUFEdisxL2RwSlRlTzNE?=
 =?utf-8?B?dEt4c1Y4QUZmalBJZVJUMlFybkYrVUJzeEx0dW9DdXVTWk5DRlZxVGIxckpI?=
 =?utf-8?B?bS9Hc093Y2U3L0ZOTm4wRW93enpac2hsQVJtUVhUbnBYcDE1NzduYi9jRkhT?=
 =?utf-8?B?ell0aDBka1I4ckx6TEhnNHpKaFhwUDlHWFRwd1RBdTdDZmxmbi9rNUdtZHBk?=
 =?utf-8?B?SEg0L2NTT1YzVGhLQ3lmQXE2T0RiR0FuanFSL2tjNG1MenRnUDc2M0Z4WkZl?=
 =?utf-8?B?VnNkblBHSWE3dTkweUlDQ0U0ZEg2M04rdjlvY2FaczU5RDloTVd0cFVOV3Y3?=
 =?utf-8?B?cGcrYnpaSERqekVBVXJHeFl6SjExd2lUcU1CQW56a1RYRmR4TDFxNndJR2xu?=
 =?utf-8?B?RnlpMVdHSWFCYm5JSDNKY2dUOTFsaElwamRQa1liQVFPWllEY1Fqd3FQRlhn?=
 =?utf-8?B?cEp4YlhreDduOVJnUGppbE1GY2tubVRXYkJVek5SOUJqRGErWERjTGViMUsz?=
 =?utf-8?B?ODBtK2t6M1FvQncwcW1oTWFnUlVtbmd1c2V4aUFwRE5ucHdiZGU5R2xqNm0z?=
 =?utf-8?B?Z3BwNisyVFBVL3ErYUN5SUJTTmd0YlR1VmdIY0F2UWplUlpTdExKVFZjUk9v?=
 =?utf-8?B?ZVhTRm02T0U5ZjN0ZTMrbUJDd2NJMDQ1cTIvbzZSYzJ0VHVmM250SndrYjhZ?=
 =?utf-8?B?bW9BakRtaVZTbW9KMVNOdTYxY3dta1d0Qk8wVVhqaXNxVE85eEczVzE4NDdT?=
 =?utf-8?B?SVdOb2s0Ykl1NWpkM3J2VWdKNDU5NnIwMnBoMlhZZWNzR2RpV3liY1ljWFV5?=
 =?utf-8?B?Zmk1dVVpZDRrTnN6Vjh4ck53bGdGTWdXSkVMUkNaUWRyZldXYitReGpFbEt5?=
 =?utf-8?B?cXlXQ0hDMTN1ZGkzOVdCWVJ4T1d6WG10S1JGNGlCd2ZPbUdQSlpHZlJTcktZ?=
 =?utf-8?B?VndDb0l1KzRRWUNQWVpVSEZWeXN0REFaUHVlYnF6NXhibVMxSklFYXBqd1Nx?=
 =?utf-8?B?bSsxeUFqcjUvejJLSHFadEdNTVNqc3M0TGFISnJEL0Z5Yk1OOGVXazN6a1VM?=
 =?utf-8?B?c0VYUVhQZHk1Y2JTQ1JWdUg3cjl5YStXN2pJN2dTWS8yeGNFRjI1REIwVjht?=
 =?utf-8?B?Qk1BM2J0MlhFNC9vdEl2OXdmeHY1Rlh0NXFvMW9tZXRYdlNPMmdkWXhDenBP?=
 =?utf-8?B?Snl0UHEreUFJWnc4ZFZZRHF0WGU2U3BpMXdYelhoM1E4VE02L05HOUcrL2JX?=
 =?utf-8?B?RjlSWHU4QVJ5WFhjeHM5U3N5TkxOZk8xbk1jLzZVd3U2OHBkK2hCWDlRQTVa?=
 =?utf-8?B?dnV1QmpHc0lFQWR5dWJSbE5kQ3UxdEJmazUyUWwvOUdZbFVIenVXS1pzY3lU?=
 =?utf-8?B?NUFNeWJVM3dhKzBEQUNXZnlQMjdmSDlJdnFaVktBWWlnSGtMdjFERWsrVktp?=
 =?utf-8?B?WHZwaGp1OXc4NlREaUdOSjQ1WkN2Y29zYWtnL1pRK0VEaG5wbWQ2VnFSR05z?=
 =?utf-8?B?U0FYZEZSaGFTYnVWam82OHlzTkdwdHRjeVVxOTQ0OXQ1Z3J5djM1YVRDTyt6?=
 =?utf-8?B?UktNVlAwbDN5NmNSeWlvR3FhL1JZS0ZteXMwNHgvVnpYN3JGbXh4akJYY2dJ?=
 =?utf-8?Q?bXrUNCnP/kEuvqHhRWYRi80=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d48b2b-7ebe-409f-a536-08dd5c012e73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 16:17:10.2531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE0TXlsGtWmlt1irUA/AyD6wwP6eBuhTeoBSp2ZwbTPOYiLncgu413hmMBfa0w2GWk/02bDoCT/6/tnDQz5BIX9ZdYYchyusihjvXPv0sjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Wed, Mar 05, 2025 at 03:44:48AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Modify some OA tests for simulation
>   URL:     [1]https://patchwork.freedesktop.org/series/145805/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12701/index.html
>
>               CI Bug Log - changes from IGT_8260 -> IGTPW_12701
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_12701 absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12701, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12701/index.html
>
>Participating hosts (43 -> 44)
>
>   Additional (2): fi-glk-j4005 bat-arlh-2
>   Missing (1): fi-snb-2520m
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in IGTPW_12701:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_flip@basic-flip-vs-wf_vblank:
>
>          * bat-apl-1: [3]PASS -> [4]DMESG-WARN +1 other test dmesg-warn

Unrelated to this series

Thanks,
Umesh
>
>Known issues
>
