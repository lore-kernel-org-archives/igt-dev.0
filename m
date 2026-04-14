Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FA8F9D0CA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 13:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952BD10E605;
	Tue, 14 Apr 2026 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cjw4hc4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD2B10E605
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776174105; x=1807710105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l/311BzUJ9jpzvH6XkCGVo7t0mSTSwFf1Hhh+OjS9uE=;
 b=Cjw4hc4GCQuQLeP5v75yXsPUOiPg2OhZvzJvscZtEwsnBe7sd48jQ+FM
 2QznWDDM44z7BnXp+gfAw1+Pp3xxvK12mPLsUNl9HEgoFknnSEAHQfTeB
 P04Pi44dzJS6yUnXiS4SqUAJAiJHx47Ec1nPqrtCoFy2Qcak8ZpptzUY8
 6s9eu9IIXk4rQYZGHsNAi1W5Ti6Pft7JHMeZCnuy6PxtIuhH5XneHagYB
 wFWfoTCCxBH6Dyzw+1aCsHUdtvMS0h0QWGYHpMpz1V9YfFUhZ31hLUkwC
 x1m0E+BY8HqHseeZYt5F/1zDd3MJVZjgGdMkzXSPqL8Roex1H5I7yJ3AY A==;
X-CSE-ConnectionGUID: HriNwGyiTL2PZXHBJKSEbA==
X-CSE-MsgGUID: Uj9f5pytQdimS0HxBOiyvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77012058"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77012058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:41:44 -0700
X-CSE-ConnectionGUID: D9hPUCcnSDmJum0IL5/j6A==
X-CSE-MsgGUID: kCka+bEVTzKOFTqRgi4GTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229071846"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:41:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:41:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 06:41:43 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 06:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TytjDw/EjXb0Z3Zjd+bu/ZDbLPadhdnZVlD+k111p5pk/IpBb3tewF9/o6Z5f88G1RwRfwUu+JEnWMqbOeHOSidi0ZwpnJZ/KvZnum7q9A3i/p5RX02FV1Pdkip1Bfuln5iiibq6M1dMC/e9lS7S46ael2ZV7VLBDTp2PwRwV2apU9lYGZU0D+/QUsg7xK71JI1los8aKAGMo7hDR8afbeyu7PVktvVViyiT1E2Ymw1DATgH8j9i5ZOMtuwZHB2/k6YD0KycLsm7luhtj6soKeXXBDGG5uBF5+ZLqvfZ4lwtvOY3a4EccwhfgJjzM7L1qun2LgFPOesJDez89JU3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdATOFCzLwZMg4asLDuhzAJPojwC+zPhlTnoVY9pTTA=;
 b=as6miMzTc2gQgjODWT5UnqZ3bN37vk7UlV6cVjtBHenJHTxRD27KSaPpQlxAvS+cWdqeMtzkh5Gp8/ITTX3KGmSOmJnnQDU3e0kbfIBuvKScYxddgyBWoePogHP3k7F3xasd1kjZ3gGwbg5wQwyI/DjrOjWmPhyQKqCrpJA2dHVcFbyXjO+zD3+smEr02LaC+rw1xMmd6nJ5ins4eCrdnb1EDAF7TjMMTD77DT7KBfW34coGfLKYdr8krSR1fawa04nm/QaXV9yvUf9TlL3DjHCZ9aTmKYPhy9LZNXayni+FcpbJhEG8l2tSuorep8RA5NkwjYTu8ervQasdrgDRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 13:41:41 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 13:41:41 +0000
