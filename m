Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88070EEA84B
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 20:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515010E2AE;
	Thu, 12 Feb 2026 20:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hya3GDQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10FA10E2AF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770929724; x=1802465724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=psUsyZWnwWf2v+/VBSs5RXq5eYBVKIutq58dRjtf+so=;
 b=Hya3GDQBgj4Qy9vwmg+Xvd9n2rXETwr8u7zYVTZOlr/Jy/rQ1WHeHowo
 +Tanqu+8zyVySHOcJRr3LEotVOXiP8ab+PsITpdvJCNuI3BwWVKUABEEn
 JEeEDOLSFHftxI5WkNufign3scmV4o6q4u8VH55Xw9URBZdEGaRkzNV4C
 KR/XtBso42DCHJnoi3KBOYq70L+5ADZMrzCrEhcEg82cMdr4yt/5WmtPf
 ytcjMO+atBDZZlZw7A22EyL3eaOTcapukNb72qO33or2b87dBXw5NFNRD
 x2q4+scpYtwANhkbcxiQTI5sXMv85Rr0z1648+WJPqjldZta2stixCRvD g==;
X-CSE-ConnectionGUID: MNo9eHFNRVO/fT/undq50g==
X-CSE-MsgGUID: v/qppKaISJSnFnQPSladlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72187572"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72187572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:55:23 -0800
X-CSE-ConnectionGUID: T7LwMz2vT7yFb4v58hEntw==
X-CSE-MsgGUID: 55oenq3aTmCi6e7Ot+YmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="243312482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:55:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:55:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 12:55:21 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiShWbw3w28HIC+7Vl5jgY7HOhgc0BuWpLexu6KFLUYmaw2swMLRZOfdyryu2RPl+yvu29mQuQqGxsPT+j09gguEc7HtNIR0GyT3qYE1T9Sg49+m7ZKb37kdyFyORIWOJU9V1Rmcnqb/NIA5OC+8QmWSSnWVJZbGYsoVoFGdIKVqKZvKAlE7VMJoovMB2Ii+bLDEALQdzmikq5IfiwyHIo0OGSauw0HRaWGFM8K5Nf8ZrE0dTJEfmPgmwZ+qL6aKngpJ62e+6vw4w8japk43FsXIZ9KDEQ8HF0qMiYzhvMxka0ix5ljDkQj4UFYdy6PupXqdbleqUqt220EpX0gANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9qNr/g8MV/HqjmLPVRup+6ruF9pvu2QxHYs/pCxO1c=;
 b=IlDmIjRlElrm1N+AmDCkHR5E5+oMyKNWoWEpG9m1sALxq+OrLymyWqUQUKpecluXacksHE7DBoz05nulJczhCkk64F3QEUM0YQ6u1caZ6vVH0vW643UYKeWGiqJB0q7Djq2H1BBFYLkUwz022KpdYuzA+bIcFC0k61c3gfXEFXCpUgiIV43e7QpHje7C6L0r0gJ+INty1eTq5dAr5zhWAzTCEEhobj/TBlhxqxKhNuxLOLAWbGsTtttJSPUWADZR3INnp6p2ZSJYQBK49d0bciWxCdkTtF1uqWIyUFkXQCjx/Vi3NT40GQQYr/PtmstBl12cJ0e5Xlf3BQbg0A6KAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 20:55:19 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 20:55:19 +0000
