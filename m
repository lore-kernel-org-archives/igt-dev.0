Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D93C54747
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 01:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AED310E00F;
	Wed, 28 Aug 2024 01:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uzeXX2Ft";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C7610E00F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 01:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke/TQM/6UpLQsS6FUt78za/oznnWAVwOd6E1u36JZXyhAnKP7uQsMQUYtkN9sYUeLx8aMg4VB7dep3Y8lqcMfn/b3H07IQ1+vmfP89rup+etyvz5f4IVNFkhZHLckFutBrHRQKsPdiThCePXreQhhSvOSjl6Bk+gbC6I+hSvYxHywT3qOhJ80+Y13t7YMxEedgP4m2EZ3Y6FNt3YCkNWku6XtxY/22pUMdb3hkvt1BIpv8/wh9unQCQrUpiOUsde/KWkwQQC91/7MVXMkHixZXj8lRnvp5MCtuzhbA8zutIkzhSAuVLWgTbp4DqDy77u0zZ+ghnri8eERsC8+c2+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/eFZ2YGsu1TyncKycIrdtW+fM86HRy6pDA2AcLoFLQ=;
 b=QzKTdI+wG47oU124CUGKNjdwgXLu0hy+Vzb8dqfTvdup+ZsO7/Tjd+/wYxKzDS4UCfvEJHcL7Mx1rSkdQ9G0AyoEmRetJwrDslmawQgVy+trjNP4zM+M+AKH3s427pXbfa1u72cowHCLMpt3htsFwT4khiZt+SXG3HxTcUHIiJ8o8q+S+2udYOzQ22xj2fU/jktjkxzNXGJqkXJO+gilANnkQLqKVRELwnrpQeibIvQ79s1F5sEefUrPNThOFdZCTbX7CZwY86CprDcIZKpjDst1bXRHPRUqvPc2OdcRNbASZpWIaDguZ7i5ScGSTfsuRwDrPeGGm/WTiJckdDEJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/eFZ2YGsu1TyncKycIrdtW+fM86HRy6pDA2AcLoFLQ=;
 b=uzeXX2FtItGqHI6Z912+VmGatfVQ+MuFoLrkLQBZJRqkanML3cWbXNFBbBA6WPatkN/d+uz7WzUQjIhqDGaIDbB8NXaetmOSYlS5sGSpgHCxPFAKiV9bxqVsGtvkdZChD8KLfxl953VftisP04bJvggg9GSAB0mi9+r5kM21//E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 01:50:43 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 01:50:42 +0000
