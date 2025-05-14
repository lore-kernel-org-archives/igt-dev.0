Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD384C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20310E047;
	Wed, 14 May 2025 22:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfL2qFsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0A10E047
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747262330; x=1778798330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YqXZTEjjisxkTCoB0qEEp/+cMTw83+9U+xmQmTT8SXs=;
 b=CfL2qFsJ9gxpscmVMBt0CjGFCGX/ea4FmmbbkW4cICjHx8VnE3yKXrRc
 89YNCNxUtHHlI/lTfOe4IUrGf2W/j3as17qGaSvNugygg/DAmKRT7JDrp
 HUIxinft5vdRri18iQ30qnKxWWyf/szgYq+5o2bp6aMEu/asD4nE37Gew
 6iMUgqvrngjhhThFVbvL6dgywGTd5MlRtJ0YPstUImDEf7M0qdeF/QHkJ
 X2eDAFirJOqK3k4wdqZqxvWNf2E0tUn+J8MNCvMQ56Lr68ZtaodTMs2LO
 rbpMsd6QQFkJM6JnHXXJOS4cidq3A5XAcvUXHYyJHSscPR64hESdubNND w==;
X-CSE-ConnectionGUID: 8dHY594WTVWMorFyfVXcqQ==
X-CSE-MsgGUID: eFAMZHKgQIKWB0ItUKA1Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59815904"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="59815904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:38:50 -0700
X-CSE-ConnectionGUID: GFmmmds8TxCgvKMOIoxpag==
X-CSE-MsgGUID: HGD9KwtkTr2nGGWc98zhgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="143142125"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:38:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:38:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:38:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd//CCpMrFbE6sfOkDCo6EBgvokZ/U2+qKJ0VzEzgzV6WbeOMloSdBefg2sfPRgMBTu0FY8RrpY9exvRhWHRaDBbD4sdqlWnsbb2R5/3pRDTxfXpRgQwhOArYCPp59ZHaTLSSp1PJXPZfGbR1Pvs5B9TUMl/Nw90HYUYzPFAezgudOMconXv+khpv3eo+5cmTuJrVGbLyaxKJnH+szk0XFckM4G+hWHj2pXHHGIMcNSzitQvA0fqZnNeHurdbi0FHPIiVGpAzx8ltRWb9c1E58qxizS5OhqbZGQ8UdI4Gv+L7dIU/nbp1LGrVH/+XBVcr2e2mpuqySRo2yQsqMn8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ikrU616QglOZrpgyxjc50zLJ0E2Ri5llwQ+zvz9yHw=;
 b=umcb1WiwIFiV96j8K/a2uVDl9mDeFX8DAOMhZyK85UU7UUNnr5o17NznHGwPDLNIZI6uz7S6JD1UiaI6deYPSjb6wB+sXfSMEv1+1TXZ7lTNbv1+TDdt4ckSbuBtnkATh/tl5lMmlCuBBqcvJF5PnvKpK+/ydkpv3ZZZ4aI1CMBYGb+DjRukToN9UktEy0wDssNmZlw66jsNfr5DCF/6gc3rxMJB6MN7Ry+jVwnnHe/1KlS5Y/fXK4TdlFg0a//g1u9DXkLhvfMUAAh0oKumFSuuQPED5clNgNhnJAmciHnM58UHOKCGREog7tJq8FGkUQ+0s9J9+9XgZUQpULD1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 22:38:47 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:38:47 +0000
Date: Wed, 14 May 2025 15:38:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] tests/intel/xe_pmu: Add tests to validate
 engine activity with single engine active
