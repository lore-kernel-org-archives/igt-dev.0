Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A746CA0EFF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 00:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7110E002;
	Thu, 28 Aug 2025 00:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ytxdaYRn";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93B10E002
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 00:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0WdmyD9Qr9R4O2UgvIyhDGWPq1JIHUpEkJUb06qzJUI9pebX8GMa+S30qa6TlIjM4B/KwexBiooPwy7Ygolix5ReGrRAE6DoITTbCKXVczYqkm+1fNEJWC+GesJ2nOM+jyVM777YyIfxLc94XpcfopkSxMW2mpVeYtgZhr6XjhAXWfXFYuqQ6WpRzoRCsZHsl2MLYPJpAW1ZLxRtyXYLwPJ80KvZbHkLO+bLpw54Yt30eksJvlBn3TvHQ95MJrEBA8/zP+1Oe6w03WwHsoBlinNAsTw0810Bn8nGPyQuM6tvknzy3z61WB9vL51ep6nU/QUrKjUzG3HB0zHRpmbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqDH0flfT36mEbTl4tc3zYRaccPiS7BNWwN3DN/fNzI=;
 b=pRcEXcOk8e97fNDmqo2qLT6D0w2q6GBtVghsEG2KoKqRdeIfN8uUV7Aj5aw/UWo1ZLiwl6KvZ1RrD8kyJ9XpwkASpdi54eInkH2i/bMhXUkDX6uOtfoUpq97eBdY4RjPaTfEdbR2mEuUJ2YfvQ6EZTj4/bjKlqtI+/dB7rn12S0KwMVAbeoB3t6urSh3tJqzSMYYk6S1uMb1LSpKMcXwkdU/uHBLAM/Ba3IVZ24X7Ss4FF0Gj6nw69o4wt0c8UYBd/4NxrSH1LDnl3bAei3yRwiaZSulc0SEXIyKVROODVyY88mmg8zy0WAFww7Uzkmj9I81mfPWTgdScDKKv+C8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqDH0flfT36mEbTl4tc3zYRaccPiS7BNWwN3DN/fNzI=;
 b=ytxdaYRnfy0YvdyigaLguYWX8lrrpg6iHyjglhuhFAEGM7hl/SlpMqfgIvkrJBfTYggFotKuGby4jfx04Zmx4exVd9ySX4NWp5cq5ogxXY8AL+5yAoxvI58aJukADhDivF008Ma9NJMimuZyWIPk5Avdt7X5ZIIocSV+JWWMg+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 00:11:27 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 00:11:27 +0000
