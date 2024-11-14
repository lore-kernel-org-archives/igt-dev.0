Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE22D6A249
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 22:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7610E385;
	Thu, 14 Nov 2024 22:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iD7bW72m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5091810E385
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731623607; x=1763159607;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fNvTHQLEl1vgUMov1Ee9+4xr5XKHjVxrcsl8TMqe9Zg=;
 b=iD7bW72mJHJuuBuvV98vNVoLTLaSfIy8wI4Uvcq8QT7GWHBQh6tns4gR
 GGsG1sP2u+2p1CzUYZmrLN/4P1j91ntDfMksg93ch+qKBwXTcIyy+uZrT
 SxUqMRMKv6bE8w8/r7pJp769QLebXgMEvG62bnSLDGsqW1FrwtSAA3xcu
 hH+4zu+/UROPglnh3v4hRG30YbRR5uVhCPpCyf/JmXsT+WTVeijoJo8n7
 O+5O/AC9qeBjK4HnwAbitHaSflSVTli6drHg5AVsM2lNz4de01KXwfzqa
 hlSkbRrz0CnU5momS/NLO2ET9ZnqSZo47HjItmzT1tHnylCAyKkQ2ro+M Q==;
X-CSE-ConnectionGUID: aUtpF6AuQYa57kRgPezBDQ==
X-CSE-MsgGUID: xebuRT9HSG+gBi+OyYnJnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="57007946"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="57007946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 14:33:26 -0800
X-CSE-ConnectionGUID: KwWv7SGeSHio6LTwYA+5mg==
X-CSE-MsgGUID: zgNCelARTKe1fB0hZFeY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88338097"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 14:33:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 14:33:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 14:33:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 14:33:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+JFXIYl0Zdr5m5Wr+zKm1tYIbPDHnsLEQVzwiztpqTsyUnFcmRlK3Jjc2p2yV1KVQ52RMIuxKafpBtgkJfbtSMrmOXtug2ijr5Np6/i8oEnSi+Qrlup04+C94zWV4XUBtwrXkJT4SOZwty0JGDGu4QNdi5438Nkz/Zy7srPrAXMdkDbc6abQ6EBFBkHY1HXIkREbHlJVbUdjIQaxxaZNDfqcUDPYGDx3PpIUZfCqq9ofQVrhWTuzDbLpbNQjXybByWxFAstXFWpdbKBSKaMLi0KmhMBKDY21OLYCRQxDIRONItWmRer/yAQquhntNAV3U55rmrIzTOhqcQKpwvkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECB5A41eQcd84g65IURM/So/yxZ80ii5CzBr6anjUPk=;
 b=Yektdr4srpyZu33MHo8mOObwn4cMsIvVH8Ng2c+hvsKc+o4DnxMmmqiQWeSIEqEuEwRpw5dywVhcvUFpvojZWTT2KFBdr6DQJSclwi9cD3IQeUS13PN8ZOGY0fgS+y1Fvc/CqJ9cUlaqbAg23P3dC76B0ftMp9E5/v6ERiAn3jl8ObLucZfWVq/npR168VvOIROPBMeEDWQRWzjZFl6EB0tZj90ojFeBhfO/ea0PWR/l3hTEezu4BsV7mGRvnHhGs1wbefDZ2RIVgwr0tWZ9rtJDQ8LzbOTNHtnNW41883julceofGjVqs9Uk8nW/rMrNMqLVqmWOHW80nKpfqTPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Thu, 14 Nov
 2024 22:33:22 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 22:33:22 +0000
