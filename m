Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0E8CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50010E713;
	Thu,  6 Nov 2025 11:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFbhdBzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6A510E722
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762428744; x=1793964744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H7/+26wJ3Mul5aLTQVcHMf99gVKOpcMX+ijM8+8WhBw=;
 b=cFbhdBzLjU+L8zkxmoghxA2bpijlt2jYcT5S5nAGUVXK3pHXaWSRAan1
 GPFfnGmeXROGowZl8YjGc999kulloyPCtN0e09sFJyapAA8XDH60BI6UT
 UOuERqRAajI3I5EkK3D4oaIG8YctkpCwkSSzusf++WwQJE4d4xvxq3SYM
 7/eoqN8HL+9xubAy0BudCbtbigu/MRi9mgO9aD1G6c/XWJATsnUNHViC1
 ePWPgLLGm7RtmjjEARVTQN3dZGsDmdPjg5v6gufEvnJ767AOPNui8VYtm
 4wAZV545RiD4zxlu6bznidhZGWVRUTBr7oKtACdVbVPTL20pFlD8EzVGa A==;
X-CSE-ConnectionGUID: d9G62/TMTsKDsj2rWwoc8w==
X-CSE-MsgGUID: aBgZ8btYTgu9oNCzpjKHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75248025"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75248025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:32:24 -0800
X-CSE-ConnectionGUID: sZMESvPSQu+ipEVqVYT8gw==
X-CSE-MsgGUID: xK/hkTsgSDi9m1JNnfl+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187023635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:32:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:32:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 03:32:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:32:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGyHtcE52QIFmmTAmlefVuAROJUH+IG7pur6gQvNyVJEMqYWEUBPjaL8PCJY0Is2vRoQw6ClWQ+Tp3i3YGHB1LsljiTVB1jZgpmjkLHGXCubm8d9JKyF4SnP9uggBmYZFTidJA9RhNFMLvpmCIjxyZgjToUVUfi8oCXZKGHh4aqPW9gK3zFla8U5n4fzKe6H/xSZpJ+F2lP0NjDkRPozfLWu1ec2ksnEpSelXCHbrsuWCbZzD4789GOwXidBJGl7mE1BEypcWTWqzYGt801t5oPh55CwDfvSkK0rdNiyNdh2L2cz0+y0DssVprliCcX3Aru8t6V+ScVtJShl+BTtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtG3fZ6YxnCcHMIRDKEtR0XDn0siec3lMLDlCUKFUww=;
 b=B00c9t82pQRH+w2i+GjNRzAfgiIccA3ygpuyCFHIyRXFsb0xNG9D5XBm5FtKZI2AfbmYMc+t2L9P/K0KFNeNlJViZs4Nf5abJ9/CvRvl/DHPHTA71JCUy4bGUmJea553mzql87jhs1d9XR0Aa/oQoRzwssw7gtv+YIODAhGqwmbhmsqCFluy5pOeccuP+trBqfMOBCU9r7xhFKh7/5LzaxnIDOQLaOmLcRO6ZomymIYpPzbQ8EZ50M0mQisbxcE3TR9MIcvKRIDVbC2yG16PPspZpDmuxgdesb4LBm5txhiQstVDR7gHZSd4utx2t6zU+AS8UUzYr7yDBg/tAOjmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:32:15 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 11:32:14 +0000
