Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62C6C8303C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 01:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EE910E00C;
	Thu,  3 Jul 2025 01:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="utjESETW";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6964E10E00C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 01:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqzpSyYoQbT6vuGJ3Q4sIDYBjhXE0XcYvgLX2julGN04RdD1zi/obPkY+A2IMYpRrj8iQ8JsgiMYcDz5pQEx/hHiefuXXNZlL8RyFQY4Qo9JlnqMtsbG54dML3Mg1eazWhwJF4cgAZvvP+kPkRfiqL/uQS9lWkVhGv2nWUnvUGBVlW/xOU9J5LhEmoiKhShzhy62yD6kVI+rtpqZGZa6TGBXqZRY4Lk3jCJaegAAtUVtAywuWm96ssFzkPlS3K+0xxFYj8XCKSlvtq+ugN53xKMoiS+3wby0sIoH+2RS3zRGadcVkUHEnp80N09WIcoNFIvxGtsa7gkuKrzE0c+u7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqMhQFiOrH+figi5kLiWV18hEFCc45nkCV6KjndE6j8=;
 b=lrj+rfd0XFyDiMpL3YmfHY3lQFKyfGi/uR3iNHHLZcacQmv+EOjdOXfvpWyraJGl/gLkE5cmETHQ2VOWjRG6EqPNUoWO6hbTsW435Hgl7UN51NWlygbwh9BvGecwCImX/nH7eumFeEv5ai/vyMXAnC1uEplWCLnZPUNoTBYtnOwOwgzMGQjRVlt4gpa3fRtc++Y7wjqz6+gKubXVgknrwaseNtfIQIoZz4LcGfCvyFzIGlS8nSqAzHQbc71EbT8yZE4yI2WQ09OnBlMe5Ss1Nv3U6K0yK+2ERVx8rs0KW8pBIqphElj6xyadFs7S+VNhKQimgshIU16PrGe2GrPj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqMhQFiOrH+figi5kLiWV18hEFCc45nkCV6KjndE6j8=;
 b=utjESETWJyHQkB44xLUi4SZNONLB73Cdm2AGZ+ZPZ/am4SW3gbBnSWs0wemlcEzdX+Z9cNXxH3c+d2KdmWglSTbS+OScwBtjJrRzjT21E8Jnrr+IXVvd3UxMWyiCmRHZRSgR6rJJJTpzzpMnweM0uirA6ZtpWMFDzbiwkU/ixsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS4PR12MB9611.namprd12.prod.outlook.com (2603:10b6:8:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.33; Thu, 3 Jul
 2025 01:32:49 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 01:32:49 +0000
Message-ID: <bb3f8bdf-a82a-429b-b538-4a708bea7468@amd.com>
Date: Wed, 2 Jul 2025 21:32:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/5] lib/amdgpu: Consolidate user queue
 implementation into amd_ip_blocks.h
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250702054730.366888-1-Jesse.Zhang@amd.com>
 <20250702054730.366888-5-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250702054730.366888-5-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS4PR12MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: 796e6e91-8f76-4304-5c61-08ddb9d184fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDZpcUtmQVR5MWNhNWhsa0xyYWVrYkhualFXNjM5WE41UVgrZ045ZXBjd0tl?=
 =?utf-8?B?R0Q4UlQ4Z0ZnSEpGWEhPb3h3WXJhYTNtSjlGQjdFODN1MU9ubW10eE9sZkJk?=
 =?utf-8?B?bUhMejB3S0VIa0ZlZFlsNzMrVzlLQVI0SE9BaFExeTVNSm95VGZtUnl5TCsr?=
 =?utf-8?B?RFRHVUFVa3BnUnJ3ZXFSUjUxOEl5c09oRzBMTlIvMWNEWHlSZEJOcHI0QmZD?=
 =?utf-8?B?d0RBUTRqdmc2d1dXL2lhMHdMR1JCYVptM0ZybW9Od0RxVGtpcHdZb0paVG1U?=
 =?utf-8?B?bXQwK1RuZWxDRkUxVTFIOStTY3RvUUpNTDRNbVRUTnA1ZEg3QnYwMit6ZGR0?=
 =?utf-8?B?aVhuTGcxV3VzZ1gvWU8rZzJPTFgrU2EvWE1RcEtaR2VmdlhzT2tPQ3FRcklx?=
 =?utf-8?B?MXhibWJGRDZBWGU5K1RXOXBNQkx1UnQzMlgyN0F5TDFvUURrSGo0SlBmZ1NB?=
 =?utf-8?B?RWUrNjdYc0ZMUThKWld5d2tZSUxtOG9wenMvL3RVeDJLVmpLQ3loQVNocmtU?=
 =?utf-8?B?QitGSmsxMS90b2tJbnM4SmR6WDhrQzZlOSswa0JHS3YyU3JnOG5SUStRS2Nu?=
 =?utf-8?B?RjBXRC9oeEw4QVZRWnl4K3ZQa3RFS0JadGNVeC9XN2FoSjJEYUFCTURBVEh6?=
 =?utf-8?B?L2tZZS9GQ2FkNGVxdXAyZnFxQjJlKzlxdzRKckxCQVVkamxLZ0J4ZTM5dGNZ?=
 =?utf-8?B?ZmlhQVdNUUhoaVk1WndJcURQL1V2czBxV1Jma1FHcWt4NFdPUHVKMnBzYWxL?=
 =?utf-8?B?a3hQcXU5L2tpd1VYbmFnU3ZxQ1d4bk1PREJxa1dnNlprUmQwOXBWQmJYNTdq?=
 =?utf-8?B?ajU4OEJBaUVqdVdPbmZZeDl4NWRzdjdVdFV4eHJpc1UzMzdHYUkxYTIyenhy?=
 =?utf-8?B?RmRyMHRaYXJ5a1RDR1V6Qjg0RjJzQS9GY1JGRXZHYlBnd3ovQ3padDVWa3lC?=
 =?utf-8?B?TjdjWXRtdHpCaGd4dUowcW1ic3FxbzBYMk1jZWV1REhOWHBiVU9iTEJoQyt4?=
 =?utf-8?B?L25kam9HNVZPZ3ZldkRtcEErM3duTXB1NDQyZ3dNdURWTGVsNmJDcGs2VGJ3?=
 =?utf-8?B?QnoxQnFNdGJNNHJtN3VJNytJaWtCUkRUb0p4MTg1T2Rxd25JQTZTYkFBdkhC?=
 =?utf-8?B?bk1DdFBCbXN2bHJNNzNBSzNOdUdEdVR0RWI2Rzd5ejBQMTlNS1R6MHBucnhV?=
 =?utf-8?B?VGxaTC9oSnlta0VrQUxrcDNBY0ZISGk4U0R4aStlTFJjYWdHL01GL3FiL2RC?=
 =?utf-8?B?UDBhaUdrK3o5dElaT25ocHdHdU9oeDIyaEc2V1hrSDhEMTM1VnE2dWZDZ3hJ?=
 =?utf-8?B?S000RkMwbU5nWHZFVGZmUHJ2S3l2WWdNdUE4U0QwMUNERy9hWUJzNnQzdGw3?=
 =?utf-8?B?K25paFZTaVRtUWQwMXlLSy9oelczd08rT2paUkczZmUvNDE0Q2xGVjM2RjVo?=
 =?utf-8?B?SERUUDd5T1lmZFRZaUJPd1NhdU01ZEowZHJxTzNLQlNzbjlLckJhL28vN1pR?=
 =?utf-8?B?dzRXOXBPQTNNR2FUMmNVb3U4TUlGUWg1am5wOXkrVWVBVGkyM2JjaVgwbVM2?=
 =?utf-8?B?N2JCWllCTnZXZEtlQzV0RkVpcGk3TGttZWk0OHY1UWhGU3I4RzY0T3N6QzlQ?=
 =?utf-8?B?b0k1bUV3VTQzRkZpUHBqNGtOcHVHU0pOUVBBSVBtNlMwMHpwS2lKQU83Zngx?=
 =?utf-8?B?VzNUa3JQNkhKRXhWTlBybUcwVVlTLzJHdkEvbnZRRlh4WXlZeFlRaEQ0QnhZ?=
 =?utf-8?B?NDE1SDNwMDdDMU13Q2dPeGpzbnB1blloaVpFUUdkc25jRndWcHgyQ3QvcWUw?=
 =?utf-8?B?TC9VZmorWWQ4N21HSkRiVnVpME5yZnZkVWRQMWZMYXA2UVNvRkdkU2ZrTndG?=
 =?utf-8?B?bVdjbnNFdEJkN1ZlVE9NazBZanhNenRKTzM0WDN0UWdlMklkcU1Yb2k5WDBl?=
 =?utf-8?Q?0xQL1JmzdbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStIMFIxZWlua2kvUDlObEZ4TWxDNmNVVVJIamtBOGk2a1FSa2kzMnhiU0kx?=
 =?utf-8?B?d0NBRmVYNkwvTGpUN3lSNEw5dWo3b3V6RnFOR1F6QlZ4aEgvVmUzc21xQWdL?=
 =?utf-8?B?b0hKTzVmWk9ta05IVnE0Tmw5RjNncmxiN2FDOUVmazBVTE5XaXVETFRlc0M2?=
 =?utf-8?B?UllmSnlYT1h2UW05QXJmK1A0THNNdTFhc0RQbzcwbEhmeFBNUkhVUDNGaC9G?=
 =?utf-8?B?a2Y2TUlRNWxIUmFOeW9xY2xJeVgyaHV1QSttazU5V3F2M2x1QkRVQWhkZ00y?=
 =?utf-8?B?UUdRZFdiQ0pMMy9MdENDM0RLSWVlYUo3cXUyM3AzeEF4TnF4eks5QnE3Njds?=
 =?utf-8?B?L3dCUVhlY295bC9qN0VGaElFMUo3dGgwL2FaMjhEcUxyRWkrSkFKR2QxUHJn?=
 =?utf-8?B?dzljMDNDaFl3cFgxREpjN09LN05DNTUrNU5sVmp2dXFuS3BDU3NXbzRTaFNW?=
 =?utf-8?B?OFRHaDROQTBjUDlrWE9TdlNzSWxVTmhUbldrbVZacW90UHhMcmpVRnAyYlZN?=
 =?utf-8?B?Nnk4QlFaWk4vZ1d0Y094a0NydHUwVW5Tb0V3MEk2OXN4WEc2SU1sSWJwenhx?=
 =?utf-8?B?ZG0vZVU5OGNKb3dFSVJOUEhzR0pOdG9hVlBkMW9YREZSMHp3VnRNUVAzUlJW?=
 =?utf-8?B?eFRQclFldGR3UlNjcm5GUTVrZXV2RlpsbmlObVlwUS84cGxkUjZqbDBFSDVQ?=
 =?utf-8?B?cG8vaTRDd2p2Qk1CME94OWtoMkgzd2U3NWNYSUlPbjBySFFJYUM1U1BlN2Z2?=
 =?utf-8?B?VTRsMU9BdiswS01BL3YvWXZaUkR1OExkckpwWENtUkZnWGhEL0F2ekxhQkdW?=
 =?utf-8?B?dGRXbDFtRWRVNS95VEQ3a3hlamcyWk8zNFVoUTRrVzJsQktneVltdDNYdm50?=
 =?utf-8?B?M1RrU011TmVNcEs0c25tZzZvLy9UT3o3SU8xYUZmNWMxd3ZocTJua3ZBK1hk?=
 =?utf-8?B?MHVEZ3FCZG5xbDRtZFNRdzFRa05XSWJkR082bkgxWWFUSEdlTWtNSjBnTS9h?=
 =?utf-8?B?V0gydmhNQ05Jem45YTBjbk5XdTFrTm5FanpPcHBDRFJUZWU4MEpSRzRFcFBV?=
 =?utf-8?B?QW92dTlZUEthVXBhSGwvbXNtcDAxN2RqNFdkYW5PUHFsak44UVM4aFFDbEQ4?=
 =?utf-8?B?K1p1SUpPS3dFYzd6N3UzOFdtM0YwdWVXd25HcGlrUlhBK3EvcVk4VjhMV3Ey?=
 =?utf-8?B?T0EzYjhaUmdyWlBvak91NE5vOXVtWnJ1LzdDOUFoNzVuTjllV3R3dWUrZWRv?=
 =?utf-8?B?YUVzOTJBaFNkQmpPeDhzNHphYmJ3bktnT2xGK2R3QXduWUdTOHNzY3VWWGFq?=
 =?utf-8?B?WStXcHE0dDY5RU90NFBZbmtXOHA1cnlQYUJVWTJLbHEzWkJkVldGTFBnakNu?=
 =?utf-8?B?ZVFsYVBVc1BxY3NNZHBEQTV3ZWFkRE1DSGtubVVxdzU2RjI4MUlTZXNrWWNm?=
 =?utf-8?B?MU96QThBazVHSFJOaU83R0M5SXYySmhzSVpRbGI4RXJhUWE5dndqT3BISU9x?=
 =?utf-8?B?T3pEL21wblU0dkp4Sno3R0lFVnY1VWpjd1R5MnBXaG01WjlSSTBYL2xCUzhY?=
 =?utf-8?B?M2s1YkNhTGJKT0psQmd6RGoyMHlJa21MRFovZ0FGNmlVM3MyTlp6SElEUGlZ?=
 =?utf-8?B?UUQ5akdYMHRxMDVRQUdUN08zWmpzNjhIZHk4eDZaV2d6Mi9VOEU0d1VnVWto?=
 =?utf-8?B?UElhK2sreGhONXExV3RDTkdRMHZzZ0oyTy8rYnJIQ005eDhDUHhDZXdXWWxx?=
 =?utf-8?B?U3JPMEwybC9YNjdxQ3lyYk0zQmVoNzhBZUtYczZzMllRNVFUakNoSzU4b3ox?=
 =?utf-8?B?V0hSTGpWVGdnS0xsemhUdkxyOGVITVFUdk1BTUc0akxuQTUybUFvT3hYYXpZ?=
 =?utf-8?B?TENKSnFPQlVUc0h6VmtSY2cwaEF1bW5zSi9qV3dHcVFGRzR5SzhwVjhGazVI?=
 =?utf-8?B?RVF5VjBFd3k5dS9XNng2SEtHSmdHZU5xMUpkb090bE4yWTFyVUd0ekVzaGgx?=
 =?utf-8?B?T2VCU2hiNVAwQzVBWDBLRlNPcnBTS0F3bUtuaXJtcGxWS01ZUVFnS0NkLy9p?=
 =?utf-8?B?Ui9sRjF4WDJKQ0k5UUM2WlZlWFhnVkJkcHFsVkpET00rSHRleWlWWnRlWk1s?=
 =?utf-8?Q?HDWBdichqDXCw8ZF+Y6rufYzw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796e6e91-8f76-4304-5c61-08ddb9d184fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 01:32:48.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQ4CkJU9PXVwBhnKzZ/vwOZrm0MHwNZvSEshAMoaxrpQs7JhfmlKVpPkUVE1ekTcqLVhQ23oHD/hG83wERSbxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9611
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