Message-ID: <e42a2961-53e0-473c-8fde-a663de6615e5@intel.com>
Date: Tue, 14 Apr 2026 19:11:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Drop cmrr subtest for redesign
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <ankit.k.nautiyal@intel.com>, Kamil Konieczny <kamil.konieczny@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
 <0db970cc-f4b6-4999-9571-b835ddff5bf2@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <0db970cc-f4b6-4999-9571-b835ddff5bf2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c1efc6-c2a3-4c55-9ea0-08de9a2b8f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 8Py8lFouzJOABtJwRKd1W4F6CHlIqAgw06pukplTp4jpy1mRW8ej6omtpQEO5Gzdqi4rt0PGX/VgdDjohGI7qn+tGa7R2yKz08ggM5XbcjV5ur0rPsABWq583ZMX2zeMPa9YyQUWYzZb9G4fTUKHTtISzreTjLTjQ4HKqJKRmsyO+JdHwo5ASEmZ0jBOnpsHtLl8QGti8sWYRIgBWhC7fKtLpXxS9aDzJNz/rB8v9aNCmhCk0/Mw90nZq0d4Qkx1jyTett0Ly4g71zyUpO2oIOfcNcbcT4E2AlaoVdf45UTWF0VR6ieaTfYEhC87TZaswWULBI2ILUPVGjuL5c0Ae7CLNuNm2U9hMbpBTZuSFSOdGcUNko+upNptcMfnue1ma4VjUm/UW6L246acZ+Rw3x/ueli7MVWd4NT7hkemx2ITaGM3nlIkrIJJ2e/vEvXSNyL/Jj+kjhAzYhawwhpJl/OtK+9UR+EeOtvxX3zKHFdJRXDD7zN2VfI2IM2dkIKSCm5c9xsVHzEJZoeYeSgsKgScKd95tTZ5O20A3/1WNj0kg4v3781TFgDrGzfWXxZodIFPpOmYxd/mkNKo9dPSsYEyCyO5PgJqyheTFZl0hIaEjIaAW8UljTZTu6bp9nXGedAireV0hbDiG3OgNKmS8KtjISxi1dQWJMxnsVUfTkvu2O8NSAmoEjo3+2rC6gW8gTieNMeKhRS8E3wVEh7SOnWsmpDkJj7fwNbYlUYzOmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNrd3ZlTm5aWHVBcDArbVdSUlB2SzltNnZuUFlvcDlqOGNIc2ZwKzJVMCtl?=
 =?utf-8?B?NTJKL0ZjajNiM0hmdFJpa3FIOFdMKzF1TU96OTVDdXpCM1RHbmxVTlcwTzBN?=
 =?utf-8?B?Z1lCYWl5QkxTdWg2dkZiZHZGNFFhb0EraVlMc2VJQ1RtNjlBek9CWGIrSVJQ?=
 =?utf-8?B?S0xYU1pGN2JwdE5nOHZTWFhrK0RuNGdmUnJhWHo0WjI5cjYzOC9lUDVVVEdF?=
 =?utf-8?B?WFE2TU40eHNWVC9LQXhNdTlBLytUekpxZkpPSDJLRFdxM0dueE9ERmNSNnJj?=
 =?utf-8?B?NUtUcnNGOHk4M3FWVlhJaVBPMzFoOEJiOEtubmxlMUxCc05ab1orbG1jL0E5?=
 =?utf-8?B?ZWlLTlBCelhkckNVT2UwNGdKbVB2TjN2ejVIVSsvSWJKSlJQTmJncWpUUTY4?=
 =?utf-8?B?emVpQTM2ZjVOK01oK1U2THA2eFVZbXVJbG1CSlFvZ29CQlZEb29SaG5kUDFR?=
 =?utf-8?B?WGYyVWQzb1M5YjR5VnArSFhtREkwdDA0WjNyczc3MmdzUjNNQXFBdjR3QXJu?=
 =?utf-8?B?c3k3V2I0RmRoaUxVZFVhRm1JV2ZHSmptdEw0VUZSNlhUVUY2L1R1b3JVMkRw?=
 =?utf-8?B?TnA0TEt4U1BLbjNaMlkwZFVNTWF2UStJdlFhclBORDE4SUZ3aytiRGtmelBI?=
 =?utf-8?B?NW1ES2dXWmNMNGNSYmVPdmwrMGVvNUJQbUNJaEMvaVNQQmFhckxmd1RYTEI1?=
 =?utf-8?B?KzBmUGxscEljVHpaSkM0amNRa24xNitBM3NIenJkUGVNVlNtdW1vMFZ4MTFV?=
 =?utf-8?B?a1RLek9rMUc2YnB5UFZ5RUg4QXpwd1ZaQTdLNnhxN2NsRXU2TTdub29oMFRD?=
 =?utf-8?B?YkVNMnNLWEZvMnpIYlVsU2htdkJJL1RJanE1S3grZDJacURiSkVPT2Z3UmpX?=
 =?utf-8?B?N2VEQ1Z6WXhyQTZtTGlSTlFtZ2tqSjZjR0QvcFFrTi9HNU05RlJZcllXaHhr?=
 =?utf-8?B?U1VyOEVNNDBqNStMbHU3dEpESVRNbkN5YU5OOTdpV2oxQzJhUW9lVHEvazVh?=
 =?utf-8?B?MFJOR1JnUEt5MXpOdEFMc3VtQkFnUkdtRk5UMWhVOVZOdkJBNVYyQXhURHJM?=
 =?utf-8?B?TDRXYmF4bGlzNzEvK2d1aDNGaTJQL1JTUU9WcEw4Y2k4WFVqcmpiWUEvSlpO?=
 =?utf-8?B?M29Cc25qUjgwN3kvaVhsRVM1aldrMW1SY1VnV0Vtc01zblFNYnVjZHJvRnU3?=
 =?utf-8?B?VnZORjEydGVMUFgrdUlkR2svTmhPNU4rSTNwY0VvWDRqUTJVaW5MRG9haTdM?=
 =?utf-8?B?eGtyN0gxUWZkekIvamNSSldXT1ArVnVTSkErT1UyV0lzOHRaaUxYK1lSK0NZ?=
 =?utf-8?B?K2I3NHg0ZDBlT1IrMG4wQUd4K1o0YmlwRXRGSktuVUptY1FZbHRzU2pzTXVa?=
 =?utf-8?B?aHNGRXlQY051djJ1RmRlWXVUTUVUVHFJamFzZVRscDFhaG9XbFpYYXRFQUZ3?=
 =?utf-8?B?Q2F4SXZnZmNqUW5xcXdxSi9HNGdSeU9aZTc3ckRjMGYwVGJpZkxVemFTcktG?=
 =?utf-8?B?ZVAxZTFRYlk1aS9naVgzYXUzdE1nQ0VoZlZpaStxUFNFdTJRSXNjemZobFJo?=
 =?utf-8?B?S1pxWFl4Wkk3S2h2MlJtWitnSnJJKzd0WUNtVHc0ZnUwbGVyc2MrYkU3eEJG?=
 =?utf-8?B?amMyMWVGVzdtTk1HelFkVXkyL2tOWEp4N1pVNTVqYVp5eVFHNDVlTE0zSlBR?=
 =?utf-8?B?VDJHMnZocUJ3ZDlVTDVHMHBTTHNDeUpMTytVYUEyV3E1YWlQOFlyNmZJNEdj?=
 =?utf-8?B?RWhHak1ibzh2ODRuVnhndTRmRyt0Vm05UGtVenZSYm0yQ3k2WXY3K3VQSC9R?=
 =?utf-8?B?aHVaOE1UMW5tcXVqMDlzOUt0eW52allvUGQ0c2lZUklhcUFWL3VqOWdTS3Va?=
 =?utf-8?B?cStBYU9RSXRCK2hUQkhUSEFUMFJjcGNTWkdWSzlpZm5qNWw0STJuNE9OOFBs?=
 =?utf-8?B?K1krVkRiZEhGVUkzM21UUHJTUC96QXN2REE4U2phSCtEaTVOdGdBOXd4bEpF?=
 =?utf-8?B?bnNPY1lWdGR1TkpZNzN3cHIzS0twR2U5VXRlZEZRNkRibFRDNmtzZXB0TVRC?=
 =?utf-8?B?QmhlTlE4RUUrMEV2U1I5OHdiZzFEbnVEd1BaenFMN3dTRXFpZ0hyNStRNExv?=
 =?utf-8?B?TSt5NEJmM1pvZk9qRDg5RHBManA0TXRBOXNzeURyNTEwUlVSZHFoR3kvYmto?=
 =?utf-8?B?QnRUYm8wNUxzMlpFZXRaQ0JjK3VTS2xVa2FyY0RmRGZkNlU2ekZSSEdBNTM1?=
 =?utf-8?B?RUovNnN4OTd4NFE3eHJPR2NUYWlBeHBicENLcWkwcmdSb0RLd1NLYURML1gr?=
 =?utf-8?B?bVhSU0lBSkpWU2JWbENhYVdYYXdSdGFXcnp6T082RDk1QXFLTURHU1M4aWxk?=
 =?utf-8?Q?2lYP936cze0ajxrY=3D?=