Message-ID: <2cbfa06f-88fa-43fe-8184-bd5f6f856b7d@intel.com>
Date: Thu, 6 Nov 2025 12:32:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] lib/xe/xe_query: Add tile helpers and iteration
 macro
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <piotr.piorkowski@intel.com>, <jakub1.kolakowski@intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20251031125633.1374273-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA3PR11MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a29f4c-931c-413d-5c5e-08de1d28223b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2dKeDhPeW9tS0s1YlBWWkJkOVlpZUpiK2luVW9OYjVMdGRJWU5TNjlTRHhi?=
 =?utf-8?B?V3lmUmJCT05uTG92M2xjZExqM094ZXd6RjZoemxmZldjeDFqQzJNeHVpQ1k3?=
 =?utf-8?B?Y01Mc3h5U1BWM2l2dTBnWGd3dHdoTmxJRXc2aGp1RTErY2pQNHY0YjJPUlVs?=
 =?utf-8?B?YW9MSGd0VElaS1hFSEpxb1V1a3JNTEl6Zi9TTmNoYTdkbjZRUVcvVWZrZ09K?=
 =?utf-8?B?aTdzSW9LUGRzT2RZUFF3Qmg5N3didit6WmJkN1pIM2dFWExoNktQdllaYS9U?=
 =?utf-8?B?VUhKY1k0TFlaNWtQaDJYR1k3MG82aGliMlVHa01ISzVBdWFWM2RrU1p5djBZ?=
 =?utf-8?B?RGdqS0pLMmt5YUtPdFZmQ0dvSmtsMmNvVWlIZ2FIOEQySWdFWHJMOXorQ3dm?=
 =?utf-8?B?RjNsS2RWMkZUaU9RWkp4MUJYa0FZMWRlb0Jnc2NuNExVQW9qMDNqWWRQMTFa?=
 =?utf-8?B?M1lPQ3pZZEl4M0tkM1lrd3RJSURmWjcwZnVtVVVFNUsyQTJwZHhWcUw0OEFq?=
 =?utf-8?B?QnJFWm1mSXo0TWJ1dER6SUJOVlNnRFY4NWt2bjZ5Rmc1VG5tbkxTR0d2a0Ri?=
 =?utf-8?B?ei9wWjNOUHd5a3AzY0xsb2tvOS9iTE1yVGs2TUl0TEY5S3NNQUpIRFM3Q3RU?=
 =?utf-8?B?U3V1UWtUaW5jY21McDNLNGZwcVY2NEVDbXBkSHMyL09QQ2FlUGF5YXl4dmQv?=
 =?utf-8?B?MnAwcEhsVjVaWGpnejB0NTB2cVViNHZsTWJScFpPaE8xcy90ZXprelNSZmJu?=
 =?utf-8?B?SEtrUTJHRE84SXlVR0R3RXNhK3N3Tytwa2czbmo3L1RyTDdIMHUybHNhY2Ev?=
 =?utf-8?B?U242cHhPR0tVeFQzRUJ4V0VCWlp0bDNaSjdkYUFYNFVHbTFTU2IyUmdab1ZW?=
 =?utf-8?B?KzhCcmhieUlvRjhFbXdZUjV3cmxKcUhkenJxejRIQ0FTOE5ubjBycnJCdG5W?=
 =?utf-8?B?Z280bEpyckFBUXNUOGxRYmkrWWpaVVY2a1o4c3h4WWRqYTAzZzVZdzBSRWNO?=
 =?utf-8?B?Q0pkN003U3c4cnNLdUwzUmszT0p5bXpIZXZtcmVNaWI3YWcvRzlMK05INk1I?=
 =?utf-8?B?YW8zOHBNemJoa0dPOENsbzh4OXYyK1Exc21BS2VXSWRDSWlKbTR4YUZTK1Ri?=
 =?utf-8?B?Tjh2SVBxaGpJcnRLRWVGckdPMWdPQTUvb3prTDVnczlRRzJvNHZNRWxVb0t6?=
 =?utf-8?B?VjJBNGlrYzZzQjFkR2ZXZkdYV3J2REtDenAxRHA1QVRIOWhQOEZTYjB2ME1I?=
 =?utf-8?B?SU9jSGRzaTBhUHFENXNNZE9PQVlvemhBS2NqT01CNVQ4M2U5Nlo1UWV2NjVE?=
 =?utf-8?B?SFBDdmI1elJLWVE2M1RtRWljZTlibHI3Y2M0bmd4TVhTSitpaTFPU3VVODlD?=
 =?utf-8?B?bFAyUGI3aFF3c01ROWRTZTFQeHFjMGN2emtxNGJRSjFUSnBnbTF4VldtUllU?=
 =?utf-8?B?b0dqSURRNjJYOVlxSkE3TzB1TXhHMkJRa1pKZWZnYjhNaWptMUszTU5sbHhT?=
 =?utf-8?B?QkJrZ0dQZ0JNZVZPallJaWZVcDdtWHhiTk5vMnhjeWR5OVRTdXdXZWpCOTgz?=
 =?utf-8?B?aDRndnhvMG1leFpDZkVoeURFVXRjZFBka2p3Q1BnM2xoM0FzVklZeWdna1Ju?=
 =?utf-8?B?dFhJYUFObDM5akpWMFNsQ2toWFRoRThsTWpSNXFlTmVHemNaQWlTODhzaG1h?=
 =?utf-8?B?NEgybTRJdGNIank3UUFxY0VHTTB1dzQyYjUrWTE0aWZ5cUF1VVZXOHNNSzBw?=
 =?utf-8?B?eEJLZjI4VHNCY3VTVnA4Q3lrU0hmUHV6S1p6NFNSQTl2eFJhNmV6YkhSZnlP?=
 =?utf-8?B?SWJDWEtLU3k2QWNrejhMNUtsNzl1ZzJuYlRHeXhjQXhtUzZ5eXR2SEFzdUtp?=
 =?utf-8?B?YkFZNVh3OVNjZitVZjJpZk41S0dBUzllUVUxc0kyUEhWU0hQWUJCRjJmNzVB?=
 =?utf-8?Q?OEczoV2n8UlmMfzxfYSCfTbqYLoLlDAj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHd6aU15ZUtmUWQwUGN3RnlQcGlLeXVNd09nZlZJajJ5VE53ckdsRVJlTjUv?=
 =?utf-8?B?c01oNlJUNjY3dWNLU1ZYMjlFMUNFaXkxem1SeTJEYmhyU2lKUWdNRHhUSXEz?=
 =?utf-8?B?bFBzL1R3emFTMnJBdTBPWkQxVjVUY2FGbTAyblBqVWZPeS84ZWJkVXYyaHZ3?=
 =?utf-8?B?NjlBdWtvVEFZOGNIajE4L1FqR1pYUktud1FtNkpKcytTdzAzQzRlUlEvSXlp?=
 =?utf-8?B?cGxRKzBWdkV2YXBRRFNxVFg3SHNETzlEM0FZQnhVVHFQM1NNSHFJSDBpT1pq?=
 =?utf-8?B?UytpMkQ0V3FLaHRJS1pZSHFQSkxDNTh0OENodHZQOUFYUE1ObktZRW9xQ2xz?=
 =?utf-8?B?WDRxVXZ1ZTVwNzg3Si9XOHlZeEUzM2syTW84L3YrNmRZdzBYOXU0d2owenlM?=
 =?utf-8?B?VUowY3NoQkZEUTE3OFNpNnorWGh4bWtqQ1R3RWhQcHU1UysrT1RJTWJZMHAv?=
 =?utf-8?B?UXlBS2c1SDlPK0RGVGdENW1haTZoTVdlLzJmQnE1d2dlZEFsaFhwcmQrdWhs?=
 =?utf-8?B?eGRCQ3BJZGJJVENvT0pXMCtaZjF2VnFSSVdCRVdOTWE1cWNaMHJIMjhJYUc5?=
 =?utf-8?B?L0ZtUzVIK2tXaTZXYVNRSmVxOVdrQjlnUDJtdlI2UEk2UW5UL3VUS0tybVFK?=
 =?utf-8?B?M29YVmpHSnEydkM2TVVnSStObkhzalR4NnFaQzZrSSt4dy9ZUEpFTjR1eGlQ?=
 =?utf-8?B?WDRhQUw2d1lJY1p2LzBwQjJUV3l0d3NSd1ZXL2NLNUNCeThibG1Rb20zKzh3?=
 =?utf-8?B?RzR2bGwyUHhkNmdmV09KdVVoU2JtOWtUQXJLczhJNHVKU1U3Zzlvck83cTYv?=
 =?utf-8?B?aGdUc09EOUZoLzd4UmgrbG8wNCtxL2g0N1ZidWp3QTVQYlRFTDdTS3RkTXNi?=
 =?utf-8?B?SUxpRzI1ZnI5NFphVmNZSWcrUTN0ekc0VEFXd1AzVngvZUdwdkxXTEt2N1pk?=
 =?utf-8?B?Uk43VlRTNllQRVRnYmpPdnk5M2xEamIrUTJ2REk1bzZzUGtEM2UvaWZXMi9o?=
 =?utf-8?B?Q2o5MVZnbktLU2hiV0JGVExrbUE0eTg4dFMxZi9VeS9YdUpCSHArdVFJZUNH?=
 =?utf-8?B?MHVmUDFDcFE2NXk3WVVZQnk1OFhyTkhWUUdUOEs3Q0cycHF4Tk5nei9zdnlH?=
 =?utf-8?B?VTlEK1VFWW9wNXJqUmIxQXdkeXE1dzhjelRsaHdBYUV0dExLMGpyNUtYeXZJ?=
 =?utf-8?B?ZDJycEk0VlR6WENwVUs3dVFtMUFpTTJQT21vaThtSU9yTU5oUllISGpjZHlp?=
 =?utf-8?B?enpZN0pMZ3ZZRkFGc0JmNXNoYnVNa2pndk92OHpZaGlQZGRaYTRlT1lVeFNQ?=
 =?utf-8?B?c2JndzVwaVhzN2ZYTDBYS0ZlS0kxaGhBcExGOHRJYkdUNXFxVFYxaDNiMGlx?=
 =?utf-8?B?RnVBUUN5Z3ZaZ2oyK21HNGRVeUxONFBVdU1vZXE3Y0lGcGZmZW5vVjgxcVlK?=
 =?utf-8?B?YmhhNmtqU3p6azJaQ0lmM3U2OXdNT0pJRnQ1dVZpODQ5aFZjNHZGdVN2RVFH?=
 =?utf-8?B?YTVaVmZqU2o0NnFhSG5ZT28zQndtamFqOWhwRWhvZTgxOFJnN24wU244c0ls?=
 =?utf-8?B?VVlwM0FrVTdZZTZFaHJqLzNGaHhOcWlrdUliUmFVWnJEZXVNemdJZkg1YXpU?=
 =?utf-8?B?ZnRaSlR6SjhYUWUrZXZNYU44a2hhQXRpWUZGMFRDaUNkQnhrWHhRMDdqZ0c4?=
 =?utf-8?B?ZVRXTTh4dVJaa1dLdkRaSDE5all2Zzdxc0dGcVljOFRCYmRHNDRYcG8wSHM3?=
 =?utf-8?B?STg1RC9LTjVUSVczeG1qSTJiUkMyYTY5NHRwdHMrR21CZnIrM1NaSDZocmQw?=
 =?utf-8?B?UDMyWlZwQ3RoaXVXUSttRTlxbzIzVk9IVjFaUEVpQVU2OUw2Q1FTYWlNS2xw?=
 =?utf-8?B?ZDc1cnZBNmRRRDFVYWF0dDRZWmJ2ZG1lTS9jVEZRUkFZNmUwQTQ5R3RncEpZ?=
 =?utf-8?B?bUJnaXNhSVE0RVRSRVMzWExWTSs1UHJWMFZ3L29SOWt4Wk9hK21DMTNtbXpR?=
 =?utf-8?B?TU5FQnZVVUd2NnUwcDBxNnRGanFyZXhsd2MvaG5abFlRMXg4akJDcU9obFBQ?=
 =?utf-8?B?S0R0TTBDUjRnc1FoRDAxVEpmQzM4ejl1ck9yRnovdnBudmFGblhmcGhyWmE0?=
 =?utf-8?Q?dq8qrq+/2fwrWwsH/0riUFFGZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a29f4c-931c-413d-5c5e-08de1d28223b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:32:14.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgAOYx62hFvuB070BUuZ7TcoJ+PoFGuJZ97q3Huix3uFGjbBXfvmdQdWU/+PhRm30eUsTHV4dNPCwRSQc7CabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
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