Message-ID: <b19ad831-f022-4d2a-b3bb-e786a43e771a@amd.com>
Date: Tue, 27 Aug 2024 21:50:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue
 test
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20240827051932.74382-1-jesse.zhang@amd.com>
 <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
 <DM4PR12MB5152CD509AA9B6B9A0B1E7FAE3942@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <DM4PR12MB5152CD509AA9B6B9A0B1E7FAE3942@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bfa6f8-373b-4643-73ed-08dcc703d34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE9nczhGUHdPYXdWaHVkQlVOYTBna1FqT05mcXBvUG1WVDluNm1iWm9mMUgv?=
 =?utf-8?B?UGptN3FBMThqTjV0R1M2aUJLUEg1WmtiM3l6RlExL0w5azRYNzI5d0JCZTg3?=
 =?utf-8?B?LzJlWDg4QlZRYWJyVjJuMnArc0VvbEtCMStjbHc4dnk3OUw3K21IRnJoY0xY?=
 =?utf-8?B?SmcyRXdGZUwzTUdtZjYrbWd1N3FWNzJ2ZDQzWDJPUUVGVUt3NmVNZWhoYnZs?=
 =?utf-8?B?eXZSN3BjTVpCRWc5Qmdna3VlL21nbWZ6eHA2UlEyazQ3em1lSEthdWljampt?=
 =?utf-8?B?azFLOUxtQnhaNEYvbUJvT0M4ZGVCaFlYSWxjQUNzdEFXQVJMeHBjbGR3QUtE?=
 =?utf-8?B?S2xlWkxzeFE2NElyQytNU1p0M0dZdmxtcVFISlBSbENqS2cwR21JcVUwRTAz?=
 =?utf-8?B?T3RoUWxCQndRWW5xaFU3dWJIVE5kbFg2Tll1YjlvZWh4dk5ueEQ1Z2FKWEow?=
 =?utf-8?B?bzRPOXhVWE1FZDVjY0VNOEVzZnFVZ0NFVzFCbHBvaUVVWGFOUXZ0UlkxSlln?=
 =?utf-8?B?MVV2RC9WcXY1K0ZLaFFiVGI2OUV6ZXpORVFXTkMxNkE4Y0NQZnI3V3d4YVRK?=
 =?utf-8?B?TkV0OFh4RytGaFRBUFZjWmJScnhlZGJCN0g3RUY0SFRPWVJuMTk2SVVHeXFi?=
 =?utf-8?B?bk0vUmdQelVHM3VwbGxrdVQzb0x5dC9XNk9Fa3FUMUd3TzdpTkhvNklEVW1F?=
 =?utf-8?B?U0cyZytXeVBSbUN4V05QNFVxTUVnTEMxQ3ZHSHNWSHcrWlN1andySkxuU3A2?=
 =?utf-8?B?OUlBQjNsQk9VRkRjRUNPbDc0SkwvMm5nMVVxdVkzYUl6L28zL3NoT2lWWEI4?=
 =?utf-8?B?WFpNOWV4dVpPb0Z2aUVkZmlMMk4waURNL3EvVGtvbzNxMHl6T05ZKzNkWERy?=
 =?utf-8?B?cjExUDd2RGlhcENoSVVaREVLNzB5QUdWZC9adGQ2aVBEcFZJTTJ4a20vbjl1?=
 =?utf-8?B?K1h1V1R3TVpGN09Kdi8xc3B1SEZJOEJRQTBuOVd5WmFWKzV5Z2hEUC91Zk45?=
 =?utf-8?B?c0pESTVxMjM0eWRsdzdoMzRxcWZ2YXhwMDZ4WGZzU3BuUm95dUZJaEJkOTNC?=
 =?utf-8?B?N1ppNkJJYmNuMzVISk9BWUMzbHUrcWtOUXBIZC9lZUFrQktBVVZFZHR2V0FJ?=
 =?utf-8?B?M1BzWi9xc1Jud0trRjFhcW9YWHVJbGRWVzhGS2V5YisrNnNwSzV1bUVrNWhO?=
 =?utf-8?B?K3hCWXBWcHhBUEo4N3VwejdSbm50ODFiMitYaG0velBjR1lKSnB2Z2dUSnpB?=
 =?utf-8?B?S3hJdmVXa3R3ay9oRXl2OWJrWEUwN1lIdDd4VDZ4N2hXTG1UUDlrNGdlN2R5?=
 =?utf-8?B?MXRURGV6NzY2bVYzWEtMNjE0VW5KN3ZHRys2YVFObjRic1RlY3J2RldjRHlj?=
 =?utf-8?B?WWVDK2VGSEZYV3UvZjNLYW5UcFBTZHFSclV0eHoyaEZmSnROcFpJdHZuWkZx?=
 =?utf-8?B?dGcycS9CL3BPSTRyczRkYk9tZElxTCtyUmhQSmo4NGhOdThXVUNPODhPclhp?=
 =?utf-8?B?dlBEMFdXcGZzcURUTURZbTk4dFJBSzgzZTlyRTR5T1VId1dYYk9scEpzdUMv?=
 =?utf-8?B?U1hYZzhGSnNjNXR1bkxWY1pmemlZMXJURUFzazdZNmF1cC93WnJpdUh0M21r?=
 =?utf-8?B?Y3N1RUNVWk9vTURnbDlmRjZ1UU5KSXYwV0VYVEQrUHFLQnFmd0lRemNxTXU5?=
 =?utf-8?B?bTNuSW5hdFJ2a1JsUHIzbDFzSFpDWkhwdzMyd01XY1hJVE9TNHphNU9OTTRu?=
 =?utf-8?B?WFg3bHNZRG1DVDZ3L3ZoU0FJTEFjeWszeUpIVXU0U0dHSGV2bzZOWUpQN1Uz?=
 =?utf-8?B?bTZ2OEJJdHdmdVZBU21DZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUhGaUNPc0dKczVKOXhRTm04WXo2N09URzgvMmw5dDdPZmZOL3FERjJNWjA3?=
 =?utf-8?B?N29TalQ5c25ncFJWVXowY0JPNjVXVVNjTERNL2lRRHF0TllJR2RwdEM3ZFdH?=
 =?utf-8?B?K1dYQXVtZXpqRWRwWVRFSEdpMkZPcnI1Mmc0VWcwNzAxem5QSmxXQkcyTEh5?=
 =?utf-8?B?NndBcDlpM2hhOElYRGdYUXJudFN4bjlLdGZ2NzAyRmYvOU91NXgvSzF3R3o5?=
 =?utf-8?B?elU3WXhMZE9qRFBYNmxPUVZxOWNMQ2xNUFF2MXBObFFwU1BVM1dsdU51RW1o?=
 =?utf-8?B?V1cybW51MDB1bisxTUtOaXBEczFOWG5TUGdHRG96WkFublVnNmovRFNRRU51?=
 =?utf-8?B?N0F6WmdGTkRUc1Y2b3VsSjN0THUyVFZHcXN5ajNwNUM0bHF0R3lpditSckYr?=
 =?utf-8?B?dVJFR1VtN2IyeWl2d1JDYUczT1JuOU1ETkxMZ01wMjA5QzZhZG1XM2I4eEhL?=
 =?utf-8?B?NUU5NXhZdkdUWWlHVUpXNDRVSVBwdUNrWlFGRTF5bW55OGVOT0I2WVNBUVhN?=
 =?utf-8?B?UXhhSGQ5OWp2cEpIdzRMZ3I2bUh1anhDbERSbW5Ka1h3dVcyMzZna2ZkMTBD?=
 =?utf-8?B?Mkk0ZnRRKzMvcDhTWTdOV0x3ekJuTUJsNmV4RFcxMWdaOGlhWmg0TmtFejFV?=
 =?utf-8?B?ZmFtZGo0cXdqNjZsYUFFL0pJak1zZVdGb0Z2UW9qVjE1RGFGeFlJZXYyV3hy?=
 =?utf-8?B?QlJKTDc5R0M5QmdQN2F6aEpQcS9CbDUzNW83TVpCYXM4dmt5UHFDTDBDWVlk?=
 =?utf-8?B?anEzMEZtMFVCWnZ5TVgrUzdOSE4vbUxiQ05RSUhicjJmYXJ3SS9tZGRaYm5h?=
 =?utf-8?B?b1QzNFRXSituamtxaGZ2eWl5LzQ4SzMvNUpjcFJyTjVoZ0JQcjdqOUtvVHNT?=
 =?utf-8?B?SEdYZkc1ZHZRMFEwVTZ5WVdGQ2JnZFFoWHZnNExXMUdTUXQ1TVZidnVMckpC?=
 =?utf-8?B?MWU2YXZZWTZYYy9QNEw0MVUvaHliZHhIb2MwQk5KS0xJTzhVUkpMMzlMb3d3?=
 =?utf-8?B?Wi84SHB6dEhYZWlNZ3V5azlJOHVhWXpLcUcyd2pONHlzRDhORzB1a2VxNWNs?=
 =?utf-8?B?SGUvLzFLN00xUWV2RHNBV1hGZ2dOUFlVQkxRUnh1ZnhEL2lrL3dGcWZONG9l?=
 =?utf-8?B?RGgrWDJlbnFNVmVEa3BzZUJ1dXhudkxwaWMwTUlOVFFEa0piam5NOU0vRlN5?=
 =?utf-8?B?aG1rSnlFTE5WdUxHNHU3U25TWXl0UmZoRTY4N0g4aTVIYlNYMWh5dXg3QTI3?=
 =?utf-8?B?VVpaMVRWOHlIc2YrYUZwYURhUDdObWVxZ1V0MFdBT0NFUldZQlgxY050bC9F?=
 =?utf-8?B?bUJwSFpPTGJNdE1iMXVvQjJNbkJMNklUMEZnQ0hkRExhSGYrTnplSTdKNEsr?=
 =?utf-8?B?QjZYRkhRNnA1ZjRMclhiWWZUS1M3cnFXWGVpUVhoYW41QldCOWM0ZG9nZXVx?=
 =?utf-8?B?aXhRNDFKanY2Z3ZSeFpySkFkUGNKMWZ6d1IrZU5ranNzUmVCdlRnYVpsaGRj?=
 =?utf-8?B?c2djM1VxSnNjeXBEeElOa1NYVUNWd2J4OFJVRlJkZ2tzR1VCY09hUGhpbWhC?=
 =?utf-8?B?b0UvWFo2ejI4YWd1OEk1RXlua3JpcmsvVGVyUk0wOENneUYvbTFSV3NOcE1L?=
 =?utf-8?B?clR6WUR0YTRPUzRRN3JMbDRNZUd3VTdBT1BWK051aXZSRUJDQkpZQ1lGSkdn?=
 =?utf-8?B?bjJtTkl6SzJ6NzZJRWdxVXROK3pGdk5heGZ5OS9DMHNPK3U3VjNKM3VBN1Rx?=
 =?utf-8?B?bGNETGVmVmNJeWNiSGtYYXQ3MS8rWEN1d2Naa3NraklqZ0g0bUR0alU1ZzMy?=
 =?utf-8?B?N1FvdjV3eE8wR3RXNTRhMnViV3NMQkJZREJTNDd4Z2pDV3dZK2p0YmFBMk5Z?=
 =?utf-8?B?eTBtNm4yN3c4eDlicm00ZTVQZGZTOXJ1bVJVdFZET2RpdVBkYTRCTmdWV0w1?=
 =?utf-8?B?NHBKZTV1Lzg1Tkpscmt6YjR1aXFhbko5QWx1emtUQ3dGRmRwcEhqeUlkUGxn?=
 =?utf-8?B?SHNzYmN5UGN6dFROdExUcEQ3TWtjLytIb0lkRytXUitNY1h6ZGY1WUhwZFU4?=
 =?utf-8?B?NmsrcUllc095NVh0V2VUUkRFWHI0Q2VGM1ZmT2pUMFRLQSt1aUg2VGt1ekRX?=
 =?utf-8?Q?6+pDN/A+NN/s3UfGpA/znDh2y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bfa6f8-373b-4643-73ed-08dcc703d34a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 01:50:42.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXK01CsTIZ8jccBnNUy9ipkdl+0btSYQcKJN4Ozx87C/o0oL7HEx1A+/RO5WfdfHCO1UmhXVapmMUDtqZAicwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
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

