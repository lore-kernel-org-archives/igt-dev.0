Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C131CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 19:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CDA10F206;
	Thu,  7 May 2026 19:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BP5+VAFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543B910F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778182907; x=1809718907;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d0Wr0gGLbcrMfRPAkXCBXE/8jGyPVIxVUsLYHEZZnTw=;
 b=BP5+VAFxmcrfnBNVS9IGvaE5zTFcU2tJrhh/8vLdpO4Xa0FUSsegsSZQ
 daxmqHJibaiq/y4oVDo5mKL16JR+vOTOi7cvFYFCt6WRzMgFdnBxQCWvs
 ooLFPZ4n8em3zIqWrhce7bEX6i+qyEXOLhKT6o/cPgn8GCGBQm1ynU9Km
 8Qp+mdlrSzMposd1kXdalo8oYkE8qlaDQteumK8HEqo5lboVGssEGkSKz
 39TFP9FNtwNmqv26ERtI5l9qy2SqEDHdkMIskbIDYY79VrGJ13cBsRnEC
 yV9w20zfSuFJtBrlSbKIbSumapdBgaas1UOOQvjC28EM0ta6kIllEhdnQ w==;
X-CSE-ConnectionGUID: 6A9zRUQ2QdSpqNz71jR+jw==
X-CSE-MsgGUID: U2PZIJE3R/ud/5VGG+aG/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78996562"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="78996562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:41:47 -0700
X-CSE-ConnectionGUID: JRDYcrDXTZS3WMvC2kF9Mw==
X-CSE-MsgGUID: bSmLSWCZRkKs9UZVXtWi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="260265553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 12:41:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:41:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 12:41:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 12:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7sPTU1vThWkhXKG0HVs9RXwI8lLGeQJvxFKCt39x5+e2dN615x+Iy/GC3EDEQfkCWyyyygZj6MxHlEXLuYNliS/h1GGkJi42T+lYX3GMuDnogM/z09r5dxNRgMLl7lVEdDLEe1mCdres0DHw0ptDCzvOgtYZLrm0X2pNBvYaGrGQyKyi4odNIfFvJVR1vZIOdVbLUK+b34Lbz7hyGMO2bdb4OqC4KKZ3JKesgotusLAfkdqCrIK+cJw+x/EQfQ3bkPLFMwKwIFjbLlShiYFVSkpHj1I78Er1Ni4YaiMEyzNstnNMryqGKeeJJFnLdX/A+RHVs6QJQk0XVz/d/UKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nQ9vCzB8D1q2Hor6K0QMLvytFCtsTrpJWj1vzb0Jto=;
 b=PL3/75LHx72YOc59/6A8H+zoY4oB9IxJyN1B5ECfqGTtxSbprMULXOzXjUQQn+TOc51vYHtmcaL4ZXLbzTXOs+XmrXSiccItkHcrjZMaMcMfxOUtTVlUuFCEixAvKAKDuYJhxZbYDy+YbuxUNrNMoUvyze+M+d3wRnaJvH0kKAUBGnJltgyZ/AT7cmRbcnn1kGD0GN3kswiYLKCZI/kbKzUh6JLIl1UvgX+HDORiuHD781FBsaRzkP1/uPaRlp7i4298Qh3QjBTtblIGxjNaLsGj2JXcUC7/+w8cZeLB7VCvcEBVQm/Afjq6M3JzVRPrvrHReFalhESRaxJCdTUD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 19:41:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 19:41:42 +0000