Message-ID: <aCUbdHXgdRHRqGjI@unerlige-desk.amr.corp.intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
 <20250512070551.774270-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512070551.774270-4-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|IA4PR11MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 49506be0-f08b-42ec-f5f1-08dd933816e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S25zOWc4Rzhtd1g1cnRqOHRENXFvOEZ1TGNnUmFaYVQwNkhoeEJsekpodUli?=
 =?utf-8?B?N1ZpVE1QQjlsdXA5NWNPaGk1VUEzOTVSVXgyVTROM2Fob0xxUllkdWhRQmJS?=
 =?utf-8?B?Z2p5VzlFcCtIUGREOUNxanZ0RTlFeWx6Mlc5eTEzZXlwNmhNay9HamRmZzFI?=
 =?utf-8?B?WkNDWktHOUVjSTROemVWZC9hN3BqMTFiV1J6dUtuMDF4OGMwQk5jQ3ArVVc2?=
 =?utf-8?B?ZDFVSG84SVF4YVBmY1o5YThCb0IxcmJlUVZUTkdzR1VNUTk5RjNac3RFZFBW?=
 =?utf-8?B?c2xGdzdFa1hmNE5ZdDVrYlZvZG92L0pMNko5ODdPK2lhbS9OS3U1cEwyL3pD?=
 =?utf-8?B?T3UxNFlZK2x5RzY5S2VkQWNIR2ppamFBZDM2bG9oLzBRQkFWcS9McTU5a3lz?=
 =?utf-8?B?bTdMbXdCZFBHMHZxWjRONFVwZ2ZuNnFkNndFQnBPcmZxU3l2WlNWekZWc2d5?=
 =?utf-8?B?Yjc2UW12dTRvV3RFRWlkU3d2Rm5KRmF6TlJZYWwyajdqTnFBdU1GNjRPakdv?=
 =?utf-8?B?MkNtUnh2VjhWODkvcWtoODNPRTdJdHliZzVlZlZrcEJzOXZRNGxybEtpZThE?=
 =?utf-8?B?QlFRUi9CZXRmS0huUnJYd2duZDE5M0xmcVdJVVFRelJURFptZlZKeGtNUGZX?=
 =?utf-8?B?VlUybGJGam1BRlBVY213OWxlOUpwNzNSZC80YkJlSXlsVzhUTllNMW9iM01s?=
 =?utf-8?B?NXVTenplZWgwWTl2VDZ5b0FkWm8xNXlaRy9MN203Z2gxTk1YUEl6ZFIzby8v?=
 =?utf-8?B?K1MrdmZOc3V5Wkt3cE1obXZBRWZDUWd2d1hBcmIwWHlkSTdmU2FITzBqemMz?=
 =?utf-8?B?R1VVUTVHbkRNODNBaTRmMGN2S3NBRzdGTUtkMUJEU0R6QWRtdzdOOUk1K0NH?=
 =?utf-8?B?a2ZBS2Y2cHdlRTZwNkt0ekQwcVJ6ZFFrL0I1VnlsdVVjMldkb0swMW1xTWU4?=
 =?utf-8?B?MnV3ZzdlcGM3UXlOWkNpaWZMc25NQ3ozNzUvMkxyTkdSZlRScVRBcnZOMXRF?=
 =?utf-8?B?MVRYVGwrSml2TzdRV091ZE1Xdm5tUlJUdVh1WXhGZGc0UE5BcElnMkRjOHdo?=
 =?utf-8?B?WmRlQ0RyU1ppQ0Nab1ZpTUZTSlN5VmNyNlpJL1FoM0NnZnRZNUR6bUdCTkxH?=
 =?utf-8?B?ODBOTlJrMlgveG8zY2NrZllXbkNCNUNxYlduUXBYOXdwYVFpZ3NtMWFiQjlS?=
 =?utf-8?B?MDl3bFp0Tk5SZStQM25LNnJ4RW96bXpENGhxd0tYQjR0Zlo3RzhTYXBzcllk?=
 =?utf-8?B?aURUSm53RVh2SnpsM3pYOUlzdDdnWjh1Ymt4cXhGQVY1Sk9Ua3JDYnkydDly?=
 =?utf-8?B?aWVwemdOU1pPUkRmc0JUR3VaSTNSNDM4cSsycmJscmFlRFJNNHhTSGFndkNF?=
 =?utf-8?B?NDczTDVpbmRnUm82REpONnNjV3UreGJmRGlXQWZQV0ZkN1RBQ2F1NEhCOE9u?=
 =?utf-8?B?cmdlTGZoaExQUnFtMUtLYUM2aWR4Y0ZKbkVaOHU4SXQ1ZldEM3FiY3ErbStn?=
 =?utf-8?B?bTZzL0RMaVdQdzVEVWs4emlkUHFrMDQ3T1hOUWpDNWJSeDZnWi9tTVZxajlH?=
 =?utf-8?B?QWI0ZmtqNkQzRXlFU0pYeTFxR2pCNmo0Y1NGNytBQW9ibisyTi9TcW4yRmFl?=
 =?utf-8?B?L09GLytYbmdWSTVCZnQ2Q3RTbVRkWllLZHRvNXZLaDkrbFVLeERuQ015TkhW?=
 =?utf-8?B?UWVQSnc1L1RPYkZGVW9Jd1JFVjFPVXJpTWFsWW1tUjJKWmhmdUpkRndqZ2Zn?=
 =?utf-8?B?QWJ2VnhLZ2J5RXg2bWhjTXJkT05DZElQbkpRU0puNFBXRXBnWDB3QXM2aVJH?=
 =?utf-8?B?NzFPWnVHWGU4bFlXbS9VWGl5YkswOThuam9XM0lIcytWQU9lVE90cUVVMllX?=
 =?utf-8?B?bFozTk1EMjErV3F1K3BYdzN6aUYxQ0xRdUxxVUF0U0NSNlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlFWDI2YnR0d1Btdkg1OWZJb25NSXB3OW04U2QreTJHWGxjbVRyRXRCKzZ2?=
 =?utf-8?B?eDdNNE5hYWF3ZkdUZEt1bzl0ZXk1b0EzSWpYWEpaQnlOelpsUHV1RC85YU5T?=
 =?utf-8?B?bXk1RC9INU14OXdEWFZYeVlRd0lNMUNzZ2VxMWw3QlduNXJWbWtxUUY0UVhz?=
 =?utf-8?B?QlBzVzZjMVo1R3RSSUw4T3dqeFFSM0t1U2FiWTk2ZHpFNmJ5WHJRSUtwU1Zs?=
 =?utf-8?B?dU1rOGVkd2RwZDV0NkRZQ2dMOXg1dEhxc3lpTk1WYTYrV1FTNkx0Zy9YM0R0?=
 =?utf-8?B?NnhkN2F4Rm5Oazd2dElXdmEvd1BMbWNPaUtzRUcycktzaXNRZGo4cW5sT3Js?=
 =?utf-8?B?dTZWOGgyekdybnBmdGFKVFYraVkwb3JsMEtFbzFWUHVhQTdFWUdsMWs3ek5p?=
 =?utf-8?B?V3luNE4rMm16dTlkVjMvNnY0NGRUQTgxOEtkL1Q0TFB5WTJ1UGZESml3MG5M?=
 =?utf-8?B?UlQ0UHpnbGJYbmNJWU5LU3dyNEZnaHFiZ3g3ajhoWUd4Q3BqcUhLdEF1cXdk?=
 =?utf-8?B?Qk1YcElETG8xZHExUFc3Yi9zVUpyUUFOaVN0ZW41eHI2T2ZzcGkySlI4ekIx?=
 =?utf-8?B?SGEwU0ZJYXkxdFV5WHBIWGRSN0c4L1lRcnhFTkZDUDZVQ1VZaHByREt3VE11?=
 =?utf-8?B?Y0hGWURZRXFIOFpaM3ZJUlVJcThoRi81WDliaDJRenVmRmwydHp0MVl4OTlO?=
 =?utf-8?B?MmplSWlnQmR1MDVyMGFWOTNHUFFJNDJBTmRXL1FFSmJqMmUrSUhST1lETjBq?=
 =?utf-8?B?ME13MERnU2R3VzQ3bFFReTBPelowVWpjTUxmUTF1UENCemQ3MXVwT2s4YTRY?=
 =?utf-8?B?TW5zSWh4UzhaRGlNZmlpVS9BY2IyOW5DSjdKbWRUZTV5K3diTDNXN0JvMnNU?=
 =?utf-8?B?eGxwaUQxZ2x5V25tMHFrc3k3K0tMejFsb3Nqdm1WQkNEYWVPZE5PN2dOelBw?=
 =?utf-8?B?LzduTHVFTWtiaXVUSDRwRWFKSGhMWm9WNzBzMTV6NlpqcFAvSVl1SWdNUU9m?=
 =?utf-8?B?MVNHdlNNN2RXeDZ0L2JVQUlFNThMd1BsaFl4akVJSnliSTVSN215S3pzVEtU?=
 =?utf-8?B?Yys4bUNrTHR5M2VVWDAycGt0YUoxcWN5anh1dlQ3YmkveDR6Y2ZjaTVuYU45?=
 =?utf-8?B?QWlJNnY5OGFMcDZQbTZ3T0dUOHVRc2M4SnJTRGtwK2F4T05qS1BXZlJrdjFC?=
 =?utf-8?B?b0hSS2I2YzRIeGJnSExOOEJZQU95ZGhGaVdGcVpac1pkRUljc0JTbWtyUDRP?=
 =?utf-8?B?M2VFK2JnSklHdHFIQ3pMVHZlOWNROSt1Qmx5VnM1VVBYdGMzMTJZU3hmc1Rj?=
 =?utf-8?B?U21oWUJlZlFscW82ZTk3N1NKWkhTNUpQK2N1ZEwyTmdjNGtoeGRaaHNMSlBh?=
 =?utf-8?B?SE5JRkMyVHI4WXpBdFB6bHVRS1BFRmwyZ0VrS0FPRUZuSituVzZaUmxOSnFw?=
 =?utf-8?B?R0o4Z0lwSGc5RStRU1puZW1pYVVWTVE1YjRDVnRQNko5a0pvTkI1Mk54azJl?=
 =?utf-8?B?dEFjQ2hpclpjS0hEZm5KZTk4akMyR1ZvV2JWVS9QMVErUWN3NkJtZzUwN0Zl?=
 =?utf-8?B?b3Q2SVJKekNJMUVFcVNhdDd6bkM2ajU5dXVQMjZYZXlkNDZlZlNxR1F6eWEv?=
 =?utf-8?B?eEpzdVBKMFl2VmNhSHYycnN3dHZMWENEcVVtY2lhemg0am9WWEFwSWliaW5Y?=
 =?utf-8?B?TitzYVg2U1pIYXF2dTdDUDgrU0FYS28wNW5sYmVxdzBsS2pGd1piMXlKU2Qw?=
 =?utf-8?B?UVZoUUFqcGkwTzBjMUU0T2pHOW9tR3cwRE5pM0J4THBOczUydFZ1ajdDS1ZL?=
 =?utf-8?B?VGF2WXNlQ0RHSmNVWFNmSS9BSnlkbG9vb2Y5YzhyNUhIWFBmcEMyVlFSVEl5?=
 =?utf-8?B?alQ5Ump5U3E2UmpVNEJQazhFK3B6Y2VCNGRzWDhFUzlyNzlxMWxkZWMrbDlM?=
 =?utf-8?B?T3YvTGo2cTR6dDhLUzA1dnlndUJvbzFNYzM5K1VHQmNKN3NieG9uaDV2SVll?=
 =?utf-8?B?VnlPY2w3a0pORGJQS21xUTZTcjN3b1ZyOEhIejN6a2tNUG50N3FBRWtQcHF2?=
 =?utf-8?B?Y1ZwbmErNldKVVYyN1BjM3c1cGxDWEJvZ212aXNqZ2p0TnlHLzhpb3hIWDNG?=
 =?utf-8?B?c3ZoMjhCcUU0bUJOT2pIUXlDY2QzZklyc1VOMmg4UWFhb01wTkZLdkllYzBC?=
 =?utf-8?Q?P6X9OryoXssLTqJa6J+RZ08=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49506be0-f08b-42ec-f5f1-08dd933816e1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:38:46.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGwwtxys3JBO7yFV4Fr/6bjobDL0nhriscXkmnUk2ZPz6yM83AgPCKtQ1a7pkJ/wxVPe77pwIu4k7NFw9N67QkADYI6ev8JWKvLC5ePM+38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

