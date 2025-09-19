Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364FECAC5A8
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 18:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7DA10EA67;
	Fri, 19 Sep 2025 18:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xtoZmijQ";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000910EA65
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 18:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl/q91SxEWww58Z0vhXlQPRUT8u4iur/nP6eV1sYkXzHaZbV56Z+zpFqUnRJHKR8hdPCF2rNP6QNFZwATXtgdHJc+OKdL8ZDSjmXU5xQ88b2ArOXZb/e3WR+AhWHz5ameNZngnhZWRotMLr9Lw2gg3TeF33uMnakGKCoDjWUAGIJSZOFS/8zA4rEFT/mmMYnnf7HwM5Lo0ukarvGiLrybABuadf+gHuyQtdQs7V8Q6t0ySUH220fOKibwtgr6CgVHCDti/1IisfLzIKjTrspVZOhz/LDRVkKVTE03tQiNtypDv2XvY0K5yUEKu5g5FcHJDqnv/53njuvgEIR1hWBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSjSwny0QTr2/Vxrkuaq4ApvM43JShbb4zlO0u21gxc=;
 b=mDtDnLjvxEuOn0d7xtVvaiAbuAa7lncydiLBUHHNTXPDCBnFntR2lo8uKeQvCpRuC6agKdVheVV4VKfisdQrlIROPRdjylQk6Dq+i8yq5NQgYa1WIlJGwRCdUkjBYjtRL0fh61UvdrgpVtNZPZ5GKinMRoGQU6y6eFA36lI4heT97Ki2CUsQMIW70E1+USirqZPhfqELlD1aOFB8OUGICB5KMMh/KjjGzrzyiNldUDUvx4ximKA9ae52eWD2FEyFD6kqZ7s5Zl7eAI31D+FC9S79v4E0YNhQzPrYhUUUzXnEAPfSFQUjMPcHHn7bV8g6lL/xbNJqZwEByN9RjSQRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSjSwny0QTr2/Vxrkuaq4ApvM43JShbb4zlO0u21gxc=;
 b=xtoZmijQdD0NUml8Kqr7tpmwW4xqNzYy7EtnHu/JO/63tObKJtZvlQvZFWugcLJu4ErS7+4c08j42e26X0NiktfLmBKyFJ2L6oEsJF1VfYmfR1OA8pNxjFOAE2GbJj4YxRQpgzPW1yTJXjNWN0ka3cKW05rXT4a9sWAczU6j1lo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH2PR12MB4213.namprd12.prod.outlook.com (2603:10b6:610:a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 18:18:36 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 18:18:36 +0000
Message-ID: <264688db-1917-44c8-9373-b8fc200d116a@amd.com>
Date: Fri, 19 Sep 2025 12:18:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <20250827105359.kg2x5jmo2w25iqxa@kamilkon-DESK.igk.intel.com>
 <5b909804-494f-4ffa-909d-25cbd38ea17c@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5b909804-494f-4ffa-909d-25cbd38ea17c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH2PR12MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: 01609f7e-b739-44f3-7403-08ddf7a8f30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm4yekcycy9YdnFteGhUa1V6dUpwY3BzdjlRNEhaWlBxSVJwc1ZKb2lnTzNQ?=
 =?utf-8?B?NXVQOG5iUzd6eVdxWG9oM0p2WGp1ZnhoZS8wL3ZsTE9tTGhuTmJtZ0FnKytC?=
 =?utf-8?B?WXhCVlozOStkdkNWcjU5THdSNWdYalZIcWg3cWwwR1BjSFBPZFU3OThvdDFB?=
 =?utf-8?B?bU4xT1pva3A2K3V1NlZvYzcvUTBBM0x4LzM0dnJ5QVp0VkZIcGJmNUJySDhW?=
 =?utf-8?B?M29IbGxDUVhSMXZSempXRHZ5akpXWFl5WGttY2JXVWVndi80di9JQVhxVWxq?=
 =?utf-8?B?N25TazVxQklyRHQzbzd5SGl5Y3V6d2taRXd3UG0vZHVkZHNTcFA3aEZEdmND?=
 =?utf-8?B?Rk5tTXlRRnVRLy9tMmxvS3BvOWJrekZ2TVNocUQrZHpDRUNVam9TbGhLdTk2?=
 =?utf-8?B?c09OTElCMnE5ZFhWdmlIdHhkL0JXTzd6SXBtYklDWWJqK3J2K1BoRS9kQWUz?=
 =?utf-8?B?SkR4RGFDWXpjb2o0RjlGdjNxc0N3UUlHN2ZMZjNaSmU4TnBoMXBjZDRwY2Z6?=
 =?utf-8?B?RS83NXdHS2VGa0Ixb1RPNjk3cjNNS1k5UkhLQk5OUWZwbDZOeXpPd1NNVEQw?=
 =?utf-8?B?aEVNa000R1ZVOFk1dlQzNmlBU294eHRJZWtLSzdXK2h6dDEvakdyRzJISVlm?=
 =?utf-8?B?U2ZZa2Y4RHZhM2NYN3ZpM3JIa011MWJJWUdIY3d5S1hrb1haNjBQYzJiMDNM?=
 =?utf-8?B?ZDFBMlFJczVVS2VEVkk3TFNRNmhUZzB6UmYreGowOWc5bXQyM3luTlVzMC9j?=
 =?utf-8?B?NDlDYWdQamoxZkF1Y0VoREhSNkZlYTViczgyTGdjdlJEMDg1YURMZlMrSDIx?=
 =?utf-8?B?OVNSS1Z2NEhLbG11MXh0VW92NllHUktyZ3hmSU5oRlRKTEt5RTV5aEE1VE0r?=
 =?utf-8?B?VThzOFhxN3Nmck9sOWJGWkVwNG1sREU3VjZXMUwxcjFFK0UzVVhGVHRmYzVo?=
 =?utf-8?B?RGttRFdDYWxBL0NPMVVDaXBQd0k1SUpMcDdHUUNZaU5YOTFCZTBWaGI1Sk5t?=
 =?utf-8?B?bXBUY0FXODVMNDkxU1pwc3EwSlRUY1VLU2tpSzEzOThRSmZwa3B5VzBLdnVm?=
 =?utf-8?B?SExVZFVlNEVneEZBM1hZTDVZV1IrVENiajMzRU9BVW54b3Bxa3BSY0MvWmN2?=
 =?utf-8?B?S1l4bEl1elRua2puWkVBditlSnhpQ3FaWkNaTkE2ZFFsa2lCRFAwNjE5WnBh?=
 =?utf-8?B?bW5zWmRFZlRNZytlVVFkNnpXRHpyWHlENFN3bnZaVEV2YThOdjc2Z0dWMjRh?=
 =?utf-8?B?NHE0UEJKanVuejRzZGdHMFZtSTV3QStRYnhNdVZCa2RnZ3BSWjJQS0dKUXlL?=
 =?utf-8?B?b2VRckYySm9EQjNtcENEbE45S3pMbjdWZ0Z5QWJsZkt4cWg5WWJqdmZtdHRN?=
 =?utf-8?B?Sms0aUJVL2ZTYWg4OVIvMGZQbkhBaEl3a3NvMFBlNXlLb05IdHZERWxEdDNO?=
 =?utf-8?B?K0NTL0ZQcXM5SnZLTk8wdnRTa2kyS21Pb0hSZmhMVEYwM1Z4bmJpNUwwUXM1?=
 =?utf-8?B?dStUY1hHVkVJUXJjblBkd3lMcGswZEN4UCtTK05OdUtUTi9HdVJzaGVLb2Vt?=
 =?utf-8?B?YnNuNXlLeG0xdXJnVEhGQWNGcXRiSFhVZ2M4QVNxZWpCODFhTnJhRElEbHVD?=
 =?utf-8?B?QWI0R1FYVkpqWk1pWGNycUttRUJPT3pUUGw1OVB4WldOVDM1S1hERjZieVRN?=
 =?utf-8?B?eHJ5amNHZVY2UDh2M2k5ZHQ3Q2Rpa0tsUks2T0dTZC9Kak82Q0MrQWNxWFN0?=
 =?utf-8?B?T3YyckphNWt5c2EweUJicG54NlVHUGJ5cnBPbjhidlQ5bTc1NWcrdFpqSlM2?=
 =?utf-8?B?QitQQktxQjYvb2tDRDN5bWhpdnBPQTVmNWtPcXpsSG1tRlZIZGdxQkg4ald5?=
 =?utf-8?B?S1FRZ3JwSExnSFBvY2dBZjA1dVdJZHRMZ0dseUlQVW92ckxZNEd1bjVCekY3?=
 =?utf-8?Q?Q8FEHe2K5MM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTB3NjFOWG1uVHVsaHVvekdFWVpsTnpIWHBwUUdxK3U5Z1dhZnVQeGd0TUlr?=
 =?utf-8?B?Z1VFYnhFRFhzdjQ3R05MYTVSWHZHUUVUcVZQYjFOa0lJazdHbXFMUVIwYUU0?=
 =?utf-8?B?VGZ5V1dTV0NWbjFKR2JPN1NjVVZWMnlMODU5RUo5cm92blcvd1FpaDJDRUZG?=
 =?utf-8?B?TzcvVFlUSHhvNUhoT3VGdG8wOXZXVE1FQVNvVHY2c04wL1pZMnoxRmNidjJY?=
 =?utf-8?B?d2Znd3JkY1JRYjBObm9EUjhQUnNDYSt0MXE0UTlDZ2dORlI3TDBoUXlDaXAy?=
 =?utf-8?B?YmxTeDBQSHBvMkZHbFZPOENvMFBDSHJaT0RSV0ZYYUtKRCtRSngvOElwR2w2?=
 =?utf-8?B?NG1RR1ZPUmJUVEZvRklnYk1ObVBncFdjZDlaZXp0WGJJcWtYb3d2MGxGV1J5?=
 =?utf-8?B?UHJXYXZ2RlpUbHlkeW1XUWc3VzV1clZRNVFkNUJHY004U2JibkhNTWVWUnBm?=
 =?utf-8?B?UkVvQlBZR0YvaWhXdnFTeDV1R0lKTXF6TWFjVG5tdlUyWk5VcnRwUFRkb1Y2?=
 =?utf-8?B?TkpZN2RxbTRGN0d0WVJNbGNsNUNrSENHWkdyOExMZDF4d1Z1bUFBZ3NuamxW?=
 =?utf-8?B?LzJSNS9NN2JRTC9zTmYwd3BqZmNTR29RK0IxeUdWbzJWVnpGbUY5YTh5aDE5?=
 =?utf-8?B?WXI4SDBHU1FzQzBVRE5hbTRKMFlWQURBQ29ZWUU5U1krVVZXaUlvLzZrb1Rt?=
 =?utf-8?B?WVFhNFRXTFB5Y01GRUh4YlFyV0lTU0RucWNZcERGTEpSejVtZ3F0RTRBeEJ3?=
 =?utf-8?B?ZFJIQlVJMmhUbVg2VTBYelBQK3lsNUZlQ1Y1RjVMcmh5d3hNRVZnSUI5dlpH?=
 =?utf-8?B?Rll2VzNUNjI3RjRRMEFuaE13eHlKaHAxdk50R3h4Z21weWcxQWlJN1lsNU9r?=
 =?utf-8?B?c2swcG1qdGhiMkRtRHBIUXBsdWIrTkRUVStJb2xMYVE1WXFSRUVqemlaR2tv?=
 =?utf-8?B?cDl5TC9rT3J1VndETjVPaU5VUVpkMXQrSE1oS1N6cmVpN2RsVlp2Umt5MWdY?=
 =?utf-8?B?MlF2clNoRWdSNjRnelFpNU9uVGNwSDlpeFFrYVE2cTdTbW1HNlJCRkdJeFE0?=
 =?utf-8?B?RjNIc25ham9peDVCeXI4Wkk4Wk5VVVQ0czZxcE9jd0hBVlhXaDFBRCtZdlF3?=
 =?utf-8?B?cVV0ZmdBREFmYUY0ekNKd2llRzVBeWkwU0diODRxWmNYM2RUdFlVU01rSit5?=
 =?utf-8?B?Slhta3hra2RGeFBoVUdDZGRaWk03YW82UmdacnIrWWszRkJxc3lOb2Y5WHYy?=
 =?utf-8?B?U2d1VVUzY3k0eVRLTUlpRDFYOEE2a2lIeVBkSEs0VXpvS1BNSHA5d0Q1eE5K?=
 =?utf-8?B?ekx2M3Q2eW9JeU8rbGRsdUlxSWRJbkJFTWFQR1QzWWZNM3R1emgxalh0Nmxa?=
 =?utf-8?B?blM4d2VJVW1sNmE3SDVickFESm5FTDFSUkpzMnJoS1ppNTdoUXA0QVN2bm5i?=
 =?utf-8?B?RVNBcTIrZ011Yk85eUNTMTNMNEVxYVMrenRXc241K3VFVmlaN0tYTzhsU0lW?=
 =?utf-8?B?by9jTVpYMFJ0WXF2UHZlczAzd21YRjN2dXRwYWRTYkZ2Y0hzU2c3KzJqdmZI?=
 =?utf-8?B?cG5zTTlHL0MyQWRCRmFsYitTQ0NNZ2xJSTlhdENQU1E4QnNPcUUzUVVzTWRU?=
 =?utf-8?B?VjAyZEJDWHlCQzllMk9mMkVqbUYyT2xqWWNTcTdNKzRGZm9TaWpXbWx0dS9P?=
 =?utf-8?B?NVdTVUp6WnUwUFRlcVFmN0laNkZQTzg3RHhzUTV5eEw3Sk5xN09FMnJyd3Vo?=
 =?utf-8?B?OEcrTVd0RlY5TEt0UkNaa01ISWlZUFdWSmZYWXhwbU9pbWJqSVl3ZFBJeHJq?=
 =?utf-8?B?MkNMcUlaNkhQdWR6aVlhS0NCSXlIV3hncWtjR3FRR1k4aEtXT0FiWUhUZHZW?=
 =?utf-8?B?WnNsN0k3dUZqZE5CNGlsQis0QkgrQlRXbzRvTGJvRFlsdzIrZHJBOHdrTXZB?=
 =?utf-8?B?Vk5qZWdmK3QzcFhrRUtDWnczSU1rb0JBcG5Dc05jdUhvZWFDUmlrN0NlMHNT?=
 =?utf-8?B?YmU2MVNqejk0aTA2SGRzNG85K0pVb3o1a2g2YXRTNTZIekZGRTllOC95blhw?=
 =?utf-8?B?emFieEQ5eTEwLzNhUTFhdGdBbjdRZnFDTHc0RVFOZmFEa1JsQmJDQVpDYkRz?=
 =?utf-8?Q?s2yDO2yY1k3r7KnXGHJ8MpNYo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01609f7e-b739-44f3-7403-08ddf7a8f30e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 18:18:36.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2w0u9BYJwkdEfoLil02xVXSsl64XB458jGyTzf+1VnuLRdhAQMJLAs0W7SqSs03Iy25mhWUk8fsXnbZrisJsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4213
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



On 9/19/25 01:19, Sharma, Swati2 wrote:
> Hi Alex,
> 
> Is it possible to move colorop basic func() like
> can_use_colorop(), map_to_pipline(), etc. to lib?

These two functions use kms_colorop_t which defined in 
tests/kms_colorop.h, and it is not available in lib/

If you can refactor them to lib, I am happy to review your patches.

It would be nice if more colorop tests can be added to kms_colorop though.

> 
> On 27-08-2025 04:23 pm, Kamil Konieczny wrote:
>> Hi Alex,
>> On 2025-08-14 at 22:06:38 -0600, Alex Hung wrote:
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> This tests the color pipeline API, exposed via the
>>> COLOR PIPELINE plane property and drm_colorop objects.
>>>
>>> We introduce tests for:
>>>   - sRGB EOTF
>>>   - sRGB Inverse EOTF
>>>   - sRGB EOTF + sRGB Inverse EOTF
>>>
>>> The last one is the holy grail of LUT testing. It tests that
>>> after applying an EOTF, followed by its inverse EOTF we arrive
>>> back at the original value. We can use this to test for
>>> precision loss in the pipeline.
>>>
>>> All tests are tested via writeback. All transforms are done in
>>> SW (in floating point) and at the end the SW transformed buffer
>>> is compared with the KMS writeback output buffer. The two should
>>> match within a bracket of acceptable deviations. Since these
>>> deviations might look different for different KMS drivers we'll
>>> do this check on a driver-specific basis.
>>>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> ---
>>>   tests/kms_colorop.c | 508 ++++++++++++++++++++++++++++++++++++++++++++
>>>   tests/kms_colorop.h |  88 ++++++++
>>>   tests/meson.build   |   1 +
>>>   3 files changed, 597 insertions(+)
>>>   create mode 100644 tests/kms_colorop.c
>>>   create mode 100644 tests/kms_colorop.h
>>>
>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>> new file mode 100644
>>> index 000000000..e247477ec
>>> --- /dev/null
>>> +++ b/tests/kms_colorop.c
>>> @@ -0,0 +1,508 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person 
>>> obtaining a
>> Please remove this text as it is replaced by SPDX above.
>>
>>> + * copy of this software and associated documentation files (the 
>>> "Software"),
>>> + * to deal in the Software without restriction, including without 
>>> limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>> sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom 
>>> the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be 
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>> EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>> DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>> OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>> USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_color.h"
>>> +#include "sw_sync.h"
>>> +#include "kms_colorop.h"
>>> +
>>> +/**
>>> + * TEST: kms colorop
>>> + * Category: Display
>>> + * Description: Test to validate the retrieving and setting of DRM 
>>> colorops
>>> + *
>>> + * SUBTEST: plane-%s
>>> + * Description: Tests DRM colorop properties on a plane
>>> + * Driver requirement: amdgpu
>>> + * Functionality: kms_core
>>> + * Mega feature: General Display Features
>>> + * Test category: functionality test
>>> + *
>>> + * arg[1]:
>>> + *
>>> + * @srgb_eotf:                   sRGB EOTF
>>> + * @srgb_inv_eotf:               sRGB Inverse EOTF
>>> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
>>> + *
>>> + */
>>> +
>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>> future) use */
>>> +static bool check_writeback_config(igt_display_t *display, 
>>> igt_output_t *output,
>>> +                    drmModeModeInfo override_mode)
>>> +{
>>> +    igt_fb_t input_fb, output_fb;
>>> +    igt_plane_t *plane;
>>> +    uint32_t writeback_format = DRM_FORMAT_XRGB8888;
>>> +    uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>>> +    int width, height, ret;
>>> +
>>> +    igt_output_override_mode(output, &override_mode);
>>> +
>>> +    width = override_mode.hdisplay;
>>> +    height = override_mode.vdisplay;
>>> +
>>> +    ret = igt_create_fb(display->drm_fd, width, height,
>>> +                DRM_FORMAT_XRGB8888, modifier, &input_fb);
>>> +    igt_assert(ret >= 0);
>>> +
>>> +    ret = igt_create_fb(display->drm_fd, width, height,
>>> +                writeback_format, modifier, &output_fb);
>>> +    igt_assert(ret >= 0);
>>> +
>>> +    plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>> +    igt_plane_set_fb(plane, &input_fb);
>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>> +
>>> +    ret = igt_display_try_commit_atomic(display, 
>>> DRM_MODE_ATOMIC_TEST_ONLY |
>>> +                        DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>> +    igt_plane_set_fb(plane, NULL);
>>> +    igt_remove_fb(display->drm_fd, &input_fb);
>>> +    igt_remove_fb(display->drm_fd, &output_fb);
>>> +
>>> +    return !ret;
>>> +}
>>> +
>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>> future) use */
>>> +typedef struct {
>>> +    bool builtin_mode;
>>> +    bool custom_mode;
>>> +    bool list_modes;
>>> +    bool dump_check;
>>> +    int mode_index;
>>> +    drmModeModeInfo user_mode;
>>> +} data_t;
>>> +
>>> +static data_t data;
>>> +
>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>> future) use */
>>> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>>> +{
>>> +    int i;
>>> +    enum pipe pipe;
>>> +
>>> +    drmModeModeInfo override_mode = {
>>> +        .clock = 25175,
>>> +        .hdisplay = 640,
>>> +        .hsync_start = 656,
>>> +        .hsync_end = 752,
>>> +        .htotal = 800,
>>> +        .hskew = 0,
>>> +        .vdisplay = 480,
>>> +        .vsync_start = 490,
>>> +        .vsync_end = 492,
>>> +        .vtotal = 525,
>>> +        .vscan = 0,
>>> +        .vrefresh = 60,
>>> +        .flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>> +        .name = {"640x480-60"},
>>> +    };
>>> +
>>> +    for (i = 0; i < display->n_outputs; i++) {
>>> +        igt_output_t *output = &display->outputs[i];
>>> +
>>> +        if (output->config.connector->connector_type != 
>>> DRM_MODE_CONNECTOR_WRITEBACK)
>>> +            continue;
>>> +
>>> +        for_each_pipe(display, pipe) {
>>> +            igt_output_set_pipe(output, pipe);
>>> +
>>> +            if (data.custom_mode)
>>> +                override_mode = data.user_mode;
>>> +            if (data.builtin_mode)
>>> +                override_mode = output->config.connector- 
>>> >modes[data.mode_index];
>>> +
>>> +            if (check_writeback_config(display, output, 
>>> override_mode)) {
>>> +                igt_debug("Using connector %u:%s on pipe %d\n",
>>> +                      output->config.connector->connector_id,
>>> +                      output->name, pipe);
>>> +                return output;
>>> +            }
>>> +        }
>>> +
>>> +        igt_debug("We found %u:%s, but this test will not be able to 
>>> use it.\n",
>>> +              output->config.connector->connector_id, output->name);
>>> +
>>> +        /* Restore any connectors we don't use, so we don't trip on 
>>> them later */
>>> +        kmstest_force_connector(display->drm_fd, output- 
>>> >config.connector, FORCE_CONNECTOR_UNSPECIFIED);
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>> future) use */
>>> +static uint64_t get_writeback_fb_id(igt_output_t *output)
>>> +{
>>> +    return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
>>> +}
>>> +
>>> +/* TODO move to lib for kms_writeback and kms_colorop (and other 
>>> future) use */
>>> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
>>> +{
>>> +    if (get_writeback_fb_id(output) == 0)
>>> +        return;
>>> +
>>> +    igt_output_set_pipe(output, PIPE_NONE);
>>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>>> +}
>>> +
>>> +static void get_and_wait_out_fence(igt_output_t *output)
>>> +{
>>> +    int ret;
>>> +
>>> +    igt_assert(output->writeback_out_fence_fd >= 0);
>>> +
>>> +    ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
>>> +    igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", 
>>> strerror(-ret));
>>> +    close(output->writeback_out_fence_fd);
>>> +    output->writeback_out_fence_fd = -1;
>>> +}
>>> +
>>> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t 
>>> *colorop, kms_colorop_t *desired)
>>> +{
>>> +    switch (desired->type) {
>>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>>> +        if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) 
>>> == DRM_COLOROP_1D_CURVE)
>>> +            return true;
>>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>>> +    case KMS_COLOROP_CTM:
>>> +    case KMS_COLOROP_LUT3D:
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>> +/**
>>> + * Iterate color pipeline that begins with colorop and try to map
>>> + * colorops[] to it.
>>> + */
>>> +static bool map_to_pipeline(igt_display_t *display,
>>> +                igt_colorop_t *colorop,
>>> +                kms_colorop_t *colorops[])
>>> +{
>>> +    igt_colorop_t *next = colorop;
>>> +    kms_colorop_t *current_op;
>>> +    int i = 0;
>>> +    int prop_val = 0;
>>> +
>>> +    current_op = colorops[i++];
>>> +    igt_require(current_op);
>>> +
>>> +    while (next) {
>>> +        if (can_use_colorop(display, next, current_op)) {
>>> +            current_op->colorop = next;
>>> +            current_op = colorops[i++];
>>> +            if (!current_op)
>>> +                break;
>>> +        }
>>> +        prop_val = igt_colorop_get_prop(display, next,
>>> +                        IGT_COLOROP_NEXT);
>>> +        next = igt_find_colorop(display, prop_val);
>>> +    }
>>> +
>>> +    if (current_op) {
>>> +        /* we failed to map the pipeline */
>>> +
>>> +        /* clean up colorops[i].colorop mappings */
>>> +        for (i = 0, current_op = colorops[0]; current_op; current_op 
>>> = colorops[i++])
>>> +            current_op->colorop = NULL;
>>> +
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
>>> +                     igt_plane_t *plane,
>>> +                     kms_colorop_t *colorops[])
>>> +{
>>> +    igt_colorop_t *colorop = NULL;
>>> +    int i;
>>> +
>>> +    /* go through all color pipelines */
>>> +    for (i = 0; i < plane->num_color_pipelines; ++i) {
>>> +        if (map_to_pipeline(display, plane->color_pipelines[i], 
>>> colorops)) {
>>> +            colorop = plane->color_pipelines[i];
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return colorop;
>>> +}
>>> +
>>> +static void set_colorop(igt_display_t *display,
>>> +            kms_colorop_t *colorop)
>>> +{
>>> +    igt_assert(colorop->colorop);
>>> +    igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 
>>> 0);
>>> +
>>> +    /* Set to desired value from kms_colorop_t */
>>> +    switch (colorop->type) {
>>> +    case KMS_COLOROP_ENUMERATED_LUT1D:
>>> +        switch (colorop->enumerated_lut1d_info.tf) {
>>> +        case KMS_COLOROP_LUT1D_SRGB_EOTF:
>>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
>>> +            break;
>>> +        case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
>>> +            igt_colorop_set_prop_enum(colorop->colorop, 
>>> IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
>>> +            break;
>>> +        case KMS_COLOROP_LUT1D_PQ_EOTF:
>>> +        case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
>>> +        default:
>>> +            igt_fail(IGT_EXIT_FAILURE);
>>> +        }
>>> +        break;
>>> +    case KMS_COLOROP_CUSTOM_LUT1D:
>>> +    case KMS_COLOROP_CTM:
>>> +    case KMS_COLOROP_LUT3D:
>>> +    default:
>>> +        igt_fail(IGT_EXIT_FAILURE);
>>> +    }
>>> +}
>>> +
>>> +static void set_color_pipeline(igt_display_t *display,
>>> +                   igt_plane_t *plane,
>>> +                   kms_colorop_t *colorops[],
>>> +                   igt_colorop_t *color_pipeline)
>>> +{
>>> +    igt_colorop_t *next;
>>> +    int prop_val = 0;
>>> +    int i;
>>> +
>>> +    igt_plane_set_color_pipeline(plane, color_pipeline);
>>> +
>>> +    for (i = 0; colorops[i]; i++)
>>> +        set_colorop(display, colorops[i]);
>>> +
>>> +    /* set unused ops in pipeline to bypass */
>>> +    next = color_pipeline;
>>> +    i = 0;
>>> +    while (next) {
>>> +        if (!colorops[i] || colorops[i]->colorop != next)
>>> +            igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
>>> +        else
>>> +            i++;
>>> +
>>> +        prop_val = igt_colorop_get_prop(display, next,
>>> +                        IGT_COLOROP_NEXT);
>>> +        next = igt_find_colorop(display, prop_val);
>>> +    }
>>> +}
>>> +
>>> +static void set_color_pipeline_bypass(igt_plane_t *plane)
>>> +{
>>> +    igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>>> +}
>>> +
>>> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>>> +{
>>> +    if (is_vkms_device(in->fd))
>>> +        return igt_cmp_fb_pixels(in, out, 1, 1);
>>> +
>>> +    /*
>>> +     * By default we'll look for a [0, 0] bracket. We can then
>>> +     * define it for each driver that implements support for this
>>> +     * test. That way we can understand the precision of each
>>> +     * driver better.
>>> +     */
>>> +    return igt_cmp_fb_pixels(in, out, 0, 0);
>>> +}
>>> +
>>> +#define DUMP_FBS 1
>>> +
>>> +#define MAX_COLOROPS 3
>>> +#define NUM_COLOROP_TESTS 3
>>> +#define MAX_NAME_SIZE 256
>>> +
>>> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t 
>>> *sw_transform_fb)
>>> +{
>>> +    int i;
>>> +    igt_pixel_transform transforms[MAX_COLOROPS];
>>> +
>>> +    for (i = 0; colorops[i]; i++)
>>> +        transforms[i] = colorops[i]->transform;
>>> +
>>> +    igt_color_transform_pixels(sw_transform_fb, transforms, i);
>>> +}
>>> +
>>> +static void colorop_plane_test(igt_display_t *display,
>>> +                   kms_colorop_t *colorops[])
>>> +{
>>> +    igt_colorop_t *color_pipeline = NULL;
>>> +    igt_output_t *output;
>>> +    igt_plane_t *plane;
>>> +    igt_fb_t input_fb;
>>> +    igt_fb_t sw_transform_fb;
>>> +    igt_fb_t output_fb;
>>> +    drmModeModeInfo mode;
>>> +    unsigned int fb_id;
>>> +    igt_crc_t input_crc, output_crc;
>>> +
>>> +    output = kms_writeback_get_output(display);
>>> +    igt_require(output);
>>> +
>>> +    if (output->use_override_mode)
>>> +        memcpy(&mode, &output->override_mode, sizeof(mode));
>>> +    else
>>> +        memcpy(&mode, &output->config.default_mode, sizeof(mode));
>>> +
>>> +    /* create input fb */
>>> +    plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>> +    igt_assert(plane);
>>> +
>>> +    fb_id = igt_create_color_pattern_fb(display->drm_fd,
>>> +                    mode.hdisplay, mode.vdisplay,
>>> +                    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>> +                    0.2, 0.2, 0.2, &input_fb);
>>> +    igt_assert(fb_id >= 0);
>>> +    igt_plane_set_fb(plane, &input_fb);
>>> +#if DUMP_FBS
>>> +    igt_dump_fb(display, &input_fb, ".", "input");
>>> +#endif
>>> +
>>> +    /* create output fb */
>>> +    fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, 
>>> mode.vdisplay,
>>> +                DRM_FORMAT_XRGB8888,
>>> +                igt_fb_mod_to_tiling(0),
>>> +                &output_fb);
>>> +    igt_require(fb_id > 0);
>>> +
>>> +    igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>>> +
>>> +    igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>>> +
>>> +    /* reset color pipeline*/
>>> +
>>> +    set_color_pipeline_bypass(plane);
>>> +
>>> +    /* Commit */
>>> +    igt_plane_set_fb(plane, &input_fb);
>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>> +
>>> +    igt_display_commit_atomic(output->display,
>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                NULL);
>>> +    get_and_wait_out_fence(output);
>>> +
>>> +    /* Compare input and output buffers. They should be equal here. */
>>> +    igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>>> +
>>> +    igt_assert_crc_equal(&input_crc, &output_crc);
>>> +
>>> +    /* create sw transformed buffer */
>>> +
>>> +    igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>>> +    igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>>> +
>>> +    apply_transforms(colorops, &sw_transform_fb);
>>> +#if DUMP_FBS
>>> +    igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
>>> +#endif
>>> +    /* discover and set COLOR PIPELINE */
>>> +
>>> +    /* get COLOR_PIPELINE enum */
>>> +    color_pipeline = get_color_pipeline(display, plane, colorops);
>>> +
>>> +    /* skip test if we can't find applicable pipeline */
>>> +    igt_skip_on(!color_pipeline);
>>> +
>>> +    set_color_pipeline(display, plane, colorops, color_pipeline);
>>> +
>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>> +
>>> +    /* commit COLOR_PIPELINE */
>>> +    igt_display_commit_atomic(display,
>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                NULL);
>>> +    get_and_wait_out_fence(output);
>>> +#if DUMP_FBS
>>> +    igt_dump_fb(display, &output_fb, ".", "output");
>>> +#endif
>>> +
>>> +    /* compare sw transformed and KMS transformed FBs */
>>> +    igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>>> +
>>> +    /* reset color pipeline*/
>>> +    set_color_pipeline_bypass(plane);
>>> +
>>> +    /* Commit */
>>> +    igt_plane_set_fb(plane, &input_fb);
>>> +    igt_output_set_writeback_fb(output, &output_fb);
>>> +
>>> +    igt_display_commit_atomic(output->display,
>>> +                DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                NULL);
>>> +    get_and_wait_out_fence(output);
>>> +
>>> +    /* cleanup */
>>> +    detach_crtc(display, output);
>>> +    igt_remove_fb(display->drm_fd, &input_fb);
>>> +    igt_remove_fb(display->drm_fd, &output_fb);
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +
>>> +    struct {
>>> +        kms_colorop_t *colorops[MAX_COLOROPS];
>>> +        const char *name;
>>> +    } tests[] = {
>>> +        { { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>>> +        { { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
>>> +        { { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, 
>>> NULL }, "srgb_eotf-srgb_inv_eotf" }
>>> +    };
>>> +
>>> +    igt_display_t display;
>>> +    int i, ret;
>>> +
>>> +    igt_fixture {
>>> +        display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>> +
>>> +        if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 
>>> 1) == 0)
>>> +            display.is_atomic = 1;
>>> +
>>> +        ret = drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>> +
>>> +        igt_require_f(!ret, "error setting 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>> +
>>> +        igt_display_require(&display, display.drm_fd);
>>> +
>>> +        kmstest_set_vt_graphics_mode();
>>> +
>>> +        igt_display_require(&display, display.drm_fd);
>>> +
>>> +        igt_require(display.is_atomic);
>>> +
>>> +    }
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(tests); i++) {
>>> +        igt_describe("Check color ops on a plane");
>>> +        igt_subtest_f("plane-%s", tests[i].name)
>>> +            colorop_plane_test(&display, tests[i].colorops);
>>> +    }
>>> +
>>> +    igt_describe("Tests getting and setting COLOR_PIPELINE property 
>>> on plane");
>>> +    igt_fixture {
>>> +        igt_display_fini(&display);
>>> +    }
>>> +}
>>> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
>>> new file mode 100644
>>> index 000000000..f414895dd
>>> --- /dev/null
>>> +++ b/tests/kms_colorop.h
>>> @@ -0,0 +1,88 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person 
>>> obtaining a
>> Same here, remove this text.
>>
>> Regards,
>> Kamil
>>
>>> + * copy of this software and associated documentation files (the 
>>> "Software"),
>>> + * to deal in the Software without restriction, including without 
>>> limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>> sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom 
>>> the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be 
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>> EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>> DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>> OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>> USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef __KMS_COLOROP_H__
>>> +#define __KMS_COLOROP_H__
>>> +
>>> +#include "igt_color.h"
>>> +
>>> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
>>> +
>>> +typedef int (*transform_fb)(igt_fb_t *in);
>>> +
>>> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
>>> +
>>> +/* Test version definitions */
>>> +typedef enum kms_colorop_type {
>>> +    KMS_COLOROP_ENUMERATED_LUT1D,
>>> +    KMS_COLOROP_CUSTOM_LUT1D,
>>> +    KMS_COLOROP_CTM,
>>> +    KMS_COLOROP_LUT3D
>>> +} kms_colorop_type_t;
>>> +
>>> +typedef enum kms_colorop_lut1d_tf {
>>> +    KMS_COLOROP_LUT1D_SRGB_EOTF,
>>> +    KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
>>> +    KMS_COLOROP_LUT1D_PQ_EOTF,
>>> +    KMS_COLOROP_LUT1D_PQ_INV_EOTF,
>>> +} kms_colorop_lut1d_tf_t;
>>> +
>>> +typedef struct kms_colorop_enumerated_lut1d_info {
>>> +    kms_colorop_lut1d_tf_t tf;
>>> +} kms_colorop_enumerated_lut1d_info_t;
>>> +
>>> +typedef struct kms_colorop {
>>> +    kms_colorop_type_t type;
>>> +
>>> +    union {
>>> +        kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
>>> +    };
>>> +
>>> +    const char *name;
>>> +
>>> +    igt_pixel_transform transform;
>>> +
>>> +    /* Mapped colorop */
>>> +    igt_colorop_t *colorop;
>>> +
>>> +} kms_colorop_t;
>>> +
>>> +kms_colorop_t kms_colorop_srgb_eotf = {
>>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>>> +    .enumerated_lut1d_info = {
>>> +        .tf = KMS_COLOROP_LUT1D_SRGB_EOTF
>>> +    },
>>> +    .name = "srgb_eotf",
>>> +    .transform = &igt_color_srgb_eotf
>>> +};
>>> +
>>> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
>>> +    .type = KMS_COLOROP_ENUMERATED_LUT1D,
>>> +    .enumerated_lut1d_info = {
>>> +        .tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
>>> +    },
>>> +    .name = "srgb_inv_eotf",
>>> +    .transform = &igt_color_srgb_inv_eotf
>>> +};
>>> +
>>> +#endif /* __KMS_COLOROP_H__ */
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 5c01c64e9..e612e1a05 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -26,6 +26,7 @@ test_progs = [
>>>       'kms_bw',
>>>       'kms_color',
>>>       'kms_concurrent',
>>> +    'kms_colorop',
>>>       'kms_content_protection',
>>>       'kms_cursor_crc',
>>>       'kms_cursor_edge_walk',
>>> -- 
>>> 2.43.0
>>>
> 