Message-ID: <58255047-a07c-49dd-8700-8f6b099a3afc@intel.com>
Date: Thu, 14 Nov 2024 17:33:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <20241022163324.383145-2-zhanjun.dong@intel.com>
 <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3ffd6d-9a11-441a-ae21-08dd04fc5862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWpQYXJyL0I0d2xidkZhanIybEFtNW0vRS9xOGxmZG16S2kzMmR1bng3bDFI?=
 =?utf-8?B?dG42aitIOGxobU0zSlFDelR2aXpaa0ZPZnIxRDNoNXl3TGJZeHRRdEI5ZnJq?=
 =?utf-8?B?aTJPYjhZaXpkU1Zya1pCejQyTHdjcVJFWGVZbXlMejhsVXU5YWVjY2FDdlIx?=
 =?utf-8?B?cjIwUGQ1VlQ2RWxJVzNyb2ROOUdCeUxmT1RHbE5TdUhrckR5eTZZOGkveSt0?=
 =?utf-8?B?VHozOSs0WkZ4UnRqS2oyMGh5cEhsb3h0c0JQQUg5b3JkbzRrd0Z1aFlJTzlt?=
 =?utf-8?B?WEtUazdRclNveUZzRzdTbUhPWS9MR1VDaHMvQVNIMU45S2JMZDRnckZTZ0xO?=
 =?utf-8?B?TXhHSkF6T0UzRm5rdGU5Nlk0UE9RckhwOWNPVXNOaFdzT29KcldoUjMvS3Vi?=
 =?utf-8?B?blU5clF3U0VweXpsbnhDcm1JVFJpYVFibE5YSDdjN3pnY1g5MDFFTGxXYjYx?=
 =?utf-8?B?eXJPVTE0ZWxFbEljVHNwWEdldVowaEp1cGh1S1NJYWZsclMyRVdNS1N0ZW5t?=
 =?utf-8?B?UUR1VjdjMUhwWUdQaFNqKzAyY0pzWkFKaS9qcU1uSXFKbHV6a1pqdm12MDJP?=
 =?utf-8?B?UEVHYmV3WmNTV0dyaTQvS1Zaa0ZIU3B3TVo4a1FRYVhqaGU2NVRSODdIcS9N?=
 =?utf-8?B?WUJtSWN3NUZ1YSswMVorT0EyQ1R0Nno1WURERGdCWHNYbnFjTm9FMUR6ekhX?=
 =?utf-8?B?dFZxY2lzaVFqTnkyUm83SlJjbGcwb2RDVDE3YXNkK250Sk13blJUcXdTV3d4?=
 =?utf-8?B?SjltQ0t0KyttNXRQcG9jT3JWL2dyZWoyMmlNZVhlL2pRNzM4anY5bEljc29D?=
 =?utf-8?B?bWJHUU12MittODJLZUN4YzdQL3Z3c3lVL2xlQSs5bjNpaHd4Z0M3ZEVBRmkr?=
 =?utf-8?B?ZXdxdnN2MnMvNFVPUW5CUWRtSzZFeVEydGM2NEY1d0I5bzVlMmtJaUUzNWJv?=
 =?utf-8?B?a2tKU0wrTVdMTHE2MENhUnVCSWVnaERwRGdxODJ2MHBBRFpzRG93ZG83K1k5?=
 =?utf-8?B?SHllKzhrUjV0UzlqNkVhK1ZacWlXRHhyTzdzTVduRUV0S2FTUkVUSC9qcDJq?=
 =?utf-8?B?eHZzMnZMSDI1cWd5azRkZ2tLa2N0MHRPcVJqM0JMcUh4SmU3TEhzKzhZK1By?=
 =?utf-8?B?RC9tYzBjNmI1eGtNUHU0RFlmSGZJdDcwZEtHRnVNTzN5VG9GcHlmT2ZnYWNI?=
 =?utf-8?B?clFWV3pHamJSVDNZbE9oV0IwUWo2QUJsZmd3L3RRR2pveG00TndJWVAva2lH?=
 =?utf-8?B?VFdRaVZ1eEZhTzhZM1B5cEdPSHRGUUpScVNacWdMeFc4Z3QxY1VLQXErN08y?=
 =?utf-8?B?cjhSMlBZbTlHUk1KRDcyeG9STWlqeXVzdUxyazBjWkZnRXpKR3NnVFFyWk1r?=
 =?utf-8?B?NWJHS0R3UW5QSDJxeG8wdEszYngyUzZiY0JVd1N3YlkyeXZmMVBzQUNCck1S?=
 =?utf-8?B?d0o3eVAvZk9qdzZCQTM0UVNqbnNNbE1YRTBpdW9rVXlabDRQTlRIRzlOLytn?=
 =?utf-8?B?Z01hRjRYbTNDUi8rWDdIWm1JNUlQV1YzekxTQk5DdnhSbGh2dDBGVkNpVVE3?=
 =?utf-8?B?RkRDQ3BOMDNocHQvN3FwRzhKMUltRHpDdTgvczYwUEdWSEYzUUVuTS9CcUdz?=
 =?utf-8?B?VXRDWE1qT3VmS21KWEpra2UrT3NyYStIVEhMMDVCY294RnJ4YVhaTUh1bEdv?=
 =?utf-8?B?VEgxbnQzVDBFNVJPWjdtM0hZWTZadjZMZzBUZzQzdUkxbXFOYUZUM3k5MXgz?=
 =?utf-8?Q?3BV757u3EsP1dOlSOE5TMhxwyzKLK8YQ5gnsZHk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lHOFBqRDF2MklZRmZPVkl1ZnZMQnozOGhqb1p1WHhVeHhSN2FVaU53eS9u?=
 =?utf-8?B?NG96SjBxWGtEWVcrRXVxSG9aL1Y5MXA2aGRlZlMyVlk0dW1XU3dieGF4allS?=
 =?utf-8?B?anVBYjA5SWp3dkVmQWc2eG1KMzIzK3JnanNuS3RmalRvR0JjRmJja3ZmbW9k?=
 =?utf-8?B?NGtQTjV2dzJkWU5DQ2IyZmFYYjBQWUtlTWsvTWhVdkdtb3dTalBJSXFabys0?=
 =?utf-8?B?QVU1UXc0SmJDVENRVHcyTU45bnZpa0RTbHk2ZkQzVTd2eGdFYkZsZnlUenRp?=
 =?utf-8?B?OSs1NGxJVi9NdEdzNjMwZVlyYkN4MjNjdjlXeEwxRlFUbmJ6TmxhNG1RYUty?=
 =?utf-8?B?UFlLNVNRYU5NTGFiWVd3RFZ3Q0lZSkxoLy9ONDNiSUhkeWlCS1RYM1NGVmNT?=
 =?utf-8?B?TEVFZzh4aVpOQVRHY0tQbjFUM280Qk5TSzVMc254S1cyVEllZFFTZUlEeURt?=
 =?utf-8?B?NWRxazNzbDVlSnZuWitrZkYzV1AvNUkwbjVXeS8wVEQrSnRJQ2N5bXlXd2Zs?=
 =?utf-8?B?WW53ZHoxZHNYaDhucFRyQWhvV0JvVXppVmVNU0JsNGhYQTVCQTRMbW05ZGYx?=
 =?utf-8?B?Z01xbXdlaVdvM3UxOVNHOTdWZmRjVXF4b0NGcmI0cHNjaGhtZ2lQc3k3UUlp?=
 =?utf-8?B?NTdSU1EzK2VzS3d0dzBSWnNpT2dkK01rMHBJcVE1S05iNExFSUhHd0FKZnB2?=
 =?utf-8?B?dHIzSVVibVdQNlNqV2dnM1pjM3lKb3NHcUNpcW1GL2U5N0ZUb09rcmtLOEw1?=
 =?utf-8?B?WXY4NWQ3akdnTXJDWXFGeWNxS2RZMXVQUnJ2YWNqYnNyQzFqazhTOUEvTU1H?=
 =?utf-8?B?R1NrUmZwaHJhU1pjM1V4NTZEdkswUmlDdkpjNE44SFZCdk1QSGg5YXlwZDRW?=
 =?utf-8?B?UURHNHdCaEFwNHhLSlBQOGljRys1WkJ0b2pvNy9qSTdab3BJZDliZVBEMDV1?=
 =?utf-8?B?ZmJ4eTVCMGp6czg0bGRpM2RkV2FXcW9VTzAzYmFOKzV2SndRVE5lODJqNytl?=
 =?utf-8?B?VWM5djZ5UFloYUtOQXNVWGVuSys3ZnBLRGNUTW5xZUgzdWJRdmVPbmxqV2Fu?=
 =?utf-8?B?Z0g2ZWZHWlMzNWdRcytlQXJYNHdZS2t3Y0FVbXlCZ0pSdzErUUtpeTVBZ201?=
 =?utf-8?B?Njd3enJUcGtoSXZJeXFWQWU5YjZJYWRCMVI1a0huU3p6N2RHc1pkTE1QU3g1?=
 =?utf-8?B?QklxTktoL3hkd1lPd1RibmkrTzRpQjFOd0VhdkdreVlxNGRyKzB4Ykc2Sllh?=
 =?utf-8?B?L2FiZUNaS25wZ2o5azRqcFJqZFJCbnlDV2hmSUgxR21YQW1kQjNRSFRQU01Z?=
 =?utf-8?B?WlRMZlpUTVRvalZPQlZqeFVvT2thbUo1MUcvcTV3TkVRYnljN1ZQUHc2Q01H?=
 =?utf-8?B?ZnlVN0o1SWhSUjZkWDEzYWZqcmV5MjZVVkxwb1dxVmt6RDBsU3MzSGlFVjBM?=
 =?utf-8?B?WXBHNnBkcTR0VFdVcEkxV1VHYktFbDJWbXZoZVlaU2FRN21Eano4NjZ4bzJy?=
 =?utf-8?B?bnVpN003dnRENE5FWWxmUjA2VGI4bFdYdExBYjFBTjJnMnozYzVNajlPK2s1?=
 =?utf-8?B?MGl4d3JRRk9yYlh1WmVOQWdzMVpiNU1pWDI0TkVqM1pCZHV1bmpnWEh1bitV?=
 =?utf-8?B?UkRKMFZySFFRSkZlY1VLUksybjVoYzZKMVdlUnU5eXdYTmRwTGc3b0ZTOEcz?=
 =?utf-8?B?WktTaytqaU50S1ZjN2hxaFR4K0pwQXJBekxzYmM5YzdyaGRHU1lBOTc5RFcw?=
 =?utf-8?B?MFB3TTc5RFZkR2RCRG0za2piSGY3a3J1TEZxYzZLY0NaUHg5eTg5T04rOHds?=
 =?utf-8?B?VGNkbVBLQnJJalN5d2dQK0Y4Z0QvcGJRRU83S2RYT3NPYlpLSWp6Y2FCMWNu?=
 =?utf-8?B?MWlad2dxQlM2bUpYMjJOaDh1M2pLZ1FyZUNWMmNtalhMWUZXQXZ5cjdUTDg0?=
 =?utf-8?B?aVlVZzlMT29tT3FQM0NsbldJMHVLQmJLdTZyaWxnazh0Z0gvWVBRSzRDZkFR?=
 =?utf-8?B?TnRQN0tMdEt1OUV0T2hWbmlZdGFpb3hTMndndEl2YmNlQkx2KzBSU3J3by85?=
 =?utf-8?B?ZU9vZTVmdEh3UllQR1ZyY0F2RFFqdVpodVhNc21YakN5b3AvdTZPNUlZSXly?=
 =?utf-8?Q?pE5+bI4XS/CPNPIeWr1bZCUtf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3ffd6d-9a11-441a-ae21-08dd04fc5862
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:33:21.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+xjMzsL/ykFzXk7oIlJALtRIcqW/2K64s5PrZAomaldy2MP0S4+wg3hsZGurUiRGaDJi4jd68fHCmTGP1tSug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
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