The series of 5 patches looks good to me as we discussed.
The warning was addressed:
../lib/amdgpu/amd_command_submission.c:38:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2025-07-02 01:47, Jesse.Zhang wrote:
> This commit refactors the user queue (UMQ) implementation by:
>
> 1. Moving all UMQ-related definitions and functions from amd_userq.[ch]
>    into amd_ip_blocks.h for better code organization and to reduce
>    unnecessary file separation.
>
> 2. Adding user queue operations (create/submit/destroy) directly to the
>    amdgpu_ip_funcs structure, making them IP-block specific.
>
> 3. Removing the now-obsolete amd_userq.[ch] files and updating all
>    references to use the new IP block interface.
>
> Key changes include:
> - Defined UMQ constants (PAGE_SIZE, queue sizes) in header
> - Added packet building macros (amdgpu_pkt_begin/add_dw/end)
> - Integrated UMQ functions into IP block ops structure
> - Updated all tests to use IP block funcs instead of direct UMQ calls
> - Removed standalone UMQ implementation files
>
> This consolidation improves code maintainability and makes the UMQ
> implementation more consistent with the rest of the driver architecture.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c |  17 +-
>  lib/amdgpu/amd_compute.c            |   9 +-
>  lib/amdgpu/amd_deadlock_helpers.c   |   7 +-
>  lib/amdgpu/amd_ip_blocks.c          | 496 ++++++++++++++++++++++++++++
>  lib/amdgpu/amd_ip_blocks.h          |  40 +++
>  lib/amdgpu/amd_memory.c             |   3 +-
>  lib/amdgpu/amd_userq.c              | 494 ---------------------------
>  lib/amdgpu/amd_userq.h              |  55 ---
>  lib/meson.build                     |   3 +-
>  tests/amdgpu/amd_basic.c            |   9 +-
>  tests/amdgpu/amd_cs_nop.c           |   9 +-
>  tests/amdgpu/amd_deadlock.c         |   1 -
>  12 files changed, 564 insertions(+), 579 deletions(-)
>  delete mode 100644 lib/amdgpu/amd_userq.c
>  delete mode 100644 lib/amdgpu/amd_userq.h
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index fcc356f8f..2b13e7a9b 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,7 +10,6 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> -#include "lib/amdgpu/amd_userq.h"
>  #include "ioctl_wrappers.h"
>  
>  
> @@ -33,7 +32,9 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  	struct amdgpu_cs_fence fence_status = {0};
>  	amdgpu_va_handle va_handle;
>  	bool user_queue = ring_context->user_queue;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
>  
> +	ip_block = get_ip_block(device, ip_type);
>  	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
>  
>  	if (expect_failure) {
> @@ -68,7 +69,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
>  
>  	if (user_queue)
> -		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
> +		ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
>  	else {
>  		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
>  		ring_context->ib_info.size = ring_context->pm4_dw;
> @@ -163,7 +164,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> @@ -246,7 +247,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  	free(ring_context->pm4);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_free(ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> @@ -287,7 +288,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  	igt_assert_eq(r, 0);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> @@ -341,7 +342,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  	free(ring_context->pm4);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_free(ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> @@ -383,7 +384,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> @@ -467,7 +468,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  	free(ring_context->pm4);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
> +		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_free(ring_context->context_handle);
>  		igt_assert_eq(r, 0);
> diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
> index d53df241c..d92b99a76 100644
> --- a/lib/amdgpu/amd_compute.c
> +++ b/lib/amdgpu/amd_compute.c
> @@ -26,7 +26,6 @@
>  #include "amd_memory.h"
>  #include "amd_compute.h"
>  #include "amd_sdma.h"
> -#include "amd_userq.h"
>  
>  /**
>   *
> @@ -42,6 +41,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	struct amdgpu_cs_request ibs_request;
>  	struct amdgpu_cs_ib_info ib_info;
>  	struct amdgpu_cs_fence fence_status;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
>  	uint32_t *ptr;
>  	uint32_t expired;
>  	int r, instance;
> @@ -50,6 +50,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  
>  	struct amdgpu_ring_context *ring_context;
>  
> +	ip_block = get_ip_block(device, type);
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
> @@ -57,7 +58,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	igt_assert_eq(r, 0);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device, ring_context, type);
> +		ip_block->funcs->userq_create(device, ring_context, type);
>  	} else {
>  		r = amdgpu_cs_ctx_create(device, &context_handle);
>  		igt_assert_eq(r, 0);
> @@ -93,7 +94,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  		ring_context->pm4_dw = 16;
>  
>  		if (user_queue) {
> -			amdgpu_user_queue_submit(device, ring_context, type,
> +			ip_block->funcs->userq_submit(device, ring_context, type,
>  						 ib_result_mc_address);
>  		} else {
>  			memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
> @@ -131,7 +132,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	}
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device, ring_context, type);
> +		ip_block->funcs->userq_destroy(device, ring_context, type);
>  	} else {
>  		r = amdgpu_cs_ctx_free(context_handle);
>  		igt_assert_eq(r, 0);
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index f7845edb0..1ed407332 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -13,7 +13,6 @@
>  #include <signal.h>
>  #include "amd_memory.h"
>  #include "amd_deadlock_helpers.h"
> -#include "lib/amdgpu/amd_userq.h"
>  #include "lib/amdgpu/amd_command_submission.h"
>  
>  #define MAX_JOB_COUNT 200
> @@ -292,11 +291,12 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	struct amdgpu_ring_context *ring_context;
>  	int r = 0;
>  
> +	ip_block = get_ip_block(device_handle, ip_type);
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device_handle, ring_context, ip_type);
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_type);
>  	} else {
>  		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
>  			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
> @@ -314,7 +314,6 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	ring_context->user_queue = user_queue;
>  	ring_context->time_out = 0x7ffff;
>  	igt_assert(ring_context->pm4);
> -	ip_block = get_ip_block(device_handle, ip_type);
>  	r = amdgpu_bo_alloc_and_map_sync(device_handle,
>  				    ring_context->write_length * sizeof(uint32_t),
>  				    4096, AMDGPU_GEM_DOMAIN_GTT,
> @@ -345,7 +344,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
>  				 ring_context->write_length * sizeof(uint32_t));
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
>  	} else {
>  		free(ring_context->pm4);
>  		free(ring_context);
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index e4913c77d..718fcc0c4 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -464,6 +464,496 @@ x_compare_pattern(const struct amdgpu_ip_funcs *func,
>  	return ret;
>  }
>  
> +#ifdef AMDGPU_USERQ_ENABLED
> +static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
> +				  struct amdgpu_userq_bo *doorbell_bo,
> +				  unsigned int size, unsigned int domain)
> +{
> +	struct amdgpu_bo_alloc_request req = {0};
> +	amdgpu_bo_handle buf_handle;
> +	int r;
> +
> +	req.alloc_size = ALIGN(size, PAGE_SIZE);
> +	req.preferred_heap = domain;
> +	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
> +	igt_assert_eq(r, 0);
> +
> +	doorbell_bo->handle = buf_handle;
> +	doorbell_bo->size = req.alloc_size;
> +
> +	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
> +			      (void **)&doorbell_bo->ptr);
> +	igt_assert_eq(r, 0);
> +}
> +
> +int
> +amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> +			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> +			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> +			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
> +			   uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	struct amdgpu_bo_alloc_request request = {};
> +	amdgpu_bo_handle buf_handle;
> +	uint64_t vmc_addr;
> +	int r;
> +
> +	request.alloc_size = size;
> +	request.phys_alignment = alignment;
> +	request.preferred_heap = heap;
> +	request.flags = alloc_flags;
> +
> +	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_va_range_alloc(device_handle,
> +				  amdgpu_gpu_va_range_general,
> +				  size, alignment, 0, &vmc_addr,
> +				  va_handle, 0);
> +	if (r)
> +		goto error_va_alloc;
> +
> +	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
> +				 ALIGN(size, getpagesize()), vmc_addr,
> +				 AMDGPU_VM_PAGE_READABLE |
> +				 AMDGPU_VM_PAGE_WRITEABLE |
> +				 AMDGPU_VM_PAGE_EXECUTABLE |
> +				 mapping_flags,
> +				 AMDGPU_VA_OP_MAP,
> +				 timeline_syncobj_handle,
> +				 point, 0, 0);
> +	if (r)
> +		goto error_va_map;
> +
> +	if (cpu) {
> +		r = amdgpu_bo_cpu_map(buf_handle, cpu);
> +		if (r)
> +			goto error_cpu_map;
> +	}
> +
> +	*bo = buf_handle;
> +	*mc_address = vmc_addr;
> +
> +	return 0;
> +
> +error_cpu_map:
> +	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
> +error_va_map:
> +	amdgpu_va_range_free(*va_handle);
> +error_va_alloc:
> +	amdgpu_bo_free(buf_handle);
> +	return r;
> +}
> +
> +static void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle,
> +					amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
> +					uint64_t mc_addr, uint64_t size,
> +					uint32_t timeline_syncobj_handle,
> +					uint64_t point, uint64_t syncobj_handles_array,
> +					uint32_t num_syncobj_handles)
> +{
> +	amdgpu_bo_cpu_unmap(bo);
> +	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
> +				  timeline_syncobj_handle, point,
> +				  syncobj_handles_array, num_syncobj_handles);
> +	amdgpu_va_range_free(va_handle);
> +	amdgpu_bo_free(bo);
> +}
> +
> +int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> +				 uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
> +	int r;
> +
> +	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
> +				     &point, 1, flags);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
> +					    &point, 1, INT64_MAX,
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +					    NULL);
> +	if (r)
> +		igt_warn("Timeline timed out\n");
> +	return r;
> +}
> +
> +static void
> +amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> +			      unsigned int ip_type, uint64_t mc_address)
> +{
> +	int r;
> +	uint32_t control = ring_context->pm4_dw;
> +	uint32_t syncarray[1];
> +	struct drm_amdgpu_userq_signal signal_data;
> +	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
> +
> +	amdgpu_pkt_begin();
> +
> +	if (ip_type == AMD_IP_DMA) {
> +		/* For SDMA, we need to align the IB to 8 DW boundary */
> +		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
> +		for (unsigned int i = 0; i < nop_count; i++)
> +			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
> +		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
> +		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
> +		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
> +		amdgpu_pkt_add_dw(control); // IB length in DWORDS
> +		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
> +		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
> +		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
> +			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
> +		else
> +			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
> +	} else {
> +		/* Prepare the Indirect IB to submit the IB to user queue */
> +		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
> +		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> +		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
> +
> +		if (ip_type == AMD_IP_GFX)
> +			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
> +		else
> +			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
> +						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
> +
> +		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
> +
> +		/* empty dword is needed for fence signal pm4 */
> +		amdgpu_pkt_add_dw(0);
> +	}
> +#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
> +	asm volatile ("mfence" : : : "memory");
> +#endif
> +
> +	/* Below call update the wptr address so will wait till all writes are completed */
> +	amdgpu_pkt_end();
> +
> +#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
> +	asm volatile ("mfence" : : : "memory");
> +#endif
> +
> +	if (ip_type == AMD_IP_DMA)
> +		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
> +	/* Update the door bell */
> +	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
> +
> +	/* Add a fence packet for signal */
> +	syncarray[0] = ring_context->timeline_syncobj_handle;
> +	signal_data.queue_id = ring_context->queue_id;
> +	signal_data.syncobj_handles = (uintptr_t)syncarray;
> +	signal_data.num_syncobj_handles = 1;
> +	signal_data.bo_read_handles = 0;
> +	signal_data.bo_write_handles = 0;
> +	signal_data.num_bo_read_handles = 0;
> +	signal_data.num_bo_write_handles = 0;
> +
> +	r = amdgpu_userq_signal(device, &signal_data);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
> +				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> +	igt_assert_eq(r, 0);
> +}
> +
> +static void
> +amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			       unsigned int type)
> +{
> +	int r;
> +
> +	if (type > AMD_IP_DMA) {
> +		igt_info("Invalid IP not supported for UMQ Submission\n");
> +		return;
> +	}
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
> +	igt_assert_eq(r, 0);
> +
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> +					    ctxt->csa.va_handle,
> +					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
> +					    ctxt->shadow.va_handle,
> +					    ctxt->shadow.mc_addr, ctxt->info.gfx.shadow_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
> +					    ctxt->eop.va_handle,
> +					    ctxt->eop.mc_addr, 256,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_DMA:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> +					    ctxt->csa.va_handle,
> +					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	default:
> +		igt_info("IP invalid for cleanup\n");
> +	}
> +
> +	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* Clean up doorbell*/
> +	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(ctxt->doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* Clean up rptr wptr queue */
> +	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
> +				 ctxt->rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
> +				 ctxt->wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
> +				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
> +}
> +
> +static void
> +amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			      unsigned int type)
> +{
> +	int r;
> +	uint64_t gtt_flags = 0, queue_flags = 0;
> +	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
> +	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
> +	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
> +	void *mqd;
> +
> +	if (type > AMD_IP_DMA) {
> +		igt_info("Invalid IP not supported for UMQ Submission\n");
> +		return;
> +	}
> +
> +	if (ctxt->secure) {
> +		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
> +		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
> +	}
> +
> +	if (ctxt->priority)
> +		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
> +
> +	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->queue.handle, &ctxt->queue.ptr,
> +				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
> +				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
> +				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
> +					       ctxt->info.gfx.shadow_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->shadow.handle, NULL,
> +					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
> +					       ctxt->info.gfx.csa_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->csa.handle, NULL,
> +					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +
> +		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
> +		gfx_mqd.csa_va = ctxt->csa.mc_addr;
> +		mqd = &gfx_mqd;
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
> +					       ALIGNMENT,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->eop.handle, NULL,
> +					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +		compute_mqd.eop_va = ctxt->eop.mc_addr;
> +		mqd = &compute_mqd;
> +		break;
> +
> +	case AMD_IP_DMA:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
> +					       ctxt->info.gfx.csa_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->csa.handle, NULL,
> +					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +		sdma_mqd.csa_va = ctxt->csa.mc_addr;
> +		mqd = &sdma_mqd;
> +		break;
> +
> +	default:
> +		igt_info("Unsupported IP for UMQ submission\n");
> +		return;
> +
> +	}
> +
> +	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +					 ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
> +			      AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
> +
> +	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
> +	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
> +
> +	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
> +	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
> +
> +	/* get db bo handle */
> +	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
> +
> +	/* Create the Usermode Queue */
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, queue_flags, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, queue_flags, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_DMA:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, queue_flags, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	default:
> +		igt_info("Unsupported IP, failed to create user queue\n");
> +		return;
> +
> +	}
> +}
> +#else
> +int
> +amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> +			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> +			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> +			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
> +			   uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	return 0;
> +}
> +
> +int
> +amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> +	uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	return 0;
> +}
> +
> +static void
> +amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> +	unsigned int ip_type, uint64_t mc_address)
> +{
> +}
> +
> +static void
> +amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +	unsigned int type)
> +{
> +}
> +
> +static void
> +amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +	unsigned int type)
> +{
> +}
> +#endif
> +
>  static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
>  	.family_id = FAMILY_VI,
>  	.align_mask = 0xff,
> @@ -479,6 +969,9 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
>  	.compare_pattern = x_compare_pattern,
>  	.get_reg_offset = gfx_v8_0_get_reg_offset,
>  	.wait_reg_mem = gfx_ring_wait_reg_mem,
> +	.userq_create = amdgpu_user_queue_create,
> +	.userq_submit = amdgpu_user_queue_submit,
> +	.userq_destroy = amdgpu_user_queue_destroy,
>  };
>  
>  static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
> @@ -496,6 +989,9 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
>  	.compare_pattern = x_compare_pattern,
>  	.get_reg_offset = gfx_v8_0_get_reg_offset,
>  	.wait_reg_mem = sdma_ring_wait_reg_mem,
> +	.userq_create = amdgpu_user_queue_create,
> +	.userq_submit = amdgpu_user_queue_submit,
> +	.userq_destroy = amdgpu_user_queue_destroy,
>  };
>  
>  struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 2a4fa1742..b5731e13b 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -8,6 +8,8 @@
>  #define AMD_IP_BLOCKS_H
>  
>  #include <amdgpu_drm.h>
> +#include <amdgpu.h>
> +#include <time.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> @@ -32,6 +34,29 @@
>  #define   S_3F3_VALID_COMPUTE(x)		(((unsigned int)(x)&0x1) << 23)/* userqueue only */
>  #define   S_3F3_INHERIT_VMID_MQD_COMPUTE(x)	(((unsigned int)(x)&0x1) << 30)/* userqueue only */
>  
> +#ifndef PAGE_SIZE
> +#define PAGE_SIZE 4096
> +#endif
> +
> +#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
> +#define ALIGNMENT			4096
> +#define DOORBELL_INDEX			4
> +#define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
> +#define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
> +
> +#define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
> +	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
> +
> +#define amdgpu_pkt_add_dw(value) do { \
> +	*(ring_context->queue_cpu + \
> +	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
> +	= value; \
> +	__num_dw_written++;\
> +} while (0)
> +
> +#define amdgpu_pkt_end() \
> +	*ring_context->wptr_cpu += __num_dw_written
> +
>  enum amd_ip_block_type {
>  	AMD_IP_GFX = 0,
>  	AMD_IP_COMPUTE,
> @@ -202,6 +227,10 @@ struct amdgpu_ip_funcs {
>  	int (*get_reg_offset)(enum general_reg reg);
>  	int (*wait_reg_mem)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
>  
> +	/* userq functions */
> +	void (*userq_create)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
> +	void (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
> +	void (*userq_destroy)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
>  };
>  
>  extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
> @@ -280,4 +309,15 @@ get_pci_addr_from_fd(int fd, struct pci_addr *pci);
>  
>  bool
>  is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci);
> +
> +int
> +amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> +			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> +			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> +			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
> +			       uint32_t timeline_syncobj_handle, uint64_t point);
> +
> +int
> +amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> +				 uint32_t timeline_syncobj_handle, uint64_t point);
>  #endif
> diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
> index 882c5c18f..72ea3db6c 100644
> --- a/lib/amdgpu/amd_memory.c
> +++ b/lib/amdgpu/amd_memory.c
> @@ -25,8 +25,7 @@
>  
>  #include "amd_memory.h"
>  #include "amd_PM4.h"
> -#include "amd_userq.h"
> -
> +#include "amd_ip_blocks.h"
>  /**
>   *
>   * @param device_handle
> diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
> deleted file mode 100644
> index 43a2d10c5..000000000
> --- a/lib/amdgpu/amd_userq.c
> +++ /dev/null
> @@ -1,494 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright 2025 Advanced Micro Devices, Inc.
> - */
> -
> -#include "amd_userq.h"
> -#include "amd_memory.h"
> -#include "amd_PM4.h"
> -#include "amd_sdma.h"
> -#include "ioctl_wrappers.h"
> -
> -#ifdef AMDGPU_USERQ_ENABLED
> -static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
> -				  struct amdgpu_userq_bo *doorbell_bo,
> -				  unsigned int size, unsigned int domain)
> -{
> -	struct amdgpu_bo_alloc_request req = {0};
> -	amdgpu_bo_handle buf_handle;
> -	int r;
> -
> -	req.alloc_size = ALIGN(size, PAGE_SIZE);
> -	req.preferred_heap = domain;
> -	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
> -	igt_assert_eq(r, 0);
> -
> -	doorbell_bo->handle = buf_handle;
> -	doorbell_bo->size = req.alloc_size;
> -
> -	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
> -			      (void **)&doorbell_bo->ptr);
> -	igt_assert_eq(r, 0);
> -}
> -
> -int
> -amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> -			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> -			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> -			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
> -			   uint32_t timeline_syncobj_handle, uint64_t point)
> -{
> -	struct amdgpu_bo_alloc_request request = {};
> -	amdgpu_bo_handle buf_handle;
> -	uint64_t vmc_addr;
> -	int r;
> -
> -	request.alloc_size = size;
> -	request.phys_alignment = alignment;
> -	request.preferred_heap = heap;
> -	request.flags = alloc_flags;
> -
> -	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> -	if (r)
> -		return r;
> -
> -	r = amdgpu_va_range_alloc(device_handle,
> -				  amdgpu_gpu_va_range_general,
> -				  size, alignment, 0, &vmc_addr,
> -				  va_handle, 0);
> -	if (r)
> -		goto error_va_alloc;
> -
> -	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
> -				 ALIGN(size, getpagesize()), vmc_addr,
> -				 AMDGPU_VM_PAGE_READABLE |
> -				 AMDGPU_VM_PAGE_WRITEABLE |
> -				 AMDGPU_VM_PAGE_EXECUTABLE |
> -				 mapping_flags,
> -				 AMDGPU_VA_OP_MAP,
> -				 timeline_syncobj_handle,
> -				 point, 0, 0);
> -	if (r)
> -		goto error_va_map;
> -
> -	if (cpu) {
> -		r = amdgpu_bo_cpu_map(buf_handle, cpu);
> -		if (r)
> -			goto error_cpu_map;
> -	}
> -
> -	*bo = buf_handle;
> -	*mc_address = vmc_addr;
> -
> -	return 0;
> -
> -error_cpu_map:
> -	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
> -error_va_map:
> -	amdgpu_va_range_free(*va_handle);
> -error_va_alloc:
> -	amdgpu_bo_free(buf_handle);
> -	return r;
> -}
> -
> -static void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle,
> -					amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
> -					uint64_t mc_addr, uint64_t size,
> -					uint32_t timeline_syncobj_handle,
> -					uint64_t point, uint64_t syncobj_handles_array,
> -					uint32_t num_syncobj_handles)
> -{
> -	amdgpu_bo_cpu_unmap(bo);
> -	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
> -				  timeline_syncobj_handle, point,
> -				  syncobj_handles_array, num_syncobj_handles);
> -	amdgpu_va_range_free(va_handle);
> -	amdgpu_bo_free(bo);
> -}
> -
> -int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> -				 uint32_t timeline_syncobj_handle, uint64_t point)
> -{
> -	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
> -	int r;
> -
> -	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
> -				     &point, 1, flags);
> -	if (r)
> -		return r;
> -
> -	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
> -					    &point, 1, INT64_MAX,
> -					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> -					    NULL);
> -	if (r)
> -		igt_warn("Timeline timed out\n");
> -	return r;
> -}
> -
> -void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> -			      unsigned int ip_type, uint64_t mc_address)
> -{
> -	int r;
> -	uint32_t control = ring_context->pm4_dw;
> -	uint32_t syncarray[1];
> -	struct drm_amdgpu_userq_signal signal_data;
> -	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
> -
> -	amdgpu_pkt_begin();
> -
> -	if (ip_type == AMD_IP_DMA) {
> -		/* For SDMA, we need to align the IB to 8 DW boundary */
> -		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
> -		for (unsigned int i = 0; i < nop_count; i++)
> -			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
> -		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
> -		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
> -		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
> -		amdgpu_pkt_add_dw(control); // IB length in DWORDS
> -		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
> -		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
> -		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
> -			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
> -		else
> -			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
> -	} else {
> -		/* Prepare the Indirect IB to submit the IB to user queue */
> -		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
> -		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> -		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
> -
> -		if (ip_type == AMD_IP_GFX)
> -			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
> -		else
> -			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
> -						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
> -
> -		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
> -
> -		/* empty dword is needed for fence signal pm4 */
> -		amdgpu_pkt_add_dw(0);
> -	}
> -#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
> -	asm volatile ("mfence" : : : "memory");
> -#endif
> -
> -	/* Below call update the wptr address so will wait till all writes are completed */
> -	amdgpu_pkt_end();
> -
> -#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
> -	asm volatile ("mfence" : : : "memory");
> -#endif
> -
> -	if (ip_type == AMD_IP_DMA)
> -		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
> -	/* Update the door bell */
> -	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
> -
> -	/* Add a fence packet for signal */
> -	syncarray[0] = ring_context->timeline_syncobj_handle;
> -	signal_data.queue_id = ring_context->queue_id;
> -	signal_data.syncobj_handles = (uintptr_t)syncarray;
> -	signal_data.num_syncobj_handles = 1;
> -	signal_data.bo_read_handles = 0;
> -	signal_data.bo_write_handles = 0;
> -	signal_data.num_bo_read_handles = 0;
> -	signal_data.num_bo_write_handles = 0;
> -
> -	r = amdgpu_userq_signal(device, &signal_data);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
> -				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> -	igt_assert_eq(r, 0);
> -}
> -
> -void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -			       unsigned int type)
> -{
> -	int r;
> -
> -	if (type > AMD_IP_DMA) {
> -		igt_info("Invalid IP not supported for UMQ Submission\n");
> -		return;
> -	}
> -
> -	/* Free the Usermode Queue */
> -	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
> -	igt_assert_eq(r, 0);
> -
> -	switch (type) {
> -	case AMD_IP_GFX:
> -		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> -					    ctxt->csa.va_handle,
> -					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
> -					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> -					    0, 0);
> -
> -		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
> -					    ctxt->shadow.va_handle,
> -					    ctxt->shadow.mc_addr, ctxt->info.gfx.shadow_size,
> -					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> -					    0, 0);
> -
> -		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> -						 ctxt->point);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	case AMD_IP_COMPUTE:
> -		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
> -					    ctxt->eop.va_handle,
> -					    ctxt->eop.mc_addr, 256,
> -					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> -					    0, 0);
> -
> -		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> -						 ctxt->point);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	case AMD_IP_DMA:
> -		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> -					    ctxt->csa.va_handle,
> -					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
> -					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> -					    0, 0);
> -
> -		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> -						 ctxt->point);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	default:
> -		igt_info("IP invalid for cleanup\n");
> -	}
> -
> -	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
> -	igt_assert_eq(r, 0);
> -
> -	/* Clean up doorbell*/
> -	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_free(ctxt->doorbell.handle);
> -	igt_assert_eq(r, 0);
> -
> -	/* Clean up rptr wptr queue */
> -	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
> -				 ctxt->rptr.mc_addr, 8);
> -
> -	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
> -				 ctxt->wptr.mc_addr, 8);
> -
> -	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
> -				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
> -}
> -
> -void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -			      unsigned int type)
> -{
> -	int r;
> -	uint64_t gtt_flags = 0, queue_flags = 0;
> -	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
> -	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
> -	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
> -	void *mqd;
> -
> -	if (type > AMD_IP_DMA) {
> -		igt_info("Invalid IP not supported for UMQ Submission\n");
> -		return;
> -	}
> -
> -	if (ctxt->secure) {
> -		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
> -		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
> -	}
> -
> -	if (ctxt->priority)
> -		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
> -
> -	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
> -				       ALIGNMENT,
> -				       AMDGPU_GEM_DOMAIN_GTT,
> -				       gtt_flags,
> -				       AMDGPU_VM_MTYPE_UC,
> -				       &ctxt->queue.handle, &ctxt->queue.ptr,
> -				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
> -				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> -				       ALIGNMENT,
> -				       AMDGPU_GEM_DOMAIN_GTT,
> -				       gtt_flags,
> -				       AMDGPU_VM_MTYPE_UC,
> -				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
> -				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
> -				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> -				       ALIGNMENT,
> -				       AMDGPU_GEM_DOMAIN_GTT,
> -				       gtt_flags,
> -				       AMDGPU_VM_MTYPE_UC,
> -				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
> -				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
> -				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -	igt_assert_eq(r, 0);
> -
> -	switch (type) {
> -	case AMD_IP_GFX:
> -		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
> -					       ctxt->info.gfx.shadow_alignment,
> -					       AMDGPU_GEM_DOMAIN_GTT,
> -					       gtt_flags,
> -					       AMDGPU_VM_MTYPE_UC,
> -					       &ctxt->shadow.handle, NULL,
> -					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
> -					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -		igt_assert_eq(r, 0);
> -
> -		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
> -					       ctxt->info.gfx.csa_alignment,
> -					       AMDGPU_GEM_DOMAIN_GTT,
> -					       gtt_flags,
> -					       AMDGPU_VM_MTYPE_UC,
> -					       &ctxt->csa.handle, NULL,
> -					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> -					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -		igt_assert_eq(r, 0);
> -
> -		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
> -		gfx_mqd.csa_va = ctxt->csa.mc_addr;
> -		mqd = &gfx_mqd;
> -		break;
> -
> -	case AMD_IP_COMPUTE:
> -		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
> -					       ALIGNMENT,
> -					       AMDGPU_GEM_DOMAIN_GTT,
> -					       gtt_flags,
> -					       AMDGPU_VM_MTYPE_UC,
> -					       &ctxt->eop.handle, NULL,
> -					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
> -					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -		igt_assert_eq(r, 0);
> -		compute_mqd.eop_va = ctxt->eop.mc_addr;
> -		mqd = &compute_mqd;
> -		break;
> -
> -	case AMD_IP_DMA:
> -		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
> -					       ctxt->info.gfx.csa_alignment,
> -					       AMDGPU_GEM_DOMAIN_GTT,
> -					       gtt_flags,
> -					       AMDGPU_VM_MTYPE_UC,
> -					       &ctxt->csa.handle, NULL,
> -					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> -					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> -		igt_assert_eq(r, 0);
> -		sdma_mqd.csa_va = ctxt->csa.mc_addr;
> -		mqd = &sdma_mqd;
> -		break;
> -
> -	default:
> -		igt_info("Unsupported IP for UMQ submission\n");
> -		return;
> -
> -	}
> -
> -	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> -					 ctxt->point);
> -	igt_assert_eq(r, 0);
> -
> -	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
> -			      AMDGPU_GEM_DOMAIN_DOORBELL);
> -
> -	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
> -
> -	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
> -	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
> -
> -	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
> -	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
> -
> -	/* get db bo handle */
> -	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
> -
> -	/* Create the Usermode Queue */
> -	switch (type) {
> -	case AMD_IP_GFX:
> -		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
> -					    ctxt->db_handle, DOORBELL_INDEX,
> -					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> -					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> -					    mqd, queue_flags, &ctxt->queue_id);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	case AMD_IP_COMPUTE:
> -		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
> -					    ctxt->db_handle, DOORBELL_INDEX,
> -					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> -					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> -					    mqd, queue_flags, &ctxt->queue_id);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	case AMD_IP_DMA:
> -		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
> -					    ctxt->db_handle, DOORBELL_INDEX,
> -					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> -					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> -					    mqd, queue_flags, &ctxt->queue_id);
> -		igt_assert_eq(r, 0);
> -		break;
> -
> -	default:
> -		igt_info("Unsupported IP, failed to create user queue\n");
> -		return;
> -
> -	}
> -}
> -#else
> -int
> -amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> -			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> -			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> -			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
> -			   uint32_t timeline_syncobj_handle, uint64_t point)
> -{
> -	return 0;
> -}
> -
> -int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> -	uint32_t timeline_syncobj_handle, uint64_t point)
> -{
> -	return 0;
> -}
> -
> -void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> -	unsigned int ip_type, uint64_t mc_address)
> -{
> -}
> -
> -void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -	unsigned int type)
> -{
> -}
> -
> -void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -	unsigned int type)
> -{
> -}
> -
> -#endif
> diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
> deleted file mode 100644
> index b29e97ccf..000000000
> --- a/lib/amdgpu/amd_userq.h
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -/* SPDX-License-Identifier: MIT
> - * Copyright 2025 Advanced Micro Devices, Inc.
> - */
> -
> -#ifndef _AMD_USER_QUEUE_
> -#define _AMD_USER_QUEUE_
> -
> -#include <amdgpu_drm.h>
> -#include <amdgpu.h>
> -#include <time.h>
> -#include "amd_ip_blocks.h"
> -
> -
> -#ifndef PAGE_SIZE
> -#define PAGE_SIZE 4096
> -#endif
> -
> -#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
> -#define ALIGNMENT			4096
> -#define DOORBELL_INDEX			4
> -#define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
> -#define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
> -
> -#define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
> -	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
> -
> -#define amdgpu_pkt_add_dw(value) do { \
> -	*(ring_context->queue_cpu + \
> -	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
> -	= value; \
> -	__num_dw_written++;\
> -} while (0)
> -
> -#define amdgpu_pkt_end() \
> -	*ring_context->wptr_cpu += __num_dw_written
> -
> -int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> -			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> -			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> -			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
> -			       uint32_t timeline_syncobj_handle, uint64_t point);
> -
> -int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> -				 uint32_t timeline_syncobj_handle, uint64_t point);
> -
> -void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -			      unsigned int ip_type);
> -
> -void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> -			       unsigned int ip_type);
> -
> -void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> -			      unsigned int ip_type, uint64_t mc_address);
> -
> -#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 5e4247aad..b0505190b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -170,8 +170,7 @@ if libdrm_amdgpu.found()
>  		'amdgpu/amd_mem_leak.c',
>  		'amdgpu/amd_mmd_shared.c',
>  		'amdgpu/amd_jpeg_shared.c',
> -		'amdgpu/amd_vcn_shared.c',
> -		'amdgpu/amd_userq.c'
> +		'amdgpu/amd_vcn_shared.c'
>  	]
>  	if libdrm_amdgpu.version().version_compare('> 2.4.99')
>  		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 04e8d62e5..8c6b466ce 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -13,7 +13,6 @@
>  #include "lib/amdgpu/amd_gfx.h"
>  #include "lib/amdgpu/amd_shaders.h"
>  #include "lib/amdgpu/amd_dispatch.h"
> -#include "lib/amdgpu/amd_userq.h"
>  
>  #define BUFFER_SIZE (8 * 1024)
>  
> @@ -509,7 +508,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  	igt_assert(ring_context);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_create(device_handle, ring_context, ip_block->type);
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
>  	} else {
>  		r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
>  		igt_assert_eq(r, 0);
> @@ -608,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  
>  	if (user_queue) {
>  		ring_context->pm4_dw = ib_info.size;
> -		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
> +		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
>  					 ib_result_mc_address);
>  	} else {
>  		r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
> @@ -648,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  
>  	if (user_queue) {
>  		ring_context->pm4_dw = ib_info.size;
> -		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
> +		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
>  					ib_info.ib_mc_address);
>  	} else {
>  		r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
> @@ -680,7 +679,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  				 ib_result_mc_address, const_alignment);
>  
>  	if (user_queue) {
> -		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
>  	} else {
>  		amdgpu_cs_ctx_free(context_handle[0]);
>  		amdgpu_cs_ctx_free(context_handle[1]);
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 96a385413..0f2c33168 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -12,7 +12,6 @@
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_ip_blocks.h"
>  #include "lib/amdgpu/amd_memory.h"
> -#include "lib/amdgpu/amd_userq.h"
>  
>  static void amdgpu_cs_sync(amdgpu_context_handle context,
>  			   unsigned int ip_type,
> @@ -54,12 +53,14 @@ static void nop_cs(amdgpu_device_handle device,
>  	amdgpu_bo_list_handle bo_list;
>  	amdgpu_va_handle va_handle;
>  	struct amdgpu_ring_context *ring_context;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
>  
> +	ip_block = get_ip_block(device, ip_type);
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
>  	if (user_queue)
> -		amdgpu_user_queue_create(device, ring_context, ip_type);
> +		ip_block->funcs->userq_create(device, ring_context, ip_type);
>  
>  	r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
>  					 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
> @@ -107,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
>  		igt_until_timeout(timeout) {
>  			if (user_queue) {
>  				ring_context->pm4_dw = ib_info.size;
> -				amdgpu_user_queue_submit(device, ring_context, ip_type,
> +				ip_block->funcs->userq_submit(device, ring_context, ip_type,
>  							 ib_info.ib_mc_address);
>  				igt_assert_eq(r, 0);
>  			} else {
> @@ -140,7 +141,7 @@ static void nop_cs(amdgpu_device_handle device,
>  	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
>  				 ib_result_mc_address, 4096);
>  	if (user_queue)
> -		amdgpu_user_queue_destroy(device, ring_context, ip_type);
> +		ip_block->funcs->userq_destroy(device, ring_context, ip_type);
>  
>  	free(ring_context);
>  }
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 19dff1dc0..3456f42c8 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -9,7 +9,6 @@
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
> -#include "lib/amdgpu/amd_userq.h"
>  
>  #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
>  #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