X-Exchange-RoutingPolicyChecked: ddrtNhF7RxjC7R3akw8n5hDS0tDAcNmxZn4rRW7tfaaail91DswsJpJtmZy8fZuIR8gkbFyq1fWtnVIAjdwWeuLlzIl6YbuEjjV1xvyO77ak9bHhHXkAWxKjrVOavpIlePzRGjzV4ZbLvBwJy32B3j4/X1N9Dvx5yxffTRN9YDYJgKegpgUuKKg/wA8y+P+mj+fe5Dt+GdRQXrDPPiEDynOu8HjUC7Tj+GQj7hav8/12ZbhQpv0Bhs+2LsXuJ417uw3vZxa5aEdkPmRvH43mQNVF3WCOoLgCC6NwhlW2SbQBJ/SD3YcTzy6BK0ZWRy1ypii6UERZG0LDddsm1ixqNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c1efc6-c2a3-4c55-9ea0-08de9a2b8f2c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:41:41.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfEqs9eBpHCSRmSUQHHKVQXzp+Njgza3WdzK0v2iH1dwA33D5LibJP/pc/pF3h0DOcnrUJ6wAiBcHXthKIPh2vaqKDdCTNax/m/eERdidoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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

Hi Swati,

On 4/13/2026 8:51 PM, Sharma, Swati2 wrote:
> Hi Ramanaidu,
>
> Shouldn't we revert 7f0a262891b7888a09e4a1838eb688ad9c676324 ?
Recent patches caused the revert to fail, so a new patch has been 
submitted.
>
> commit 7f0a262891b7888a09e4a1838eb688ad9c676324
> Author: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Date:   Tue Jun 18 13:12:25 2024 +0530
>
>     tests/kms_vrr: New subtest for CMRR
>
> ++Kamil
>
> On 11-04-2026 11:29 pm, Naladala Ramanaidu wrote:
>> Remove the CMRR subtest due to a change in test approach requiring
>> a complete rewrite. The subtest will be reintroduced in a future
>> patch with a revised test methodology.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 132 +-----------------------------------------------
>>   1 file changed, 1 insertion(+), 131 deletions(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>> index ec0692b2f..01f078d2c 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -36,10 +36,6 @@
>>   #include <signal.h>
>>     /**
>> - * SUBTEST: cmrr
>> - * Description: Test to validate the content rate to exactly match 
>> with the
>> - *         requested rate without any frame drops.
>> - *
>>    * SUBTEST: flip-basic
>>    * Description: Tests that VRR is enabled and that the difference 
>> between flip
>>    *              timestamps converges to the requested rate
>> @@ -90,9 +86,6 @@
>>    */
>>   #define TEST_DURATION_NS (5000000000ull)
>>   -#define CMRR_PRECISION_TOLERANCE    10
>> -#define VREFRESH_MODIFIER    0.1
>> -
>>   enum {
>>       TEST_BASIC = 1 << 0,
>>       TEST_DPMS = 1 << 1,
>> @@ -103,7 +96,6 @@ enum {
>>       TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>>       TEST_FASTSET = 1 << 7,
>>       TEST_MAXMIN = 1 << 8,
>> -    TEST_CMRR = 1 << 9,
>>       TEST_LINK_OFF = 1 << 10,
>>       TEST_NEGATIVE = 1 << 11,
>>       TEST_FORCE_RR = 1 << 12,
>> @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo *mode, 
>> float virtual_refresh_rate)
>>       mode->vrefresh = virtual_refresh_rate;
>>   }
>>   -static bool
>> -is_cmrr_mode(drmModeModeInfoPtr mode)
>> -{
>> -    int calculated_refresh, actual_refresh, pixel_clock_per_line;
>> -
>> -    actual_refresh = mode->vrefresh * 100;
>> -    pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
>> -    calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
>> -
>> -    if ((actual_refresh - calculated_refresh) < 
>> CMRR_PRECISION_TOLERANCE)
>> -        return false;
>> -
>> -    return true;
>> -}
>> -
>>   /* Read min and max vrr range from the connector debugfs. */
>>   static range_t
>>   get_vrr_range(data_t *data, igt_output_t *output)
>> @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t 
>> *output,
>>       return 0;
>>   }
>>   -static uint32_t
>> -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
>> -              uint64_t duration_ns)
>> -{
>> -    uint64_t start_ns, last_event_ns, event_ns;
>> -    uint32_t total_flip = 0, total_pass = 0;
>> -    bool front = false;
>> -    drmModeModeInfoPtr mode = igt_output_get_mode(output);
>> -    uint64_t req_rate_ns = 
>> igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
>> -    uint64_t exp_rate_ns = 
>> igt_kms_frame_time_from_vrefresh(mode->vrefresh);
>> -    uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 
>> scan line. */
>> -
>> -    igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
>> -         "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
>> -         req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
>> -         (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
>> -         (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
>> -         (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
>> -
>> -    do_flip(data, &data->fb[0]);
>> -    start_ns = last_event_ns = get_kernel_event_ns(data, 
>> DRM_EVENT_FLIP_COMPLETE);
>> -    do {
>> -        int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
>> -
>> -        front = !front;
>> -        do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>> -
>> -        event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>> -        igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
>> -              event_ns - last_event_ns, (float)NSECS_PER_SEC / 
>> (event_ns - last_event_ns));
>> -
>> -        diff_ns -= event_ns - last_event_ns;
>> -        if (llabs(diff_ns) <= threshold_ns)
>> -            total_pass += 1;
>> -
>> -        last_event_ns = event_ns;
>> -        total_flip += 1;
>> -
>> -        diff_ns = event_ns - start_ns;
>> -        wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * 
>> req_rate_ns;
>> -        wait_ns -= diff_ns;
>> -        target_ns = event_ns + wait_ns;
>> -        while (get_time_ns() < target_ns - 10);
>> -    } while (event_ns - start_ns <= duration_ns);
>> -
>> -    igt_info("Completed %u flips, %u vblanks were in threshold for 
>> (%.2f Hz) %"PRIu64"ns.\n",
>> -         total_flip, total_pass, (mode->vrefresh + 
>> VREFRESH_MODIFIER), req_rate_ns);
>> -
>> -    return total_flip ? ((total_pass * 100) / total_flip) : 0;
>> -}
>> -
>>   /* Basic VRR flip functionality test - enable, measure, disable, 
>> measure */
>>   static void
>>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc, 
>> igt_output_t *output,
>>       igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>>   }
>>   -static void
>> -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> -      uint32_t flags)
>> -{
>> -    uint32_t result;
>> -    int i;
>> -    bool found = false;
>> -    drmModeConnectorPtr connector = output->config.connector;
>> -    drmModeModeInfo mode = *igt_output_get_mode(output);
>> -
>> -    igt_info("CMRR test execution on %s, PIPE_%s with VRR range: 
>> (%u-%u) Hz\n",
>> -         output->name, igt_crtc_name(crtc), data->range.min,
>> -         data->range.max);
>> -
>> -    for (i = 0; i < connector->count_modes; i++) {
>> -        if (is_cmrr_mode(&connector->modes[i])) {
>> -            mode = connector->modes[i];
>> -
>> -            found = true;
>> -            break;
>> -        }
>> -    }
>> -
>> -    igt_info("Selected mode: ");
>> -    kmstest_dump_mode(&mode);
>> -
>> -    if (!found) {
>> -        igt_info("No CMRR mode found on %s, try to tweak the 
>> clock.\n", output->name);
>> -
>> -        mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + 
>> VREFRESH_MODIFIER)) / 1000;
>> -
>> -        igt_info("Tweaked mode: ");
>> -        kmstest_dump_mode(&mode);
>> -    }
>> -
>> -    igt_output_override_mode(output, &mode);
>> -
>> -    if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>> -        prepare_test(data, output,
>> -                 crtc);
>> -        result = flip_and_measure_cmrr(data, output, 
>> TEST_DURATION_NS * 2);
>> -        igt_assert_f(result > 75,
>> -                 "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on 
>> threshold not reached, result was %u%%\n",
>> -                 mode.vrefresh, 
>> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
>> -                 result);
>> -    }
>> -}
>> -
>>   static void test_cleanup(data_t *data, igt_crtc_t *crtc, 
>> igt_output_t *output)
>>   {
>>       igt_crtc_set_prop_value(crtc,
>> @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data, 
>> igt_crtc_t *crtc, igt_output_t *output)
>>   static bool output_constraint(data_t *data, igt_output_t *output, 
>> uint32_t flags)
>>   {
>>   -    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | 
>> TEST_CMRR)) &&
>> +    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>>           output->config.connector->connector_type != 
>> DRM_MODE_CONNECTOR_eDP) {
>>           igt_info("%s: Connected panel is not eDP.\n", 
>> igt_output_name(output));
>>           return false;
>> @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts, help_str, 
>> opt_handler, &data)
>>           igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>>               run_vrr_test(&data, test_seamless_virtual_rr_basic, 
>> TEST_SEAMLESS_VIRTUAL_RR);
>>   -        igt_describe("Test to validate the content rate exactly 
>> matches with the "
>> -                 "requested rate without any frame drops.");
>> -        igt_subtest_with_dynamic("cmrr") {
>> - igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 
>> 20);
>> -
>> -            run_vrr_test(&data, test_cmrr, TEST_CMRR);
>> -        }
>> -
>>           igt_describe("Test to validate the link-off between active 
>> frames in "
>>                    "non-PSR operation.");
>>           igt_subtest_with_dynamic("lobf") {