Please see my comments inline below.

Regards,
Zhanjun Dong

On 2024-11-13 2:48 a.m., Teres Alexis, Alan Previn wrote:
 > On Tue, 2024-10-22 at 09:33 -0700, Zhanjun Dong wrote:
 >> Test with GuC reset, check if devcoredump register dump is within the
 > alan: nit: more clarification? -> "Submit cmds to the GPU that result 
in a GuC engine reset and check that devcoredump
 > register dump is generated, by the GuC, and includes the full 
register range"?
sure
 >> range.
 >>
 >> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
 >> ---
 >>   tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
 >>   tests/meson.build             |   1 +
 >>   2 files changed, 366 insertions(+)
 >>   create mode 100644 tests/intel/xe_exec_capture.c
 >>
 >> diff --git a/tests/intel/xe_exec_capture.c 
b/tests/intel/xe_exec_capture.c
 >> new file mode 100644
 >> index 000000000..3a8fa68f2
 >> --- /dev/null
 >> +++ b/tests/intel/xe_exec_capture.c
 >> @@ -0,0 +1,365 @@
 >> +// SPDX-License-Identifier: MIT
 >> +/*
 >> + * Copyright © 2024 Intel Corporation
 >> + */
 >> +
 >> +/**
 >> + * TEST: Basic tests for GuC based register capture
 >> + * Category: Core
 >> + * Mega feature: General Core features
 >> + * Sub-category: CMD submission
 >> + * Functionality: Debug
 >> + * Test category: functionality test
 >> + */
 >> +
 >> +#include <ctype.h>
 >> +#include <fcntl.h>
 >> +#include <stdio.h>
 >> +#include <regex.h>
 > alan:nit: alphabetical? (I'm not sure if this is a hard rule for std 
headers)
sure, to be reversed
 >> +
 >> +#include "igt.h"
 >> +#include "igt_device.h"
 >> +#include "lib/igt_syncobj.h"
 >> +#include "lib/intel_reg.h"
 >> +#include "xe_drm.h"
 >> +#include "xe/xe_ioctl.h"
 >> +#include "xe/xe_query.h"
 >> +#include "xe/xe_spin.h"
 >> +
 >> +#define MAX_N_EXECQUEUES               16
 >> +#define MAX_INSTANCE                   9
 >> +#define GT_RESET                       (0x1 << 0)
 >> +#define CLOSE_FD                       (0x1 << 1)
 >> +#define CLOSE_EXEC_QUEUES              (0x1 << 2)
 >> +#define VIRTUAL                                (0x1 << 3)
 >> +#define PARALLEL                       (0x1 << 4)
 >> +#define CAT_ERROR                      (0x1 << 5)
 >> +
 >> +#define BASE_ADDRESS                   0x1a0000
 >> +/* Batch buffer element count, in number of dwords(uint32_t) */
 >> +#define BATCH_DW_COUNT                 16
 >> +
 >> +#define MAX_PATH_NAME_LEN              512
 >> +#define MAX_LINES                      4096
 >> +/* Keep line content up to this length */
 >> +#define MAX_LINE_LEN                   1024
 >> +#define MAIN_BUF_SIZE                  (MAX_LINES * MAX_LINE_LEN * 