Date: Thu, 7 May 2026 12:41:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Message-ID: <afzq8QUcfKLm7jiT@soc-5CG1426VCC.clients.intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
 <81b70498fab2a302ad8c131ef9d589dd7e39c230.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81b70498fab2a302ad8c131ef9d589dd7e39c230.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7caf0257-70c8-4565-8826-08deac70aa47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vKZY+UKtolIx2BsjN6z6PgXNtj00LrfBvPdvgufXU6/qpDUSb95dZGGcGrWmA7P0tituvT2WNLxlANmwt+I3Kel7i17ZQzSrfe5lRUWQw7Y0Z50J5PUrLnSFfmGq4EYYlvwkmgvNOR6q/eGTXONDzWSHgYKS/L29pzsRWXFOQeyRSS9tM6KbaXslAkMgRnspymLPJbIi4LHKQcQENhDLqLfA4zX/Q5CFOPbIHdzwbdB1+1D3brEwOvUVWhfMaxbC4FrPqzQkN6UqICGtg40oDfVjl6xdAQA/+MEITPZLy1T5Y+8NRn/+I1I8QdYBp9yzMONGKmPQ/Uc6A/UlGfvsFJnc2r2sXi9BQjYPSOOiwrKLP0zffCvsHfzX+t6pt5R+mVs6JpVvbASY4WYHyiorlzCEjF4qDVPQK7+Szv92xUfpmqzi3gaRqurIcr1tav/W+z1XWTDk9nuiyM2jCvVYXchsgdehyov8fXrhrz7gPyoQ6HQD1iLXqtJo+d1xrnJDDYmIkIkYx6vj79E7klZFJrYU5LdfsSmscrMsWLuvze8EMr5+65aYp+xDdAXdfU1D4Yd2z24SWssa3w7+yK8FazNhC5bNpCzXoRJh3SQqEEGWzGzPUqCz9gvGWNXHr5hoEfSsY33GqnBdu11/gATRHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklZb1BmNUNtOVc5WDBra2NWOUlBaWxydXNoUVUyQ0cwVDQrbmNFc2hQenNE?=
 =?utf-8?B?SWcrdHB1K0oxbFlmQXR3TmVsc1BONUZyQlpwSFRjdnZLUWovVTF1TDRqL054?=
 =?utf-8?B?a3NMK290cW9HSVBMMmVzQjdQZ1VQTkZUdHBGOUtCOGg1TkRUT1duTVBWVHVx?=
 =?utf-8?B?dGJpNWpSWWdSdFNyYTZ5VkJtMnJ5dVpDQTNSc25tN2lRV1RsTmNSMnBZeVlq?=
 =?utf-8?B?TGpwZXJvaTMyTUdxYkphTkVSQTRWeGNHS1llVHhaRlVuZDgxb01DOGJwQ2Vp?=
 =?utf-8?B?YnVITE1YU1hPWmNIeE05ZmRIaEJ4SXFvYVdFcmRoTk1jbmVCNWdybk5KcDY1?=
 =?utf-8?B?ZGtCR2hZdlBDUTVIVEJaVGRFY3FMbUtPZHpEeUR2QVJ3S2ZKb0tHMEw5eW1i?=
 =?utf-8?B?eiswSTNrc1RTeXdpL0ZxOXJoc1FDczZVbExtR1RJT25FQXdFUkdUZ0dET1hI?=
 =?utf-8?B?MTNqS200NFQ3S3ByRkY5MWlubDF2NUtmSXB5MGduQmFQVE1YZnYzV1dwUTlS?=
 =?utf-8?B?QXJXaUhtK2lVVXVRL056RS9PQnlVY1FLZGVYWEIzZmlXWGVtbnBYR2t6OWpJ?=
 =?utf-8?B?cFdodE1QR3hqRFpPN1ZwWVIzeXJkZk96YVlScElFNW91WFpUa2wxZXNqUWxy?=
 =?utf-8?B?RVIxVWdnZ3ZoTUE2Y3hmc05wMnRGT21INVRzSnlkOVdzVUw2N0hsRnhsZzhH?=
 =?utf-8?B?aXIrTVhReFFPZUk2Y25VYUxrclJHVG0yRFpjUkFsbWlXdnBzUmdpZFUwbTUz?=
 =?utf-8?B?citEMXNsVkFqTUp5OGF2N0VmQmxicUFQcjRDU0M4MzBGVFR4Yk5tYzhoTDhZ?=
 =?utf-8?B?YkJwZkpOY3BsMWF4ZGY1cERxQjA0dVJuaUVoelhsOVcwb0p0US93bmpXazRo?=
 =?utf-8?B?RVhRTjFZRkNyQVc3NDVacDBDNjk5NTFWTzJXK0hJSVVFcmlhOXZjTU9pM2Z0?=
 =?utf-8?B?ZUpQOXBocS9TQW50QldZemF2OFpoWTRPT25mM21lVmM2b0swSzRkQ1hKSE9K?=
 =?utf-8?B?OWtRNGtySGw2VkNQSTcwdEVhdGplck5pOXQxKzlQRjJNaVdtUmw0UnZQL2lk?=
 =?utf-8?B?WCs1clozNktJb3M5WVB1MG5SOEg5Z2VMb3ZxejAwQkNrTEs5bFVlUXNMZDBX?=
 =?utf-8?B?Ym0vM3RLZ1FEYUVKMHpsNTc0UHYxc3F6S3hyODRTbTR5STMwR1Vvd3JuZWw0?=
 =?utf-8?B?N3J1MGpwazRBK3lEWVZGWmZJY1lGZ055OHQzYUQxNmpLa1E3Tjg5NWJnM1Ni?=
 =?utf-8?B?UlVYL04vSTZsVmg2SFdYZXU5ZExKbXdZM3owWVFEU25Xd0ZDRlZWN0ptdVkw?=
 =?utf-8?B?czRYWDFKL2N1dUN0VmdsM0Z4NE9pdm1nbFVFdjRXZGdIQ2ZOU0Jxa3NkN3Yz?=
 =?utf-8?B?WG8vYWFKekFKWmRFSW1EMXZiQ09La1lVZmg5eTlHcGo2dW5yRzlNNVJCNHh0?=
 =?utf-8?B?Vnk4MmxvNkF1S1NpakJGRUJ0N29VK3VZYmtscU9NaGtCakN4SXZ5Q2dSZjlC?=
 =?utf-8?B?UThUVHI3QTdDQVl1ZFF2ZjdZd3NmMEcvSUhFRU1PT01VRXhRUXY5YzAzZ3VN?=
 =?utf-8?B?ZktLY1ZObUFNWFVRS1dFc2c3MTNPYThNOEs0SWE2MlJxaGtTZVpoRkNYQ2N2?=
 =?utf-8?B?Wnh4VW9iY3ZBWGYyYVhkcDZvWFZhakgwZ0FXR3Rhd3JvZ3F5YjRWUzhWZWtv?=
 =?utf-8?B?emNiYi85QXVMeUwweW9LMlhENmJNeVFOdzk0ekFKKytlWGhhT2ZacVlrZ2VC?=
 =?utf-8?B?blQzd2I1Tk11MlNUcE83M2NyaUxRd21wTE5uUHhpQmdhVEw2ZytNQ0xBYkl6?=
 =?utf-8?B?QzY1NmFQTjYwNmxHWnJwWXFNTHlJaGlsVlhhQkF5Ui9EY2JuTHFHOFJyTTNB?=
 =?utf-8?B?REdXMWduZjRpTzdIL2RHbUdjN2lNWWRncWN2ektmaEE0NUZpK3hlR0RyYm90?=
 =?utf-8?B?SjdSRE9ranVWTE5lYW0yNE54SUJCb2FPU0E4NGgvZndKVG45ZEZiMlVjT0Y4?=
 =?utf-8?B?QkI4TnhTUGRmUXB5QTZkRUZLNjdoK3JBbGdUZ0xLUmdaZVg0NVVSQmkxV3Fo?=
 =?utf-8?B?UStIUTRJcGI0clVzT3BObVV6bUpqd1pnT3ZINzRzUU5mdy9qRXo2YkhqUHg1?=
 =?utf-8?B?d0h2Q1hMOHpVV2grMlFROTRVQ0RkWTNJZkxOUlAxdVgvRlFYUXk1QktLbU5U?=
 =?utf-8?B?MkhLQjFqSk8wUHJIRUt0UzRjalFSMWp3NUt2LzRKNG1hZzl5V2lnYnhaVGtm?=
 =?utf-8?B?ZnZ0RTJBeXY3UEpSSmU5UjBtbEdTaU5NTDhHbjdiTHlNY1FpeHI2WXE4YWpJ?=
 =?utf-8?B?VjBOWVluZk0vbXJOY1BzUVBFYUdySW5IbXZYd0VMUElmMVhPcitxbXRzMndN?=
 =?utf-8?Q?edtqdo3gOtyVy0O3r5Dz9tgxG7dGIPJf8Epb3?=
