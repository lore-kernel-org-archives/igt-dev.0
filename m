Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D77CED26C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 06:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9DF10E03E;
	Tue,  8 Oct 2024 06:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVVs6LaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E0210E03E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728367665; x=1759903665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=EK4I6EY/YWSeFpJcHT3cKpQvpNqWTZrFHi9g/hFBX44=;
 b=RVVs6LaWIKx46rEgdFyss/I6gT7kKVXXTmtp5kooCqY9F0Yo5T/lg/CB
 kbb6NUBnAFgFslBOZvBCFTMzPSUPfaFKZ8vrZ7M+cyir6qPhHY/4ujsP7
 50x2DfW6VmUKClfBzDsEYxJjvHy+TFWggF0bZ7jrUy8yvwPBADItgqbgp
 98Jj4uXNPIFPpyqqUhwsdjBGykyBee/q2TzTGuUJ6nmUplqnvHWgrQgzw
 iScY/jU1W1IV5B+GDYii4HPUZHmyqHukfC1WUSAR1rE1EZcyXg0uITq3w
 hLa1q+w7IIaEAmk1rFGKG8VwrnOnDqvBNdsPMGxZCak038NfF9X7R/O28 A==;
X-CSE-ConnectionGUID: wCIFmtQpTgC+as4laaYNdQ==
X-CSE-MsgGUID: NkTvBaEjTGWGimvw0BMYQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27707961"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27707961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:07:45 -0700
X-CSE-ConnectionGUID: hntGaeYTQPuRw6qFOIWKaw==
X-CSE-MsgGUID: x7A98oY1SD67ydosFNfPvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75398719"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 23:07:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 23:07:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 23:07:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 23:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9D97u/vlgbIz/qD2y80VRiO2BzGW1WEySwdoIqW2Izoy3OohXnm0kGcKOx3RvhUO4XEegnY+giFDh4EON2sktY1GZWReYnOpdb2tU26waxybIorvOHH33jgDA2TpbnqR7ysKI/Rc/6ufFwOiycntj44gHtQaDkx4xE7tAj6+ZIMnpf9z8Mk5ZnJgc6lUwYA5KjeKp9BdlfTbpuQjCp5/MKTBMdztXCEQi2/K0k5WsaNwkpNr5r1O1VwGJGMBaq77/TAzdDGf+CtDHpRJTPSqhf8OEDYZ/5xMbjKjBFFYAMcp1vtYMvoDbw80F6qwC35KUYkH/Aj2A6P3DkQUaCQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izxfcTXjydYA53/Zm7goWNLswBr8b68Z65DNSWUKZi4=;
 b=pQG3S3mIrfde6vQocAzmOPtFTGoiszylC2tREYbzzSC3g8V3Y5uRwpTpZXYXjeu2FGItJuTwLAj8zG6eorr839sbQDLSXkSIBMZVD1F8CGKLWWgOJmgqLqH/udgZYK1p08NsLd1qkX7dJ1vHcPjLhvv/GeNJtIrkB9EWeoGqVrSWoRMzH9oOX/x1JoxzKjiQWbj1kfzZZYs74LIdtjVye4R9G2C378gLTJ+0rG/yY1dt/q18JVEoVzr7/ZDkamSwczmDlAKnSg0buKh9y7HsQwMX+1g2rfK+asROvlVkpPwHjOKziQUPt4DAbuacV3rU1d4b1WRoZxdFsQRGpGiTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 06:07:41 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:07:41 +0000
Message-ID: <22b4a1ec-aac0-4535-a591-3dc8e2437830@intel.com>
Date: Tue, 8 Oct 2024 08:07:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/uwildmat: Move to a dedicated vendored
 library directory
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
References: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
 <20240913104434.56529-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@intel.com>