sizeof(char))
 >> +/* Buffer size to read a line */
 >> +#define LINE_BUF_SIZE                  (64 * 1024)
 >> +
 > alan: the above set of definitions are being used for the sole purpose of
 > trying to get all of the devcoredump file into a buffer that you can 
then go through
 > an find some specific keywords using strstr in get_coredump_item. 
However, instead
 > of using all these definitions and creating alloc_lines_buffer, 
load_all and get_coredump_item,
 > why not reuse igt_sysfs_get function? is there a reason we are not 
using that?
Yes, that idea comes from previous version review comments.
By load all into line buffers, then lines buffer index is the 
line_number, make debug easier.
 >
 > Alternatively, i am wondering if we can consider the top part of the 
devcoredump layout
 > is persistent and so maybe we dont even need to load so much of the 
devcoredump?
 > i.e. if we dont get any variable length printouts or buffer object dumps
 > before the guc error capture then we could simply read the minimal 
buffer size needed
 > to get the initial keywords of the guc error capture dump.
That looks like what I do in V3: only data content between
"**** Job ****"
and
"**** VM state ****"
will be load into buffer and parsed

 >
 >
 >> +#define DUMP_PATH 
"/sys/class/drm/card%d/device/devcoredump/data"
 >> +#define START_TAG                      "**** Job ****"
 >> +#define REGEX_KEY_VALUE_PAIR           "^[ \t]*([^:]+):[ \t]*([^ 