Message-ID: <f96ca884-1311-4aa1-b32b-7b031a1bcadc@amd.com>
Date: Wed, 27 Aug 2025 20:11:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: unify SDMA protected fence sub-opcode
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250827070348.1793095-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250827070348.1793095-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::18) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 259fe329-d3d4-4510-ef51-08dde5c76e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlNOHIzVTFjRktVWHNTN2o5cEkzUWpqNzFkVFlHSTlqanhBUkRQM1JEQVo0?=
 =?utf-8?B?TVVMMWJHZ0dtSVNTakJWZTBCSU42U3JDMmdtZURqVUdpMCsvczRiSnR4WlMx?=
 =?utf-8?B?NGo5SkhwSm16OVdoR2k2czA4b3dydlJ3YXl6UmVJTVQ2UUgzQTNTbC9zTk1a?=
 =?utf-8?B?SHduYTdNc00zQjJtNHY4MFozZWlvTTVlcHFBRUl0RXRSdXcyNTVxYlZsTERl?=
 =?utf-8?B?R2hyWFZzdG5yV1k4c0I2RXBpOENSLytIbFlzc1QyZnQyM1Awall6WUM3Tko0?=
 =?utf-8?B?L3JZakpGc2szQmtYZkliMkFZdjh6UDVDcURKTzZ5aERXZzlWcTc0SUVvL2ZD?=
 =?utf-8?B?QjAzWk9IU1FVTEc5Tkk3WEtOWERoSTIyRjAzUE5mTXBpS2g2THBZclBNQzRs?=
 =?utf-8?B?aTRwQXdWb3RybzZVQ0xBcWZTNVdPWm5UdTJTdTFwMTExQUtKaFcwTWRIZEpY?=
 =?utf-8?B?WWwyeGxOU3Vqa2pXMmlKYTJkOFJpTUo5b0cwcHhxSmN4dzRXSU56R05FTC9C?=
 =?utf-8?B?bmNrK25saUdHT3NFKzVMTTNTN2ZHWkd6NVFVNEpuWkFJdkV6SFgwVUVZY1d3?=
 =?utf-8?B?VEMvdVAwSXY4WTRYRTJ3QVNrWG5xWGthU3Y2TVdDMVAwYzRyckt2VHlQNmVO?=
 =?utf-8?B?Y3h4RU9uT3owSnFJWjhwV3dMRHpreG9ONFF0djNaVnRlempUd0tKMHlzazFK?=
 =?utf-8?B?cjFrckc1Qm5WQ1IwcWQzYUg5TllwWkd6M2hzWjVMUzNkT0JuTVlzQWZ3ZU1n?=
 =?utf-8?B?TWZZWmxsbjRuSEJLdW4zUU10eU4vUWpGcUdHWVVVUTNiR0ZmR0ZmajVJTEUy?=
 =?utf-8?B?a3RqQ1gwdnFsS2o5WUs5b2xKWndoaVVYbUdPWUdqNTBZKy8rL0NpQXpPTkV3?=
 =?utf-8?B?VmNpQmVvNS93NmVRbDB0ZmFQMVV5elJEeTJZa21nS0k1cnRtcmwxTnVsL2p1?=
 =?utf-8?B?MGtreGwwa2JXZzV1SEdGN0NrdU1Vbnhab2ZLdk9FSE1OYzVMSUFzQ0xxSlRY?=
 =?utf-8?B?R05vNVhpaTFyQXVNUDRHYjVGdTJ2cFVNbHJJRlJNYm0rR1lyTmhKYUlselZJ?=
 =?utf-8?B?RzYxdVc3cCttNFZxK0xlZ1lHYjY1MStxQ1FBWXFJamRsY3RZMEp5TTE0bmRm?=
 =?utf-8?B?TEVkWnpKek1oVzdXWkRLeDA2THFxMis1aEtCdHVBaVdMc0xsYjRRbTBaUFpi?=
 =?utf-8?B?UklsTTVWSU1iVmxYNEJKUWkrR2FJZll4TGE1SWcrSHVlcis4SjBCWVVWMmMy?=
 =?utf-8?B?T2lYcTI0d3U0TTRLdkJraFliSk14M1JETFFpR0FNd2p4dnBNcllINStsZ3Jr?=
 =?utf-8?B?cTVNbnVSL0JPeWxqTWtJSHZlMkwxalFoaGtHVUl2c0Z5b0N0U0sxT1pCS0Jt?=
 =?utf-8?B?Yk1paWQwd0NadklRaE04eGwxUUtUVmJYMHZRWUJNSVcxRTJsSDUxUEV2SXgz?=
 =?utf-8?B?c1ZwajI1QkMvaTgxWE1MUkl5MjQ1TnJqTGJObGZjUDJ5cDdmeXVlTXpBcWlI?=
 =?utf-8?B?MSt3c0w4MmRIZkd3VHh6K1JlbUpEa2JBeW1QKzFXRVRGMEtqcEFEVFhlRWNY?=
 =?utf-8?B?aUZNaGRldXo1SDBQbm13cEg4TkIwdkticHdQNnN2YzBVVWdlbGRpYmE4Y04v?=
 =?utf-8?B?bXFsL0pja3I1cVRWM0l6YmlOYjNYclJCVkZpb1RQWFcxcEM3MmFTK2xyL21i?=
 =?utf-8?B?UW1IeXlQWVdzWlRZenFyZkxPcndQVUlEcHZrS1Z3b2xFOFcxbFBNU2FTa2tC?=
 =?utf-8?B?azNPaGYwaDlpdU5HdjllSVVHVkJ0TGxlVzZ0TWtEWmVIcTlrY1FzZEpXTEkw?=
 =?utf-8?B?MUxHVlQ2MFdiQ1FUVzJZM2t0L0hDWlUwTGpGWG41dkNYc0ladXhVSnM3NlB6?=
 =?utf-8?B?eDVPNWJxVXFScnRScHFBc1JpUVRJUUt2bVgxMTlzOEhsZE5YQjRpL05sYTZk?=
 =?utf-8?Q?rKh6V5aRifI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZnN0p2Z0dsS2hKUWpWV1FXRWkvOVl3cW9HSkVpSDlzMWZ0aDVIMHdSY1dN?=
 =?utf-8?B?dDh3UXNDMlVYWnNOUWRMN09odW9Ea29MUlM0K0xCNkowVUU4Tk8xaFNPQVpQ?=
 =?utf-8?B?L1kvNUlWMkt3MHZ4VDBYUjBKU011ZEFmTCsxSHFpbDQyOHhzbFp6R25uL2Rv?=
 =?utf-8?B?ak9vaVRJT1JWT3UzeU1QSWtvZkZva3B0TUtXd0R4TkxsUm54cjB5QnlhTFZv?=
 =?utf-8?B?SW12cFlDbytKdG83Yi90c2RrV3draXVSTGx1ek05a2lzb3dFWUc1aEFOOEJv?=
 =?utf-8?B?c2tFSkV1M2FPdVNzcE4xaFZoTmEvaXB5T3BtUUpzb1hSblpGemc1dHhpSFNh?=
 =?utf-8?B?TWFuZGw5RzM2QTFEdkExKy94Sk02QzNBSW5UYUNBTXJ1ODZCL3lZT3d4aUp4?=
 =?utf-8?B?TzFSMXNwNndtRVVaV21NdEZjUzBKV0hnWE1rMTRZMXpKbktWd1o3RWQ5bFRo?=
 =?utf-8?B?M2U5Z1BkQWNyZmdCU0h1djZGKzRSMmczeWYrOUpRbEZHSUZ4Yis4NUlvbFR4?=
 =?utf-8?B?WjZpeFFaZlFQVHM4alU1RTIxY2NIZW1WbzBLWmlwaW5oS1RlMkFSU0FpeXE4?=
 =?utf-8?B?M3V6R2JmNlhwcm02djVOMGY3eFhFQkJNeUdlZnplZzZsNXE0VnF2dzdzTzhN?=
 =?utf-8?B?NW1oWjhCVXY2N0hqc2k1ME1SL1oyYWtDVTRydlhHVUFCUk0yT1loanZESXZw?=
 =?utf-8?B?MnBaY1RJbkFVOVF2WlYzaTBGb09SMHdyRDJBQnhpYzlPUkI5V2VLT2FDTHg2?=
 =?utf-8?B?K3c2c2k4TWhZWVppQWZGVW85akJZUFNNOUkrSS9yQnFiVGI4VkpqemFDMU1T?=
 =?utf-8?B?cC8yNGMvWGpUY1pFTVNiOWhJcWsvRnkzVHJZN3lUV0ROZ0Q5dHRpRyttSWwz?=
 =?utf-8?B?clpvUzlsYm01QUVQZjJKc0kySktOaWFBSm56QlVBamlUZlh0ZTRhaVh5Z0hu?=
 =?utf-8?B?REk1TzhPeitDKzFhWHRZcEgvMXJSYWh4bTNoUnZpREkrMzF3NTEyRitINjNz?=
 =?utf-8?B?d05FVHJ6TVJaaXorOWIzaG92eURqTTVWK2VjRFJlQlJ5T2ZVSllEN2Z2WjJN?=
 =?utf-8?B?UG9DekJFSkpjb21Icmt5d3E2OHM0WjlGZlh6bm9wQlNqN3lmUTg1Um9YU2ZV?=
 =?utf-8?B?bWVYWGZsY21JbVh1QlUxQ2RsMzZKV1dKMDI3Z0FkU0RQTG1GZnNlSTVpdG9i?=
 =?utf-8?B?YjZvMHl0QThFbHp4Y0dnV0g2MFovNFc0dXNNUUxNbWtTZGkxK0dJOXZudExq?=
 =?utf-8?B?UDlUenlGOU5aNk5GSFNLVm51MWsybkt2aEI1S3NEWkp0Z1ZjcS9DcTM5Wk14?=
 =?utf-8?B?bDA1VkIwT282R1BtRXNBTCt1dFRQVGk1U0JtNDZDZTBNTmNoZUFMR3JwOWZP?=
 =?utf-8?B?TnYrQ0tlTnhxTjE0WXBIT1BicVBSa21vUXR6aHpZaGxJc3IydmgwY2NMMWI0?=
 =?utf-8?B?U2czR1JDSU5IM2tQYzlsMWszQTZuSUhVaGQ3eTdhSEpKNU5WUDJlU2JDenJm?=
 =?utf-8?B?eDVDVzRnTDh6NmNZTkRUNHZxNkxoUzBwRWNqUmVQOWVPQnFDQXNEY0NFMndW?=
 =?utf-8?B?RTJaNUgyTGhmWW1MQXE5My9VamEwMjArYVFTSy9wRzB2TVloYUhoL2p2amwv?=
 =?utf-8?B?R2lSZUFxKzJ0WTdkaFZBd0Z0ZnJ4UllyWXlsSGRkbDNzV2p6NjNFZEltUzZV?=
 =?utf-8?B?UDNXME9Jd2h3TGg1b2RWR1pselM1QkxGMEQ4RGZkZkcxNkdqdGpBdlhWbFQ4?=
 =?utf-8?B?cE5uNnBRV1c0NFoxUExBejgwcDNLakp2amtPbS9PbWY3ZkF1OXVoVG4wVXdK?=
 =?utf-8?B?Y0Jnc3MwdThIN2svTHFrMlJtOHRjOVE1RkhOR2t2d1A5dHdpaitXY0wrcHdC?=
 =?utf-8?B?WDlqYkVqQ21UV2tOY2UxdlB1TUJTQzdoRnJlVFpuRjloSGR4TkJGRVBiaDMx?=
 =?utf-8?B?enNpblJndy9zRk9MSEdEU0hod25TQmZJeG1MUHdDNDhSQ2FKUWpqQkVqQWpT?=
 =?utf-8?B?RzhOMUY4d0IzejQ2b2VSMWY3UG9aK3VOQm9ETUsyVlNlYkN5M1dyK2JwSkR0?=
 =?utf-8?B?S1RwNnkxS2krMk91WlAwSkMvL1ZFcDE5U1ppaFN3R29CemRMYmVXb0JvZXMw?=
 =?utf-8?Q?u6UFs/qxr+S7BIw4mgmz4ws1c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259fe329-d3d4-4510-ef51-08dde5c76e9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:11:27.6678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N40P4ppM5RRTdMZSgd7Zybl9dQOoWcO0AocSb3hdi8naZJVPR3sdrGYqQg+DLTkA1XqM1gNiPWwbgXxe7p0Mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-08-27 03:03, Jesse.Zhang wrote:
> Consolidate the SDMA protected fence sub-opcode definitions across
> IP versions by removing the version-specific SDMA6_SUB_OP_PROTECTED_FENCE
> and SDMA7_SUB_OP_PROTECTED_FENCE values. A single unified value,
> SDMA_SUB_OP_PROTECTED_FENCE (0x3), is now used for all SDMA versions.
>
> This change is made possible because the latest SDMA firmware versions
> have unified the SDMA_SUBOP_PROTECTED_FENCE_SIGNAL value across both
> SDMA6.x and SDMA7.x hardware.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 5 +----
>  lib/amdgpu/amd_sdma.h      | 3 +--
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 6955ba7dc..296c45de8 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -605,10 +605,7 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_pkt_add_dw(control); // IB length in DWORDS
>  		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
>  		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
> -		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
> -			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
> -		else
> -			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
> +		amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA_SUB_OP_PROTECTED_FENCE, 0));
>  	} else {
>  		/* Prepare the Indirect IB to submit the IB to user queue */
>  		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
> diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
> index 2a9339cfb..4a6342bbd 100644
> --- a/lib/amdgpu/amd_sdma.h
> +++ b/lib/amdgpu/amd_sdma.h
> @@ -105,7 +105,6 @@
>  #define SDMA_NOP  0x0
>  #define SDMA_OP_INDIRECT                                0x4
>  #define SDMA_OP_PROTECTED_FENCE             0x5
> -#define SDMA6_SUB_OP_PROTECTED_FENCE             0x1
> -#define SDMA7_SUB_OP_PROTECTED_FENCE             0x3
> +#define SDMA_SUB_OP_PROTECTED_FENCE             0x3
>  
>  #endif