On Mon, May 12, 2025 at 12:35:49PM +0530, Riana Tauro wrote:
>Add a test that validates by running workload on a single engine and
>checks if others are idle.
>
>Also add a trailing idle test case.
>
>v2: use allocator
>v3: rename function to check_all_engines
>    use flags array (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 102 ++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 101 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 52254dd34..cd56fcd54 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -24,6 +24,14 @@
>  * SUBTEST: engine-activity-load
>  * Description: Test to validate engine activity stats by running a workload
>  *
>+ * SUBTEST: engine-activity-single-load
>+ * Description: Test to validate engine activity by running workload on one engine and check if
>+ *		all other engines are idle
>+ *
>+ * SUBTEST: engine-activity-single-load-idle
>+ * Description: Test to validate engine activity by running workload and trailing idle on one engine
>+ *		and check if all other engines are idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -51,6 +59,7 @@
> /* flag masks */
> #define TEST_LOAD		BIT(0)
> #define TEST_TRAILING_IDLE	BIT(1)
>+#define TEST_IDLE		BIT(2)
>
> const double tolerance = 0.1;
> static char xe_device[NAME_MAX];
>@@ -165,6 +174,32 @@ static void end_cork(int fd, struct xe_cork *cork)
> 		xe_cork_sync_end(fd, cork);
> }
>
>+static void check_all_engines(int num_engines, int *flag, uint64_t *before, uint64_t *after)
>+{
>+	uint64_t engine_active_ticks, engine_total_ticks;
>+	int engine_idx = 0;
>+
>+	for (int idx = 0; idx < num_engines * 2; idx += 2) {
>+		engine_idx = idx >> 1;
>+
>+		engine_active_ticks = after[idx] - before[idx];
>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>+
>+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", engine_idx,
>+			  after[idx], before[idx], engine_active_ticks);
>+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", engine_idx,
>+			  after[idx + 1], before[idx + 1], engine_total_ticks);
>+
>+		/*
>+		 * If flag is load,then check all engines for load
>+		 */