In-Reply-To: <20240913104434.56529-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU7P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::20) To IA1PR11MB7824.namprd11.prod.outlook.com
 (2603:10b6:208:3f9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7824:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f70941-418d-4584-c7b7-08dce75f84ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkhvRFQ5YU9QM3lkcWg3U1ljT3Y1SlRUU1FldDBhdSthVnVYRGlJenp1akNK?=
 =?utf-8?B?SkI1OGZNOHFTcEFQb08rRXExYllkaUVQUnFScmNTU1I3R1lrNThsZWFPL055?=
 =?utf-8?B?NG1zQm1jR2NHSHlwZ2lhL3BxNGZNdGNaYlZPSE8zSUtYbTg0YTREK3E1eWNm?=
 =?utf-8?B?OG9OWUsxNDFrMVJMMmowa05haVZKQW9HOVdDUFgrN0hiQ2pkTlJTYitWQmFa?=
 =?utf-8?B?SjYraEpQbXNiZXpua3VZU1NPaGM5dDdNNGhPVXFGODgyb1VHbSsyeUQ0MDl6?=
 =?utf-8?B?WTAxSlAzVkY3VzMyeHBBdzVwWEhwOVpLeVpLVkdaSlM2QWIrNmlaT2FCVUw3?=
 =?utf-8?B?M09uYXhqbElVOS9hcFBRKzNHTHFYOWM2bGVCM0ZoYVYvSVQ4VVhmUGdzWTFI?=
 =?utf-8?B?TmRkL3E1bm9oNkN0RTF4a0ZXQ1JNVnlkdkk3aFpkcm9xRXB5NUlyWitRMjA0?=
 =?utf-8?B?YldlYzhGK3NGMHI3dWhBUmdBUUtKL01GUVJTUkVOeE9zUFdHdUtndmxmL2Zj?=
 =?utf-8?B?cFdrZytkRS8yK2ZoelUxUG1iUXhRc2V5amtROXRWekxudUZNb0xEbjNkYU8y?=
 =?utf-8?B?YklRNC9Bd1NidkZscXVYUWNqS2kvSnVTOXJ1dUhoS2t2MVVxa2hGZVQ1M1RQ?=
 =?utf-8?B?ZXFHeW9UWG5BY28rbWdIb25NcFFwL3BVczBpUXpDbHlhS1JJRFFNNWt6RnRO?=
 =?utf-8?B?TDkrRk1jT3VsRFc2bUMzVFFzb0gvMGt2VERJOGVidHJvUVhUMGxqUzI1dnph?=
 =?utf-8?B?dVdMb0VFZ2VmKzB6bXcxdHRJSWJSS1NieFFzaHhDUEtrelFWdjRnVEs4OUYy?=
 =?utf-8?B?eWZINDhQcWlaQzRseEx4eXdzaUFpalFmeXZCQUpkWjg5cFNQOW4wTksrZWUx?=
 =?utf-8?B?ak5BZVZqRE9UQlEwVkI1aWlqQlN5SzVIYVI1a3p2RE1KNUtSaVptWUpkUUdn?=
 =?utf-8?B?VWp2RmticWhudS9XTHUvc2ZFQzJHRjR1cE1NUHVuNW04dm1CazM4MW9JUHkr?=
 =?utf-8?B?eG9wUWd6bG9SdzVLUno4UUo3RHhvK1BwNlpDZUY4cmU1bmtFVU5aU2NBbnVM?=
 =?utf-8?B?UE84TFk0NWZzM2tIYktMaGkrMVdNRjNxVUpVaTBlSFhJUmZlL3dGMUs1Qy95?=
 =?utf-8?B?LzNLZVIrQ2N3dm5WbFVJamFhbTFSOUhlZlhic25QcnFSR0UrNnVieitmUWZo?=
 =?utf-8?B?eGtMamJBSmpjTlNTR2NDdStHOWJ0TmV5VXVzWmoweFl6ZUxRVzF5bVpSdHA1?=
 =?utf-8?B?R2NWdmJRZkxlTFN2V04ycVh0MXRNZUQ0ejFtdEh2Uk5WRnIvL2VKL2kyamRn?=
 =?utf-8?B?dGgwT1pvOUtWT1lMekgxNjF6WjhFdkJpNDZLSEhMMi9OWUwxdVFyVmJ6Vnpk?=
 =?utf-8?B?cFRBNXYyeGNLN3RWZTlXM3ovNnRUMmd0TGtTL25HN09nNWhRTWNiQTQyeHcw?=
 =?utf-8?B?VGtZdENRRjdOTGFYUjZ6Tk9xdXdHcDQyeGxlSkovN0FnamFQU013dXRCSW9B?=
 =?utf-8?B?YmhRU0piNE5tNjdnOWtwOElRbTZZaE14SGtRTytLbFUzRVFqOVRUZ1ZiVlI4?=
 =?utf-8?B?dkJOeU8walhLekRUYy9rdjZ1NS8yWHhqT0hsYUVud0lYaHUwVk1wV2pWRHN0?=
 =?utf-8?B?aTJoeGVSbGVlTTZUQlQyajVvU2pjN1R4VlhpN2lhMlFHZmtvWkxoZ0tJbWZn?=
 =?utf-8?B?aHZYb2NhWk45WDFrczk0ZkhlNWpiVlJQM1dkbGFWcEpZdm9PV0pPWXd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWVNWFY1VXZHNC9Oc2FramhXTFBHNHBEUUR0K2hlZW9uM0pDcFRCV3E0MWx1?=
 =?utf-8?B?MHZSM2YvYytIZXpEaURDZWgram1PNVA3TGRtWlBnWGxaNXUwQ0d0NUx3ME1Q?=
 =?utf-8?B?ekhXN0RBQTdMRkJoQzR0MGZuM3hCZnZqMytPOWtmKzk5MFdwVnp0VDZYU2xZ?=
 =?utf-8?B?b1M0RmZjaHRzMlRsSjBYY3prRTNib09LVS9keUwvN3FSUUFpQVVSWlVheGhk?=
 =?utf-8?B?VUVVMndXOTBUWW91VmJPQ1o5WTYrQlY3M05vTVd1RWg0THpKaWEyam5pWmdR?=
 =?utf-8?B?QStna2llWkFYZHkwdCs1K21MU3RhRmdGRnA5QjRrMmJRUFI1NGEwMVFvZDVK?=
 =?utf-8?B?NFFsK1RhM3Fmbk5jVmJvV0R1K3RWbTJZK0NIRHhMditnNU5NLzJGZXFPOTNy?=
 =?utf-8?B?SSsxTFRPZ3NRQ2pxM2ppelZvTEtqbGE1UGdNbWVmOEtwaG1hRnVvRUhwMWdP?=
 =?utf-8?B?NXhxQmVoakxuT3gxeGxKMkdaR1RTZTl4MUgwWk5hdERRY0hyV2pSbE91djJt?=
 =?utf-8?B?YXYxSnRIaWVaVWNmaU5CTCtpdlRWV3B2clU5N1dEbSt3S2w0SGhmMklVWGVR?=
 =?utf-8?B?ODBSbUsraFZXbVFSRS85S3F1OHRqQWFkMGtjcFoxbEM4cWYzS01pQTZvNWx5?=
 =?utf-8?B?RjFQS0ZVOXFLclVuMzU3Nm44d3VUajE5a0F5RkRBY2l1ZGFncTUxemJ4d1Uw?=
 =?utf-8?B?eTU4ajQvdGRacXdid2U0Wk1IUG5MTnR6VzVKYkVZWW1HeUJvZlRaTkkxdFJQ?=
 =?utf-8?B?aU1YQXRPOHd3dGZqUFdEOXhaNk1YUE16Q25kblVpVDhNY00ySGI3UnN6eTNU?=
 =?utf-8?B?YnpXaFpSWFJ2SzZCSWJIS3FDTERpQUhjazJTN0JMbmJNOUlEOTVaUlJOKytF?=
 =?utf-8?B?c2NTUUJCTTQ4dTRHL0lTSXBUNmJsV1dKM0M1SEJ4aXE0QWw3MjFGdXUxVWVD?=
 =?utf-8?B?cDJBVUJQbVB0NTB4OGNOWDI2dUNKVVlzdmNjYWpmZUVMUHpuNzlhNjJ3Mkta?=
 =?utf-8?B?cjR1RWVqUm1ERkVPMTR6cmZuZkl0SW9VTnNKdXorQUJtdHpLeDQ0WFdhUkJx?=
 =?utf-8?B?K0VEV1ljV3hSSjBsenhhRkFwZEZNb2NQREUzenlmYW13TXBtRnBJN3NjYksz?=
 =?utf-8?B?MENQTlNEZkk1M1NDQitzTDd3bHZtNXA3UDNkcFNjV3dpU3lmS0NKZzViaHVi?=
 =?utf-8?B?NzRyb0FWNDNXK1NBVk1NOHdkd1dJTk5qMm9xcDlQMGxzWkNReE03MERyQkdo?=
 =?utf-8?B?bzluY2x3eVVFbFVnZjZrNjFkMlNFN0pmSXJUTjhFTitGeWVFRkdnMTYzUkgr?=
 =?utf-8?B?SURvU2RkaUtjVlZkMG51YkI1MHcyMTRCaFRaUzhKM0ZIT0xJbUpXOTZNOTNI?=
 =?utf-8?B?Wm5peU5CNFlmTXFGbUxlaGd1TmJEUGhuMjA5OCtpcGdiSFFMdjhwU0JPK09B?=
 =?utf-8?B?dVJCZFhvRVRlZWFPVVNjRHZUVDRJTUsrK0IvNWVERm95NDBlWHFvK1NDV3dm?=
 =?utf-8?B?cVdvV3FJbFdPdFY4bVE0SU1aOTZIZDRSNm5CVHIrcFdHWlhPMjUwZ2dvVEZu?=
 =?utf-8?B?elExVzFmVkJ4alQxeDhSSWd1ejFPRHNJbmx1aWIvd0pTamUxeEozWnh5bnVJ?=
 =?utf-8?B?eXQ3SitNVzgxTGpCOE03a0liOUVLVEtPeTloWmFqb1RDckdLWVBZMDZXb1NT?=
 =?utf-8?B?WE8yK3psRlZPSFBOYVdhOXBONXZiRHNkWE5FQkhTWE1RczBsNVoxMVN3TDR3?=
 =?utf-8?B?RjBTZmIxWGp6MXhRbXJJT3UyUHQ2K0JOclZuTXRGOFYxeDd0bHRRYWp1akph?=
 =?utf-8?B?QkdSeG5IcVRzY1NuU2p0bSt4SkcwQ2ZDNVliaDA1K29nOVkzeUF1TFQzRHRD?=
 =?utf-8?B?Rm1GdVVsTUkxRXliTWE0KzRsOHBlNU80Znk4ZERsTXNDQVczb3NOak9jZVNO?=
 =?utf-8?B?Ny9vcXRmY3Z0U3g4TUZsMWV5YjZZNndxdVVhYTNHbDdSdE1ReEJPR3phd0lm?=
 =?utf-8?B?OExYc0VFRnBlbHpaWGxoRFpjejlIZnhvd044VDk2eUVieGJScWhDZXcvZzF1?=
 =?utf-8?B?VXEwbUo4OFV0M1Q0Z01ENWtkcldzWGlIa29nS25NZytaYzJvelQ4OEhMRklI?=
 =?utf-8?B?ZTlXK3RVOGJvMEpsWHBWd2VZYXk5SVBRWG90VU5xZUFRVW51SkwycW5FOGlQ?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f70941-418d-4584-c7b7-08dce75f84ac
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:07:41.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKIZegE02DJbhT+JAPR+W48IYLxcL9MXG8hvJtXZICwJ+Q7LSoF9PJKiltVAPXCAqXnDGE5eDh09yPKrwAt8Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

CgpPbiAxMy4wOS4yMDI0IDEyOjQ0LCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6Cj4gRnJvbTogUnlz
emFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPgo+IAo+IFRoaXMgZGlyZWN0b3J5IGlz
IGluIHRoZSBpZ3QgdHJlZSBmb3IgY29udmVuaWVuY2UuIEl0J3Mgbm90IGltbWVkaWF0ZWx5Cj4g
Y2xlYXIgdGhhdCB0aGlzIGlzIGEgdmVuZG9yZWQgbGlicmFyeSwgc28gbW92ZSBpdCBpbnRvIHZl
bmRvci8gYW5kIG1ha2UKPiBNZXNvbiBhZGQgdGhhdCBkaXJlY3RvcnkgZm9yIGVhc3kgaW5jbHVk
ZXMgZXRjLgo+IAoKUmV2aWV3ZWQtYnk6IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5u
YUBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUnlzemFyZCBLbm9wIDxyeXN6YXJk
Lmtub3BAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAg
ICAgICAgfCA2ICsrKysrLQo+ICBsaWIveyA9PiB2ZW5kb3J9L3V3aWxkbWF0L3V3aWxkbWF0LmMg
fCAwCj4gIGxpYi97ID0+IHZlbmRvcn0vdXdpbGRtYXQvdXdpbGRtYXQuaCB8IDAKPiAgMyBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgcmVuYW1lIGxpYi97
ID0+IHZlbmRvcn0vdXdpbGRtYXQvdXdpbGRtYXQuYyAoMTAwJSkKPiAgcmVuYW1lIGxpYi97ID0+
IHZlbmRvcn0vdXdpbGRtYXQvdXdpbGRtYXQuaCAoMTAwJSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGli
L21lc29uLmJ1aWxkIGIvbGliL21lc29uLmJ1aWxkCj4gaW5kZXggMWM4M2JjNWMzLi5iMTA0MTBj
OGEgMTAwNjQ0Cj4gLS0tIGEvbGliL21lc29uLmJ1aWxkCj4gKysrIGIvbGliL21lc29uLmJ1aWxk
Cj4gQEAgLTk1LDcgKzk1LDYgQEAgbGliX3NvdXJjZXMgPSBbCj4gIAknaWd0X3BtLmMnLAo+ICAJ
J2lndF9kdW1teWxvYWQuYycsCj4gIAknaWd0X3N0b3JlLmMnLAo+IC0JJ3V3aWxkbWF0L3V3aWxk
bWF0LmMnLAo+ICAJJ2lndF9rbW9kLmMnLAo+ICAJJ2lndF9rdGFwLmMnLAo+ICAJJ2lndF9wYW5m
cm9zdC5jJywKPiBAQCAtMTE3LDYgKzExNiw5IEBAIGxpYl9zb3VyY2VzID0gWwo+ICAJJ3hlL3hl
X3F1ZXJ5LmMnLAo+ICAJJ3hlL3hlX3NwaW4uYycsCj4gIAkneGUveGVfdXRpbC5jJywKPiArCj4g
KwkjIFZlbmRvcmVkIGxpYnJhcmllczoKPiArCSd2ZW5kb3IvdXdpbGRtYXQvdXdpbGRtYXQuYycs
Cj4gIF0KPiAgCj4gIGxpYl9kZXBzID0gWwo+IEBAIC0xMzUsNiArMTM3LDggQEAgbGliX2RlcHMg
PSBbCj4gIAl6bGliCj4gIF0KPiAgCj4gK2luYyA9IFsgaW5jLCBpbmNsdWRlX2RpcmVjdG9yaWVz
KCd2ZW5kb3InKSBdCj4gKwo+ICBpZiBsaWJkcm1fbm91dmVhdS5mb3VuZCgpCj4gIAlsaWJfZGVw
cyArPSBsaWJkcm1fbm91dmVhdQo+ICAJbGliX3NvdXJjZXMgKz0gWwo+IGRpZmYgLS1naXQgYS9s
aWIvdXdpbGRtYXQvdXdpbGRtYXQuYyBiL2xpYi92ZW5kb3IvdXdpbGRtYXQvdXdpbGRtYXQuYwo+
IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGxpYi91d2lsZG1hdC91d2lsZG1h
dC5jCj4gcmVuYW1lIHRvIGxpYi92ZW5kb3IvdXdpbGRtYXQvdXdpbGRtYXQuYwo+IGRpZmYgLS1n
aXQgYS9saWIvdXdpbGRtYXQvdXdpbGRtYXQuaCBiL2xpYi92ZW5kb3IvdXdpbGRtYXQvdXdpbGRt
YXQuaAo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGxpYi91d2lsZG1hdC91
d2lsZG1hdC5oCj4gcmVuYW1lIHRvIGxpYi92ZW5kb3IvdXdpbGRtYXQvdXdpbGRtYXQuaAoKSW50
ZWwgU2VtaWNvbmR1Y3RvciBBRw0KUmVnaXN0ZXJlZCBOby4gMDIwLjMwLjkxMy43ODYtNw0KUmVn
aXN0ZXJlZCBPZmZpY2U6IER1Zm91cnN0cmFzc2UgMTAxICwgODAwOCBadXJpY2gsIFN3aXR6ZXJs
YW5kCg==