Message-ID: <175703cc-a270-49e6-9861-7173d3034f83@intel.com>
Date: Fri, 13 Feb 2026 02:25:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/kms_color_pipeline: Run tests on all
 supported planes
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
 <20260202060415.2680288-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260202060415.2680288-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6adbdb-f656-45c9-eefd-08de6a790815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU1oZzhka1lCVzJ4TnpSZVVZNkVaOFIzYWZUSG5jVEg4TzhhRzhqeSs4UG1H?=
 =?utf-8?B?ZnV2MTl3RUUwSmlVelc2WWNkUDkrQlZMRENnU0dJUHhEVGFHdnFaQXRzcnpU?=
 =?utf-8?B?dTZTajBBNUZRK0QyMEdTOWxiQmxoY09sS0IxYlJDYVVwOUV3ZmE1eTBQRjNG?=
 =?utf-8?B?NklPU21QRlJtdDJRQStsTEg2NTNGbG1kL0RCR1dIQ1MyZExRdFVSblV5dlBV?=
 =?utf-8?B?eHVDSjVJUFF6SCtUSVR3enQ2UkwzUTBCaTZ1OWtRTWNHcHJDQ214L3JZRXN4?=
 =?utf-8?B?NkFwNVJnZWU1Y0ZVaHRWVjIvVGJvcnR3eVQ1bVdGL2ZIcmIvNXkremhCNFFh?=
 =?utf-8?B?Nk9OTkZteWE5Qy9HNk1ua2RySERubmtmQVlHaUtKS0tRSTBNTm12YWFWbWlV?=
 =?utf-8?B?SlJoRTAyUXhZeGxUVHJlS295ZGozbkRTdjJ3WEo5M3o4QTJkY08ySHg4VkpX?=
 =?utf-8?B?Q0xlWWVGS1RnNSt3cm5EaHFhR2J2VXE3cmhWYU1BZUJXUXBxbVliOWEzSnlS?=
 =?utf-8?B?UDBudEpCdjNsbklSOStCS29nbGszSGdpd1A3dWdtTkVLdkhLRW5vZjNBUVJ5?=
 =?utf-8?B?ZFIzOTA4L3d6b3Y2aSsyM2dVZkFGU1dDWGFZb0FrRXJJdUJQaG1DTlk0TGRF?=
 =?utf-8?B?eng1U3ZvVzVyeFNhR2FLT0huUGdLQVdwM2Q4bHk5MjFWZFo1RTZhWGpCNTZY?=
 =?utf-8?B?eXR4ajR3TkdYOEY0dmc2MVRibHN5bDZqZEpTUGF4VW1ISzFqZytXUkNGbm1N?=
 =?utf-8?B?N1NUSzlkdmVwVjlJbEdGM1hWczUwdkxlVHR4ODdSaTJJNXJ2R2dhQnFSQ2ZV?=
 =?utf-8?B?TTNDODNkdnZER2NQTnpHVm1GTU50bDlEN2UwTHBkVWhGT3piYkN6Q3JzdXVj?=
 =?utf-8?B?d0JRZFY4ckJkV2ZLZFNldWx1S090Vlpva2R4T3BiVHVJZlE4bjc0M1pqWEVU?=
 =?utf-8?B?NlNWV3VEME0rMWdYQmVuSmNnZ1pUeUkrTXlaOTBDbTNMdTMwaEZnZW01WTdL?=
 =?utf-8?B?bEs0L1FPaXZTejRqQTRpU1JHdVY2RDE0RzM3S2IrcytqZjlpYklmY1Y0bXlH?=
 =?utf-8?B?VlJHOXU1cXlkQlAzcStkOEk5bWxxTWJIMlhpWFgwVmExMFQzQmlxQnc0SWY4?=
 =?utf-8?B?SFdOUFB4U3IwTG14TDJXc3pzalZsU1pTQmVnbXhyNThURGpLQy9XUzBNT0hw?=
 =?utf-8?B?S0E3VkRpMzRzVVhwRHZWZnBNUmZySTV6ZUZaTGoxbzR4T3pLdm9Od0w4Umg1?=
 =?utf-8?B?MGFBc2FMcWJ6RlZpanpYdlNYUXNkQm9YSFZidkNWVFdPcFg3Q3A0YjRxSWIw?=
 =?utf-8?B?UitxN1JTZ1IvUDg2cHZTMWJGQlRKYk55WlJ4RHEwV05aZkVEZlZYZ3VCbWpy?=
 =?utf-8?B?OTk2YVNKaUNNVnE3amU0TzlEMStmeXE0VE9HbStiNWw1TmxrRUtqdXpGeEVG?=
 =?utf-8?B?b3JjNDVmdHM4OERiOENLUTFzY21ZY3ZIaVNlcGl6MDRkemtHUFNPRW1sVWV4?=
 =?utf-8?B?MkNsdlU5SnAvKzh2ek5heDQrQzBiTmFlNkpoNDdmYkl0WVM0MEFVNndiTGpj?=
 =?utf-8?B?NGlGN1VTRkVEMzg5d0lISXJBellQRlNaaVFRUlhBNnBkYUZvUHEzTFpnRjI0?=
 =?utf-8?B?WU9vdVUwYWlZdTdabFRIaUliejEwY2c4USs1aUF6ZFkzQ3ZBOWlUVStDbG5Y?=
 =?utf-8?B?WktqWWNwenBQR2ZnTnFBdXFycHNkTWpxNVdxalJza00wU2xsVmR1bzFTZk0z?=
 =?utf-8?B?SGtYY2JMRTl4V20xVnZabTVhTmhQR2xkejhJMFhXVXFXVFEvUlk0Tkd2Z21l?=
 =?utf-8?B?SEFaUmVrVjgvelJETlNJcnEzdXNiSU9yQkt6ZElkZU1sZi9qM2cxY2RxdnRB?=
 =?utf-8?B?aFhHTDRka0RmRkovelIzVlNSTEh0dG9hMnZtQU00RktCSlYzVzFVOGZydnc0?=
 =?utf-8?B?TnYvTTBrUFA5cVk3a0hMTWFjMnpXdjYvb0Q4MW8wWkVpaFRObldRTVdXSEhR?=
 =?utf-8?B?dk5CM2F6S0J4Q1hXUDBZbEl2Z1hoRzdDbUZSQjQ4cXc5NmhGNjlXN09ZeW1y?=
 =?utf-8?B?eWZKbHpvS0ppVm8xUTg5ZnZiOElEdXFObGw4eUJmK2oxZ0tCNDJJMTdTNTNW?=
 =?utf-8?Q?AYbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVVMldxWDQwSWNTbVdjZWtYZlBPUjhlY2U3cGtxS1VuRVJFR3BpS2xxaVE2?=
 =?utf-8?B?L1V5Q2d6b1RsRHBJaUdRZGJYTUV0OHBlM3dEOGMrOXlUS0p5L3NNOTVMVytE?=
 =?utf-8?B?Q0U2cFlWSjJMT0Zrb1c5Q0xpd3V0bTUrVWpORFFKUS91QXhuWTB1MmtGajMz?=
 =?utf-8?B?Sm9UYlQrK3hLRVM5K2JkOXJzakJtRlRzUEMzQTQxK3pmZ1pub010a0IrejlL?=
 =?utf-8?B?UFloRzFqMk43ZlBVbllsZ0l6a2lOZythZjBMa0sxaFVoZkd6RDVGUUorbnk2?=
 =?utf-8?B?STlhRjdoaEtrS0FuYmtuT1BKZnA4MFgvSVU5aEp2RVEveCsvdit6ZnVPT3pr?=
 =?utf-8?B?THhJL2RBeEtLYTByWW1Sanh5VkRhVFRDMFVGVEVxVEJJdlh6VEhtRlF5Yi9U?=
 =?utf-8?B?YjdtZUdBeDRHMm91RHpQT050OTNXM1Vqa0xxbTRRNlZvUERER0NXOUtOOGxr?=
 =?utf-8?B?aThqSmxUQjRBaEJia3E3TjFHZCtpaC9CSGVSWVFQVjdEVk03N1NQMUtZQ2Qx?=
 =?utf-8?B?d01nTTdLbFRzZ3JJWUV0WUM5WXh4TTF4R2cwUjZDREtUOWlQYkFKY1BFcUo2?=
 =?utf-8?B?QjZrOVFzMEROcythTHV2V0wwTG9qdDhLSWxNRlhTdC9VL3JKbHV2dEh0VXpO?=
 =?utf-8?B?WGZDeGVBdWJqN0owUzBNM2F0dlY3N2crSDlQRFI4U0lIMk8vY3YxZUhmMm5B?=
 =?utf-8?B?OWNpd2E4OE9wcU5Hdlg2ejBNUVhsZ1JyTDNKaWg0SUMvaFJxZmlHTmpFQkxC?=
 =?utf-8?B?clpDb0puWnZTdFJ0Vmlzd3pYbFE3eHFuU3E0aUIxNERxK1B2c3VlNzhPSmpu?=
 =?utf-8?B?cjFCVkVpR3pHTGk3VjdXMTAyUFNhbUE2allqT1llaytyRkFoNkROTVFlUWNn?=
 =?utf-8?B?SlJFMjdHdXpQUTBoMk5tSVhCWGN2cENYbnBWTVZ1Y0UxQVExTmtJUUoxWjNK?=
 =?utf-8?B?SnRpZENYbHl1cnhxR3lVcjJsNDhrQVVVRlp0Y3h3bTVGUUVQY1ZJemZzWFFm?=
 =?utf-8?B?dm0wUDBaVzFWMS9UYzRGVnBkYXZzZVg5RlhhZ29kU0V4QWNCZ1JnZFlpVG04?=
 =?utf-8?B?VUdxSFNKVWxqOEJPbEZMRm5qLzZkc3RtckhFK3JJOFc1ZExzTWRubHJHNEcr?=
 =?utf-8?B?R1A0VmtGY1A2QTJJUUZxWkNkaWVjbkpsV0x2aFZTOFVxVSttV0tjSWxNOHB3?=
 =?utf-8?B?VjJHd2oxTlZuNmFBVkVKWGhybGl4dGdwMnVHU1JNUzJBSHlFSTNNTTVqRS9Z?=
 =?utf-8?B?VEluNlNDK0VweW42Z2JMU2N0a21tYjhLdUIxdUdKbzRMZ3UyUUtBY1k3NytN?=
 =?utf-8?B?cW5rMjZXVnBqcnBXdGJHTlRYaERkVUhWUFZVSDdTU05vSEg0MVQ3Q0xKd3pq?=
 =?utf-8?B?UndZYy84QVdxNTNEY2dMZnJtS2N6VUx1WXdiRThFa2cxR3JqMWdUTVl4bnlw?=
 =?utf-8?B?NGRqbHRkcW1iS0YvOWhTQU9JOEgxa21JenZDdzZhbGdZblhqeHRGTWpzUWI1?=
 =?utf-8?B?MGlTVi9ybHBHcGxvZWJFUVJmYmVvdGtCSGJ2MWRQdkZ3cXVYMTk1UEpKWkE3?=
 =?utf-8?B?S0dpSkt6eTNubjJQUzNPTHpOUUc1YkVpRlQ4dy9YWHdNWThlcXZua2Nlc0tD?=
 =?utf-8?B?U1FRb1pVaTNybkgweVlkMml4Q014Q0tleTJXUnN6WFdiNzB3OEtWdzUyS1JL?=
 =?utf-8?B?V2R4ZjUyZGZBWG52NzlmaERXUnhNTCtXbTNuek5xaG5WUGJlRHZld0NES2tS?=
 =?utf-8?B?blVQV1duZy9SY1UvRnQxL29pMDVrQkVDdUhqRGsvVEQ1RDNvYlhkVThQMUNm?=
 =?utf-8?B?N09MM1BvYmpZcUZCZFN6dGp4dVB1MndZNXk0WDhWdm9CekNlZFp5RU1IaGVM?=
 =?utf-8?B?LzNPRnpCVXgyRm1tZk1mOVcwVzNIN09SVGp6ZTZxT1VUMW5oL3FuOEd1cjR5?=
 =?utf-8?B?WFVkVk9aV29UZVZLTHdYZVVwYUZDNE9ZRFBPY090YkdWNmppcWw5MHdJV3ND?=
 =?utf-8?B?bk9ldit5TVl4aU1jejdOd0ZqR3E4ZDRMd1FGSmNLeVBLeC80eEorTEJMY3dn?=
 =?utf-8?B?Wi9ZMlVvaWlhbUorU29ib2lxRElYcXZxazFDY29QanZPWDN0bXY1TGxaZlgz?=
 =?utf-8?B?RU91RzM3WVpScjYxcnpMNkRZOE5QeE91dGZicmlWUWUrNWF3c21RMjFqZFov?=
 =?utf-8?B?VkNoNFZRV01LOUtvMVc5aCsxejdicjVobHZYYzNGNGpmU1kzQnU1S1lsRVVU?=
 =?utf-8?B?NDdnWFdhcDJlMUJuczUzMU10Z2lDMTRjZzg0NUNPQzdkYmlkaUVUWmpycy9q?=
 =?utf-8?B?MEJtK2huREIzNVR4OTVHeTQ0b1Yrc0xYL0tFZ3d2bERrTWdUdEgvQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6adbdb-f656-45c9-eefd-08de6a790815
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:55:19.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8n1VKlmar8PqwZvphdelCxn+9U+1tqqOhpHju5yRLHLe5fgL6+h8IdudirDXPLJk6D+arcGh7OezqWaUqTVdFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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