\t]+)[ \t]*$"
 >> +#define REGEX_KEY_INDEX                        1
 >> +#define REGEX_VALUE_INDEX              2
 >> +#define REGEX_KEY_VALUE_GROUP_COUNT    3
 >> +
 >> +static void
 >> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 >> +                int n_exec_queues, int n_execs, unsigned int flags)
 >> +
 > alan: just a question: why are you calling it "test_legacy_mode"?
 > i know you are re-using this function from other tests,
 > but I'm curious on the history of this name.
Yes, this function is pretty much copy from xe_exec_reset. Keep the same 
name will make reviwer easy to connect it with other test code.

 >
 > alan: future follow up: As a side note, we should create a separate task
 > item to consolidate the multiple instances of this function currently
 > being used by other tests and re-purpose it as an xe library helper.
 > This will sure require additional in-out params more input validations
 > However, since we need this test to ensure we get guc-error-capture 
tested
 > in CI a little urgently, create a separete internal task for that.
Sounds good for me to do in next step.

 >> {
 >> +       uint32_t vm;
 >> +       const uint64_t addr = BASE_ADDRESS;
 >> +       struct drm_xe_sync sync[2] = {
 >> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
DRM_XE_SYNC_FLAG_SIGNAL, },
 >> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
DRM_XE_SYNC_FLAG_SIGNAL, },
 >> +       };
 >> +       struct drm_xe_exec exec = {
 >> +               .num_batch_buffer = 1,
 >> +               .num_syncs = 2,
 >> +               .syncs = to_user_pointer(sync),
 >> +       };
 >> +       uint32_t exec_queues[MAX_N_EXECQUEUES];
 >> +       uint32_t syncobjs[MAX_N_EXECQUEUES];
 >> +       size_t bo_size;
 >> +       uint32_t bo = 0;
 >> +       struct {
 >> +               struct xe_spin spin;
 >> +               uint32_t batch[BATCH_DW_COUNT];
 >> +               uint64_t pad;
 >> +               uint32_t data;
 >> +       } *data;
 >> +       struct xe_spin_opts spin_opts = { .preempt = false };
 >> +       int i, b;
 >> +
 >> +       igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 >> +
 >> +       vm = xe_vm_create(fd, 0, 0);
 >> +       bo_size = sizeof(*data) * n_execs;
 >> +       bo_size = xe_bb_size(fd, bo_size);
 >> +
 >> +       bo = xe_bo_create(fd, vm, bo_size,
 >> +                         vram_if_possible(fd, eci->gt_id),
 >> +                         DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 >> +       data = xe_bo_map(fd, bo, bo_size);
 >> +
 >> +       for (i = 0; i < n_exec_queues; i++) {
 >> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 >> +               syncobjs[i] = syncobj_create(fd, 0);
 >> +       };
 >> +
 >> +       sync[0].handle = syncobj_create(fd, 0);
 >> +       xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 >> +
 > alan: nit so you can ignore, but it would be really nice if the flow is
 > summarized in a concise comment. Perhaps better to do that when we get
 > to doing the conslidation into a helper in future.
 >
 >> +       for (i = 0; i < n_execs; i++) {
 >> +               uint64_t base_addr = addr;
 > alan: i see that for every single batch on all engines (as per the 
caller that loops
 > calling this "test_legacy_mode" per engine, we always use the same 
batch address.
 >
 > However, with the same batch address across all runs of this loop, it 
means that
 > we have no way to catch the following:
 >
 > 1. if we encounter a case where the devcoredump retrieved contained a 
guc-error-capture
 > that didnt correlate with the batch we were expecting to get reset on 
(i.e. the first
 > batch of a given current needs to be one getting reset, but we end up 
with another one),
 > then we need to flag that as a warning or failure. (I'm assuming the 
execution of batches
 > on a given queue is guaranteed to be in order).
 >
 > 2. if we encounter a case where the devcoredump retrieved contained a 
guc-error-capture
 > of some other engine such as the prior engine that was being tested 
that we should also
 > flag that as a warning or failure.
 >
 > That said, i think the batch base address really should be never 
consistent for any
 > two engines and never consistent for any two batches. so maybe... ->
 >
 >     const uint64_t addr = BASE_ADDRESS + (engine_id * (0x100));
 >
 >     ... then in the loop...
 >     int e = i % n_exec_queues;
 >     uint64_t base_addr = addr + e * 0x8;
 >
 > this way, when we get a devcoredump, we should ensure that the batch 
address
 > matches the engine_id we just tested and ensure its last nibble is 
always 0x8?

Good idea, I will make the addr different each time when run the test, 
therefor, when we pick up devcoredump, we could ensure the address in 
devcoredump is not from either other engine or from previous run.

 >
 >> +               uint64_t batch_offset = (char *)&data[i].batch - 
(char *)data;
 >> +               uint64_t batch_addr = base_addr + batch_offset;
 >> +               uint64_t spin_offset = (char *)&data[i].spin - (char 
*)data;
 >> +               uint64_t sdi_offset = (char *)&data[i].data - (char 
*)data;
 >> +               uint64_t sdi_addr = base_addr + sdi_offset;
 >> +               uint64_t exec_addr;
 >> +               int e = i % n_exec_queues;
 >> +
 >> +               if (!i) {
 >> +                       spin_opts.addr = base_addr + spin_offset;
 >> +                       xe_spin_init(&data[i].spin, &spin_opts);
 >> +                       exec_addr = spin_opts.addr;
 >> +               } else {
 >> +                       b = 0;
 >> +                       data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 >> +                       data[i].batch[b++] = sdi_addr;
 >> +                       data[i].batch[b++] = sdi_addr >> 32;
 >> +                       data[i].batch[b++] = 0xc0ffee;
 >> +                       data[i].batch[b++] = MI_BATCH_BUFFER_END;
 >> +                       igt_assert(b <= ARRAY_SIZE(data[i].batch));
 >> +
 >> +                       exec_addr = batch_addr;
 >> +               }
 >> +
 >> +               sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 >> +               sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 >> +               sync[1].handle = syncobjs[e];
 >> +
 >> +               exec.exec_queue_id = exec_queues[e];
 >> +               exec.address = exec_addr;
 >> +               if (e != i)
 >> +                       syncobj_reset(fd, &syncobjs[e], 1);
 >> +               xe_exec(fd, &exec);
 >> +       }
 > alan: so this code is new to me - so to help me understand, can you 
explain
 > if i got this right in terms of what above loop and below sync-waits 
are doing?:
 > 1. so e send n_execs number of batches across n_exec_queues number of 
queues (on the same engine)
 > 2. then, below, we wait on each one of those batches to start.
 > 3. And finally we wait for the vm to unbind?
 >
 > However, i notice from the caller that you are only doing count batch 
of one and queue count of one.
 > That said, i am kinda wondering that if the batch buffer is doing a 
spinner, and if this igt
 > test coule potentially be running alone without any other workloads, 
then how would a reset be
 > triggered? i thought if we only have 1 workload running with nothing 
else being queued, then
 > the GuC wont have a reason to preempt the work. I also thought we 
dont have heartbeat in xe...
 > am i mistaken? how do we guarantee that an engine reset occurs?
 >
 > lets connect offline as i am a bit lost in some of these codes.
I see your reply on this part. We can follow up at later time for 
concerns like set a shorter timeout, sounds like not a blocker.

 >> +
 >> +       for (i = 0; i < n_exec_queues && n_execs; i++)
 >> +               igt_assert(syncobj_wait(fd, &syncobjs[i], 1, 
INT64_MAX, 0,
 >> +                                       NULL));
 >> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 
0, NULL));
 >> +
 >> +       sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 >> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 >> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 