Hi Jesse,

The changes look good.

Could you please remove the condition check for sh_mem? This check is redundant because we already have igt_require(sh_mem != NULL); in the igt_fixture.

With that adjustment, the patch is:

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Thanks


Vitaly




On 2024-08-27 03:54, Zhang, Jesse(Jie) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Kamil
>
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Tuesday, August 27, 2024 3:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue test
>
> Hi Jesse.zhang,
> On 2024-08-27 at 13:19:32 +0800, Jesse.zhang@amd.com wrote:
>> Queue reset does not exit properly when executing unknown subtests.
>> Because other processes are still functioning.
>>
>> It should exit the other three processes (test, background, and
>> monitor) for this case.
>>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>>
>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>> ---
>>  tests/amdgpu/amd_queue_reset.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_queue_reset.c
>> b/tests/amdgpu/amd_queue_reset.c index 60208e085..85408e3ff 100644
>> --- a/tests/amdgpu/amd_queue_reset.c
>> +++ b/tests/amdgpu/amd_queue_reset.c
>> @@ -70,6 +70,7 @@ struct shmbuf {
>>       int count;
>>       bool sub_test_completed;
>>       bool sub_test_is_skipped;
>> +     bool sub_test_is_existed;
>>       unsigned int test_flags;
>>       int test_error_code;
>>       bool reset_completed;
>> @@ -148,6 +149,7 @@ skip_sub_test(struct shmbuf *sh_mem)  {
>>       sem_wait(&sh_mem->sem_state_mutex);
>>       sh_mem->sub_test_is_skipped = true;
>> +     sh_mem->sub_test_is_existed = true;
>>       sem_post(&sh_mem->sem_state_mutex);
>>  }
> Do you re-implement igt infra?
>
> Hi Kamil
>
> No, in the queue reset test, we start three processes (test process, background process, and monitoring process)
> when running any test (including unknown tests, such as such as:  sudo amd_queue_reset --run-subtest amdgpu_testxxx).
>
> The known process can exit with the other three processes.
>
> The unknown process can exit, but the other processes will not exit.
>
> This patch fixes the issue of other processes exiting in the unknown case.
>
> Regards
> Jesse
>
> Regards,
> Kamil
>
>> @@ -327,6 +329,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
>>       sh_mem->good_job.ip = ip_good;
>>       sh_mem->good_job.ring_id = ring_id_good;
>>       sh_mem->sub_test_is_skipped = false;
>> +     sh_mem->sub_test_is_existed = true;
>>       sem_post(&sh_mem->sem_state_mutex);
>>
>>       //sync and wait for complete
>> @@ -405,6 +408,7 @@ shared_mem_create(struct shmbuf **ppbuf)
>>       shmp->sub_test_completed = false;
>>       shmp->reset_completed = false;
>>       shmp->sub_test_is_skipped = false;
>> +     shmp->sub_test_is_existed = false;
>>
>>       *ppbuf = shmp;
>>       return shm_fd;
>> @@ -1128,7 +1132,6 @@ igt_main
>>                       create_contexts(device, &arr_context_handle, const_num_of_tests);
>>               else if (process == PROCESS_BACKGROUND)
>>                       fd_shm = shared_mem_open(&sh_mem);
>> -
>>               igt_require(fd_shm != -1);
>>               igt_require(sh_mem != NULL);
>>
>> @@ -1136,7 +1139,6 @@ igt_main
>>                       process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
>>                       &monitor_child, &test_child);
>>       }
>> -
>>       for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
>>               reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
>>               for (struct dynamic_test *it = &arr_err[0]; it->name; it++) { @@
>> -1154,6 +1156,10 @@ igt_main
>>                       }
>>               }
>>       }
>> +
Please, remove

sh_mem

>> +     if (sh_mem &&( !sh_mem->sub_test_is_existed))
>> +             set_next_test_to_skip(sh_mem);
>> +
>>       igt_fixture {
>>               if (process == PROCESS_TEST) {
>>                       waitpid(monitor_child, &monitorExitMethod, 0);
>> --
>> 2.25.1
>>