X-Exchange-RoutingPolicyChecked: TfGEtJ2r4m7Pr3GEhOLK7JYq+APieEu/4D6JT/3J0TZGUvzg8xsBQwsASTHIaU7jcVl03U3eYDshdKqj4uUG+WgXlN+IGl+Cs7stsRgDnODC2Nz90zwBgjJXm/eqS3HYH3yblnOBI/dN34eNeD35MyGB2QnRN5Z2I1pHEi3u0dZLgwG4M4mrj85E3KPfUuUiDz1VoAIGshISibuYK5y9bmTTLKvL5SCJWPLR8gQGXfIHIr9h4ZriwWKSjjJqufJ3mk0I710a4uqwXU+AMU64UGjqMGud8yaOVCuNEt1TGe/I+gopcLS1ym8C3gdmIECbO3H77YIt+U9R73NggGaj7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caf0257-70c8-4565-8826-08deac70aa47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 19:41:42.8617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZM6kcPoYvJq0rPzuoyF4VvHQYM2BxTeurnlpkgCoMDJ7xD5wgjEQpGW4/hHRV2p2dicmXCgtkRRQ1wH3GcA4tKZPrPY/f8SRq846lUH1Di4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
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

On Thu, May 07, 2026 at 07:23:50PM +0000, Summers, Stuart wrote:
>On Wed, 2026-05-06 at 11:31 -0700, Niranjana Vishwanathapura wrote:
>> From: gta <gta@DUT4637NVLP.fm.intel.com>
>>
>> In multi-queue case, CTX_TIMESTAMP register does not
>> provide the running time of individual queues of a group.
>> Provide the option for spinner to read timestamp from the
>> QUEUE_TIMESTAMP registers instead which is useful in the
>> multi-queue scenarios.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  lib/xe/xe_spin.c | 9 +++++----
>>  lib/xe/xe_spin.h | 2 ++
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 14952ca90e..8743107898 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -25,7 +25,8 @@
>>  #define MI_LRI_CS_MMIO                         (1 << 19)
>>  #define MI_LRR_DST_CS_MMIO                     (1 << 19)
>>  #define MI_LRR_SRC_CS_MMIO                     (1 << 18)
>> -#define CTX_TIMESTAMP 0x3a8
>> +#define CTX_TIMESTAMP          0x3a8
>> +#define QUEUE_TIMESTAMP                0x4c0
>>  #define CS_GPR(x) (0x600 + 8 * (x))
>>  
>>  enum { START_TS, NOW_TS };
>> @@ -67,7 +68,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>                 spin->batch[b++] = CS_GPR(START_TS) + 4;
>>                 spin->batch[b++] = 0;
>>                 spin->batch[b++] = MI_LOAD_REGISTER_REG |
>> MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>> -               spin->batch[b++] = CTX_TIMESTAMP;
>> +               spin->batch[b++] = opts->use_queue_timestamp ?
>> QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>
>I see in [1] we are programming this register in the ring also. Will
>this cause issues if we overwrite this here? I see we do the same thing
>for the context timestamp, so probably no issue here. But it would be
>nice to document somehow the expected interaction between the kernel
>ring programming and the user batch programming if any.
>
>[1]:
>https://patchwork.freedesktop.org/patch/723502/?series=164654&rev=5