You could drop the comment above since it's clear from the below checks.

>+		if (flag[engine_idx] == TEST_LOAD)
>+			assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+		else if (flag[engine_idx] == TEST_IDLE)
>+			assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
>+	}
>+}
>+
> static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>@@ -216,6 +251,62 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>+static void engine_activity_load_single(int fd, int num_engines,
>+					struct drm_xe_engine_class_instance *eci,
>+					unsigned int flags)
>+{
>+	uint64_t ahnd, before[2 * num_engines], after[2 * num_engines], config;
>+	struct drm_xe_engine_class_instance *eci_;
>+	struct xe_cork *cork = NULL;
>+	int pmu_fd[num_engines * 2], flag[num_engines];
>+	int idx = 0, engine_idx;
>+	uint32_t vm;
>+
>+	pmu_fd[0] = -1;
>+	xe_for_each_engine(fd, eci_) {
>+		engine_idx = idx >> 1;
>+		flag[engine_idx] = TEST_IDLE;
>+
>+		if (eci_->engine_class == eci->engine_class &&
>+		    eci_->engine_instance == eci->engine_instance)
>+			flag[engine_idx] = TEST_LOAD;
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+	}
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+	if (flags & TEST_LOAD) {
>+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+		xe_cork_sync_start(fd, cork);
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE)
>+		end_cork(fd, cork);
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>+
>+	if (flags & TEST_LOAD) {
>+		end_cork(fd, cork);
>+		xe_cork_destroy(fd, cork);
>+	}
>+
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	for (idx = 0; idx < num_engines * 2; idx += 2) {
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+	}
>+
>+	check_all_engines(num_engines, flag, before, after);
>+}
>+
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -547,12 +638,13 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
>
> igt_main
> {
>-	int fd, gt;
>+	int fd, gt, num_engines;
> 	struct drm_xe_engine_class_instance *eci;
>
> 	igt_fixture {
> 		fd = drm_open_driver(DRIVER_XE);
> 		xe_perf_device(fd, xe_device, sizeof(xe_device));
>+		num_engines = xe_number_engines(fd);
> 	}
>
> 	igt_describe("Validate PMU gt-c6 residency counters when idle");
>@@ -574,6 +666,14 @@ igt_main
> 	test_each_engine("engine-activity-load", fd, eci)
> 		engine_activity(fd, eci, TEST_LOAD);
>
>+	igt_describe("Validate engine activity of all engines when one engine is loaded");
>+	test_each_engine("engine-activity-single-load", fd, eci)
>+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD);
>+
>+	igt_describe("Validate engine activity of all engines with one engine loaded and trailing idle");
>+	test_each_engine("engine-activity-single-load-idle", fd, eci)
>+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