0, NULL));
 >> +
 >> +       syncobj_destroy(fd, sync[0].handle);
 >> +       for (i = 0; i < n_exec_queues; i++) {
 >> +               syncobj_destroy(fd, syncobjs[i]);
 >> +               xe_exec_queue_destroy(fd, exec_queues[i]);
 >> +       }
 >> +
 >> +       munmap(data, bo_size);
 >> +       gem_close(fd, bo);
 >> +       xe_vm_destroy(fd, vm);
 >> +}
 >> +
 >> +static char **alloc_lines_buffer(void)
 >> +{
 >> +       int i;
 >> +       char **lines = (char **)malloc(MAX_LINES * sizeof(char *));
 >> +       char *main_buf =  (char *)malloc(MAIN_BUF_SIZE);
 >
 >> +
 >> +       igt_assert_f(lines, "Out of memory.\n");
 >> +       igt_assert_f(main_buf, "Out of memory.\n");
 >> +
 >> +       /* set string array pointers */
 >> +       for (i = 0; i < MAX_LINES; i++)
 >> +               lines[i] = main_buf + i * MAX_LINE_LEN;
 >> +
 >> +       return lines;
 >> +}
 >> +
 >> +static char *get_devcoredump_path(int card_id, char *buf)
 >> +{
 >> +       sprintf(buf, DUMP_PATH, card_id);
 >> +       return buf;
 >> +}
 >> +
 >> +static void load_all(FILE *fd, char **lines, char *buf)
 >> +{
 >> +       int i = 0;
 >> +
 >> +       memset(lines[0], 0, MAIN_BUF_SIZE);
 >> +       while (!feof(fd) && i < MAX_LINES) {
 >> +               /*
 >> +                * Devcoredump might have long lines, load up to
 >> +                * LINE_BUF_SIZE for a single line, buffer reused
 >> +                */
 >> +               fgets(buf, LINE_BUF_SIZE, fd);
 >> +               /* Only save up to MAX_LINE_LEN to buffer */
 >> +               strncpy(lines[i++], buf, MAX_LINE_LEN);
 >> +       }
 >> +}
 >> +
 >> +static bool access_devcoredump(char *path, char **lines, char 
*line_buf)
 >> +{
 >> +       FILE *fd = fopen(path, "r");
 >> +
 >> +       if (!fd)
 >> +               return false;
 >> +
 >> +       igt_debug("Devcoredump found: %s\n", path);
 >> +
 >> +       /* Clear memory before load file */
 >> +       if (lines)
 >> +               load_all(fd, lines, line_buf);
 >> +
 >> +       fclose(fd);
 >> +       return true;
 >> +}
 >> +
 >> +static bool rm_devcoredump(char *path)
 >> +{
 >> +       int fd = open(path, O_WRONLY);
 >> +
 >> +       if (fd != -1) {
 >> +               igt_debug("Clearing devcoredump.\n");
 >> +               write(fd, "0", 1);
 >> +               close(fd);
 >> +               return true;
 >> +       }
 >> +
 >> +       return false;
 >> +}
 >> +
 >> +static char *get_coredump_item(regex_t *regex, char **lines, const 
char *tag)
 >> +{
 >> +       int i;
 >> +       regmatch_t match[REGEX_KEY_VALUE_GROUP_COUNT];
 >> +
 >> +       for (i = 0; i < MAX_LINES; i++) {
 >> +               char *line = lines[i];
 >> +
 >> +               /* Skip lines without tag */
 >> +               if (!strstr(line, tag))
 >> +                       continue;
 >> +
 >> +               if (regexec(regex, line, 
REGEX_KEY_VALUE_GROUP_COUNT, match, 0) == 0) {
 >> +                       char *key, *value;
 >> +
 >> +                       key = &line[match[REGEX_KEY_INDEX].rm_so];
 >> +                       line[match[REGEX_KEY_INDEX].rm_eo] = '\0';
 >> +                       value = &line[match[REGEX_VALUE_INDEX].rm_so];
 >> +                       line[match[REGEX_VALUE_INDEX].rm_eo] = '\0';
 >> +
 >> +                       if (strcmp(tag, key) == 0)
 >> +                               return value;
 >> +                       /* if key != tag,  keep searching and loop 
to next line */
 >> +               }
 >> +       }
 >> +
 >> +       return NULL;
 >> +}
 >> +
 >> +static void check_item_u64(regex_t *regex, char **lines, const char 
*tag, uint64_t addr_lo,
 >> +                          uint64_t addr_hi)
 >> +{
 >> +       uint64_t result;
 >> +       char *output;
 >> +
 >> +       igt_assert_f(output = get_coredump_item(regex, lines, tag), 
"Target not found:%s", tag);
 >> +       result = strtoul(output, NULL, 16);
 >> +       igt_debug("Compare %s: %s vs [0x%lX-0x%lX]\n", tag, output, 
addr_lo, addr_hi);
 >> +       igt_assert_f((addr_lo <= result) && (result <= addr_hi),
 >> +                    "value %lX out of range[0x%lX-0x%lX]\n", 
result, addr_lo, addr_hi);
 >> +}
 >> +
 >> +static void check_item_str(regex_t *regex, char **lines, const char 
*tag, const char *target)
 >> +{
 >> +       char *output;
 >> +
 >> +       igt_assert_f(output = get_coredump_item(regex, lines, tag), 
"Target not found:%s", tag);
 >> +       igt_debug("Compare %s: %s vs %s\n", tag, output, target);
 >> +       igt_assert_f(!strcmp(output, target), "Expected value:%s, 
received:%s\n", target, output);
 >> +}
 >> +
 >> +static void check_capture_out(regex_t *regex, char **lines)
 >> +{
 >> +       check_item_str(regex, lines, "Capture_source", "GuC");
 >> +       check_item_u64(regex, lines, "ACTHD", BASE_ADDRESS,
 >> +                      BASE_ADDRESS + BATCH_DW_COUNT * 
sizeof(uint32_t));
 >> +       check_item_u64(regex, lines, "RING_BBADDR", BASE_ADDRESS,
 >> +                      BASE_ADDRESS + BATCH_DW_COUNT * 
sizeof(uint32_t));
 > alan: why are we not checking the engine instance - ensure the 
drm_queue's engine (the one we just
 > tested to hang) matches what  the devcoredump dumped?
Good idea, will check engine name in next rev.
 >
 >> +}
 >> +
 >> +/**
 >> + * SUBTEST: reset
 >> + * Description: Reset GuC, check devcoredump output values
 >> + */
 >> +static void test_card(int fd)
 > alan: nit: maybe rename from "test_card" to some a bit more 