Hi Chaitanya,

On 02-02-2026 11:34 am, Chaitanya Kumar Borah wrote:

> Extend the color pipeline tests to run on all planes of a pipe that
> exposes COLOR_PIPELINE property instead of only the primary plane.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 56 ++++++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 24 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 7c4b89139..dd2eed637 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -62,7 +62,7 @@ static void test_setup(data_t *data, enum pipe p)
>   	data->mode = igt_output_get_mode(data->output);
>   	igt_require(data->mode);
>   
> -	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
> +	data->pipe_crc = igt_crtc_crc_new(crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
>   	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -83,18 +83,17 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> -static bool test_plane_colorops(data_t *data,
> -				const color_t *fb_colors,
> -				const color_t *exp_colors,
> -				kms_colorop_t *colorops[])
> +static void _test_plane_colorops(data_t *data, enum pipe pipe,
pipe parameter in _test_plane_colorops() is currently unused, please 
remove.
> +				 igt_plane_t *plane,
> +				 const color_t *fb_colors,
> +				 const color_t *exp_colors,
> +				 kms_colorop_t *colorops[])
>   {
> -	igt_plane_t *plane = data->primary;
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
>   	igt_crc_t crc_ref, crc_pipe;
>   	struct igt_fb fb;
> -	bool ret;
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
>   	igt_skip_on(!color_pipeline);
> @@ -139,7 +138,7 @@ static bool test_plane_colorops(data_t *data,
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> -	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
> +	igt_assert_crc_equal(&crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
>   	set_color_pipeline_bypass(plane);
> @@ -148,8 +147,26 @@ static bool test_plane_colorops(data_t *data,
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
>   	igt_remove_fb(data->drm_fd, &fb);
> +}
>   
> -	return ret;
> +static void test_plane_colorops(data_t *data, enum pipe pipe,
> +				const color_t *fb_colors,
> +				const color_t *exp_colors,
> +				kms_colorop_t *colorops[])
> +{
> +	int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane_id)
> +			_test_plane_colorops(data, pipe, plane, fb_colors, exp_colors, colorops);
> +	}
>   }
>   
>   static void
> @@ -284,22 +301,13 @@ run_tests_for_plane(data_t *data)
>   
>   				test_setup(data, pipe);
>   
> -				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
> -					test_cleanup(data);
> -					continue;
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> -					       igt_output_name(data->output)) {
> -					data->color_depth = 8;
> -					data->drm_format = DRM_FORMAT_XRGB8888;
> -
> -					igt_assert(test_plane_colorops(data,
> -								       plane_colorops_tests[i].fb_colors,
> -								       plane_colorops_tests[i].exp_colors,
> -								       plane_colorops_tests[i].colorops));
> -				}
> +				data->color_depth = 8;
> +				data->drm_format = DRM_FORMAT_XRGB8888;
>   
> +				test_plane_colorops(data, pipe,

patch needs a rebase.

s/pipe/crtc->pipe

> +						    plane_colorops_tests[i].fb_colors,
> +						    plane_colorops_tests[i].exp_colors,
> +						    plane_colorops_tests[i].colorops);
>   				test_cleanup(data);
>   			}
>   		}