The MI_LOAD_REGISTER_REG source is TIMESTAMP register and destination is 
the GPR reg, so we should be fine. If we were writing to the TIMESTAMP 
registers, then that's going to mess up counts.

Regards,
Umesh


>
>>                 spin->batch[b++] = CS_GPR(START_TS);
>>         }
>>  
>> @@ -83,7 +84,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>  
>>         if (opts->write_timestamp) {
>>                 spin->batch[b++] = MI_LOAD_REGISTER_REG |
>> MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>> -               spin->batch[b++] = CTX_TIMESTAMP;
>> +               spin->batch[b++] = opts->use_queue_timestamp ?
>> QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>>                 spin->batch[b++] = CS_GPR(NOW_TS);
>>  
>>                 spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 |
>> MI_SRM_CS_MMIO;
>> @@ -97,7 +98,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>                 spin->batch[b++] = CS_GPR(NOW_TS) + 4;
>>                 spin->batch[b++] = 0;
>>                 spin->batch[b++] = MI_LOAD_REGISTER_REG |
>> MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>> -               spin->batch[b++] = CTX_TIMESTAMP;
>> +               spin->batch[b++] = opts->use_queue_timestamp ?
>> QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>>                 spin->batch[b++] = CS_GPR(NOW_TS);
>>  
>>                 /* delta = now - start; inverted to match COND_BBE */
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index db0febd8ab..75a6ada420 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -51,6 +51,7 @@ struct xe_spin_mem_copy {
>>   * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue
>> switch point
>>   * and have the queue switch only happen if waiting on the
>> semaphore.
>>   * @ctx_ticks: number of ticks after which spinner is stopped,
>> applied if > 0
>> + * @use_queue_timestamp: Use QUEUE_TIMESTAMP register instead of
>> CTX_TIMESTAMP
>>   * @mem_copy: container of objects used for memory copy (optional)
>>   *
>>   * Used to initialize struct xe_spin spinner behavior.
>> @@ -62,6 +63,7 @@ struct xe_spin_opts {
>>         bool multi_queue_switch_on_wait;
>>         uint32_t ctx_ticks;
>>         bool write_timestamp;
>> +       bool use_queue_timestamp;
>>         struct xe_spin_mem_copy *mem_copy;
>>  };
>>  
>