On 10/31/2025 13:56, Marcin Bernatowicz wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add helpers for tile-level access:
>   - xe_tiles_count(): return number of tiles
>   - xe_tile_get_main_gt_id(): get MAIN GT ID for a tile
>   - xe_for_each_tile(): iterate over tiles via tile_mask
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/xe/xe_query.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_query.h |  6 ++++++
>   2 files changed, 51 insertions(+)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a89e0b980..e58b3bf1e 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
>   	return igt_fls(xe_dev->gt_mask) - 1;
>   }
>   
> +/**
> + * xe_tiles_count

missing colon

> + * @fd: xe device fd
> + *
> + * Return number of tiles for xe device fd.
> + */
> +uint8_t xe_tiles_count(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	return igt_hweight(xe_dev->tile_mask);
> +}
> +
>   /**
>    * all_memory_regions:
>    * @fd: xe device fd
> @@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
>   	return xe_dev->gt_list->gt_list[gt].tile_id;
>   }
>   
> +/**
> + * xe_tile_get_main_gt_id:
> + * @fd: xe device fd
> + * @tile: tile id
> + *
> + * Returns main GT ID for given @tile.
> + */
> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)

nit: uint16_t? Do we expect so many GTs?

> +{
> +	struct xe_device *xe_dev;
> +	int gt_id = -1;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
> +		const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
> +
> +		if (gt_data->tile_id == tile && gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
> +			gt_id = gt_data->gt_id;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
> +
> +	return gt_id;
> +}
> +
>   /**
>    * xe_hwconfig_lookup_value:
>    * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 715b64e2f..bcdfb54b0 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -86,6 +86,10 @@ struct xe_device {
>   	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>   	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>   	     igt_unique(__mask) &= ~(1ull << __gt))
> +#define xe_for_each_tile(__fd, __tile) \
> +	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
> +	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> +	     igt_unique(__mask) &= ~(1ull << __tile))
>   #define xe_for_each_mem_region(__fd, __memreg, __r) \
>   	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
>   		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
> @@ -101,6 +105,7 @@ struct xe_device {
>   
>   unsigned int xe_number_gt(int fd);
>   unsigned int xe_dev_max_gt(int fd);
> +uint8_t xe_tiles_count(int fd);
>   uint64_t all_memory_regions(int fd);
>   uint64_t system_memory(int fd);
>   const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> @@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
>   bool xe_is_media_gt(int fd, int gt);
>   bool xe_is_main_gt(int fd, int gt);
>   uint16_t xe_gt_get_tile_id(int fd, int gt);
> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
>   uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
>   int xe_query_pxp_status(int fd);
>   int xe_wait_for_pxp_init(int fd);

Looks good overall, just please fix the missing colon:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