descriptive like
 > "trigger_hwe_resets_and_verify_devcoredump"?
Ok, np
 >> +{
 >> +       struct drm_xe_engine_class_instance *hwe;
 >> +       regex_t regex;
 >> +       char **lines;
 >> +       char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
 >> +       char path[MAX_PATH_NAME_LEN];
 >> +
 >> +       igt_assert_f(single_line_buf, "Out of memory.\n");
 >> +
 >> +       regcomp(&regex, REGEX_KEY_VALUE_PAIR, REG_EXTENDED | 
REG_NEWLINE);
 >> +       get_devcoredump_path(igt_device_get_card_index(fd), path);
 >> +       lines = alloc_lines_buffer();
 >> +
 >> +       /* clear old devcoredump, if any */
 >> +       rm_devcoredump(path);
 >> +
 >> +       xe_for_each_engine(fd, hwe) {
 >> +               igt_debug("Running on engine class: %x instance: 
%x\n", hwe->engine_class,
 >> +                         hwe->engine_instance);
 >> +               test_legacy_mode(fd, hwe, 1, 1, 0);
 > alan: nit: maybe rename test_legacy_mode to trigger_reset?
 > actually i wonder if this entire subtest can reuse the
I think is better to keep the same name if we copy the most code from 
other test.
 >> +
 >> +               /* assert devcoredump created */
 >> +               igt_assert_f(access_devcoredump(path, lines, 
single_line_buf),
 >> +                            "Devcoredump not exist, errno=%d.\n", 
errno);
 >> +
 >> +               check_capture_out(&regex, lines);
 >> +
 >> +               /* clear devcoredump */
 >> +               rm_devcoredump(path);
 >> +               sleep(1);
 >> +               /* Assert devcoredump removed */
 >> +               igt_assert_f(!access_devcoredump(path, NULL, NULL), 
"Devcoredump not removed\n");
 >> +       }
 >> +       /* Free lines buffer */
 >> +       free(lines);
 >> +       free(single_line_buf);
 >> +       regfree(&regex);
 >> +}
 >> +
 >> +igt_main
 >> +{
 >> +       int xe;
 >> +
 >> +       igt_fixture
 >> +               xe = drm_open_driver(DRIVER_XE);
 >> +
 >> +       igt_subtest("reset") {
 >> +               int gpu_count = 
drm_prepare_filtered_multigpu(DRIVER_XE);
 >> +
 >> +               igt_require(xe > 0);
 >> +               if (gpu_count >= 2) {
 >> +                       igt_multi_fork(child, gpu_count) {
 > alan: if we want to fork, then we ought to ensure that any 
igt_debug/warn/error/print functions
 > that report important info (during the batch buffer execution and 
retrieval + verification of
 > the devcoredumps) contain a way to differentiate which fd we are 
refering to.
 > Please ignore this comment if in fact igt_debug already has that 
built-in.
Yes, igt_debug already has it built-in, output example from ATSM:

(xe_exec_capture:4189) <g:1> DEBUG: Running on engine class: 4 instance: 0
(xe_exec_capture:4189) <g:1> DEBUG: Devcoredump found: 
/sys/class/drm/card2/device/devcoredump/data
(xe_exec_capture:4189) <g:1> DEBUG: Compare Capture_source: GuC vs GuC
(xe_exec_capture:4189) <g:1> DEBUG: Compare ACTHD: 0x00000700001a0020 vs 
[0x700001A0000-0x700001A0040]
(xe_exec_capture:4189) <g:1> DEBUG: Compare RING_BBADDR: 
0x00000700001a0001 vs [0x700001A0000-0x700001A0040]
(xe_exec_capture:4189) <g:1> DEBUG: Clearing devcoredump.
(xe_exec_capture:4187) <g:0> drmtest-DEBUG: Opened GPU0 card: /dev/dri/card1
(xe_exec_capture:4187) <g:0> drmtest-DEBUG: Opened previously opened 
device: /dev/dri/card1
(xe_exec_capture:4187) <g:0> DEBUG: Running on engine class: 0 instance: 0

Messages differentiated by "<g:x>", x increase per forked children, due 
to 1 forcked thread open 1 fd, so no mixed info here.

 >> +                               int gpu_fd;
 >> +
 >> +                               gpu_fd = drm_open_filtered_card(child);
 >> +                               igt_assert_f(gpu_fd > 0, "cannot 
open gpu-%d, errno=%d\n", child,
 >> +                                            errno);
 >> +                               igt_assert(is_xe_device(gpu_fd));
 >> +
 >> +                               test_card(gpu_fd);
 >> +                               drm_close_driver(gpu_fd);
 >> +                       }
 >> +                       igt_waitchildren();
 >> +               } else {
 >> +                       test_card(xe);
 >> +               }
 >> +       }
 >> +
 >> +       igt_fixture
 >> +               drm_close_driver(xe);
 >> +}
 >> diff --git a/tests/meson.build b/tests/meson.build
 >> index 2d8cb87d5..b724a7c6d 100644
 >> --- a/tests/meson.build
 >> +++ b/tests/meson.build
 >> @@ -284,6 +284,7 @@ intel_xe_progs = [
 >>          'xe_exec_atomic',
 >>          'xe_exec_balancer',
 >>          'xe_exec_basic',
 >> +       'xe_exec_capture',
 >>          'xe_exec_compute_mode',
 >>          'xe_exec_fault_mode',
 >>          'xe_exec_mix_modes',
 >> --
 >> 2.34.1
 >>
 >


