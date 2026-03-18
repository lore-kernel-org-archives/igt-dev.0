Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A8B1077610
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 20:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3D10E437;
	Wed, 18 Mar 2026 20:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SsT4w9Vr";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011066.outbound.protection.outlook.com [52.101.57.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4210E437
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 20:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGqZvjQ6b6bL58ZC0eP3gnuRNMjPkhYKjl8W329rmpOFNfNNg0pSL7zSkVl7Gd831ou7KYReFL9A6MOtsNkhZK/yNwTBgIcbVqd2t56V5bIsHXLBbQ81uUuHvi+VoOPpxFkSxvxZZ+VxGcu+VY7x9bivewTt+4C3S6JiV7fZcYc3jdNvRng4PnLMCzqT+RY9SbpRLY+MmR/JhEYcp2KvH64tfIkxdSKTtlvHaW1SOVyyZcARLo8LowL+sibH73pFkMipkAUuUe9ZIOEKtssZnwKr5JXRgcepQzBHNmnPlpDUa5aWBxZmtJuywUo/8LNgUXsGkY7BYnqz8+DhS5XJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYkPlgcaTz6pgxinJ0ni9jE0x3K+Thz8vizp2ob7MKI=;
 b=mapskjZQAMPTNxH7d9jOfaX7GiAulwu8ZEaHp3ZDLEhqihD3tykCFIKqb3oYItYvFBW8FXlCmh2Ig/+3KHmdXN8C2BbDNQ9Sk01PKeNqLQF8db169XlGeMdf3byKRdYqTsbAUnLNdjDziOskmuJmjWpofBt7s4GoSmXn+EOoTUb+HDLij3aHJ2i5E6OpSqyVB6cwVwz3MLWsHLUDxjKUKxTqbbAjNMzLrOM22/x9BU5EDhPUB2QvSKtYQ+l4yOEULa+fqvjE94EPlP4qz1pjzrbHU4Od2Yhbo7+j1xFuCUtRi/d0HlZquuR2CcT29pkvhnlUcMyejrG5lxuXRWvSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYkPlgcaTz6pgxinJ0ni9jE0x3K+Thz8vizp2ob7MKI=;
 b=SsT4w9VrOcWcZgKW/4f7UNQm3ynPoZct3piWMLODB2nipME0EQodfZWCu1S7ZF7HYOk5J5YqX68iVFNGkvttO5cUqc5VUk2Dhkr+gul2zIVMkRv8LT0ON2e5CYiVKKYY8bDeR8TQmAqbXmAklZHgzZ1c15bvyfT30SImRpvOYWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 20:16:01 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 20:16:01 +0000
Message-ID: <9e09a519-b39a-4744-9718-4a05e68a2203@amd.com>
Date: Wed, 18 Mar 2026 14:15:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tools: Add amd_hdr_visual for manual HDR verification
To: vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, wayne.lin@amd.com, Mark.Broadworth@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <20260317175136.3754576-2-alex.hung@amd.com>
 <20260318095254.djw4zv52ppxvl6ny@kamilkon-DESK.igk.intel.com>
 <2467d584-24ca-49a8-a561-bc19416e052d@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <2467d584-24ca-49a8-a561-bc19416e052d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS2PR12MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: df846b44-61e9-4740-3ec2-08de852b2c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: kNx6cnDKMHpf354aU96naZ/jWLX0SKxLJP9RrVZI6uBbODYo9CvnsSzcCQ8HPNt65QXqWGvjVozdo1z/h0bHUKQaCuYpfWjJO+sqBg/jSlxmfW/6Qj+TnkZ1yUaKjoZi/6hmMuRwTEp1ymzrCrpDDFjdR2Ukd/O69waJUmoXvsabSo90zi8AD2wqZAAJR8e8fFee53XFabOT0CWbUTJia+B+5Vu1qUeOSTygE6pCNItX8OnD6WfYuFDiz5ADruLb6qZVwv2LyDoizVFEx6CNC+Tvvu4EE3bBeS0QZ3fLgl8E5k4RAHSM/7MnowPn1rCo7OZNVpKs7zJK8OCsAZ6vVZCBvqVw7u6qrTnaimFbgFISkPZhNuVN2SYIAR0uPQfN0xfluIS/aeEisEWMeELHL8X8dKWTbI9ngdwUdD+ZZ76QFUiINmWAuTF0AiCRCpFZf0U11YPG2fUN4D7snOq28XJfOqkWW1Prm8DlLYMiUqnzDXKapadHtWH2ZpRt7LHzoqIFLE+GrSAM40qgOgYYmY+CbRh5TYU/GCuVY6iuaat1Zx8D0mvsxa/hIz9lvJVa188ZGt6kzn55qrD/bS6tGaxsvyww+rasP4gapUipsNzYJ+Y9KY+8RrSPFvJKdV189zJjh8gUvf3R53xytx+4iDJCJCNhepjQWNusl1XMlqkQXRNYLutoJfxSKVsN9KbiB7mcyGNEEdkDfBUwGXX6ILjCAAxl5R7ctjlVpHou2r0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG5YM3RjNmltajZvZVQ3bjRrQVIzb2IyaHlES1p6bU90VHg4N1RQNTdXRHZN?=
 =?utf-8?B?Z3FMcktVU3phaGRpTXJHUGNOK0IzOGw0MXpzSFZncXJTTFpydU52VFFnRGYw?=
 =?utf-8?B?UFljMHJZZWJyeVp0VWVuVkhWQmFaT2toak55Zi9CYVVWKzVlQmlUcjNXbkJt?=
 =?utf-8?B?TGs0aGJURkJWbHptUjg3TFFSUGE5V3NkblFTSEdKSTNiWG5BbTVCblBqOUxt?=
 =?utf-8?B?ZzVBU3pQMXJIVzFjQWR3UUlmWWpjbzlxVEJqb0N1UXhrS2xsSGdyV1JCQ1R2?=
 =?utf-8?B?YVJsUzNmUUJRYXpTZm9RSzJuWnZOa3NCd1J6ekdpbmFvUXRTRk1WajZCRGc5?=
 =?utf-8?B?cnVsTktsUnl4Mk5ESHM4dWFxcGp4SkRQSzFvTXkwWUlXZ1NkM2lsZGFpV2ZM?=
 =?utf-8?B?TE5Ncll1RzZyMmFGNXo5dnRwakNNWEZuSFYvQXh0QlBQM0RIYitVaVNGcjVL?=
 =?utf-8?B?VmRsUFNUQktzSklDa0xybmJTWXhCdFVGMm5TajJid3doZTZwdERCd2d0eXEz?=
 =?utf-8?B?VUUvNjBzRVJVbHFmSWI4UEZjQm42eUJoT2ZpQUlISFA5VGVNQm9aTmU4cEtp?=
 =?utf-8?B?ODNIWTNIcXhBcy8vemV1Um1xL1BQN0tXVkRlQVJ3S2ZIV2Y2b2RrMVQ5SndK?=
 =?utf-8?B?T3M0WCtSbEdhbnZrVXgzb0txalAzcG9qY2pGNHQzZUJDenRuQnB6aTR0a3ZO?=
 =?utf-8?B?UzVMOUVhZHNOclFuNXNXaEhsZG5tdHVySzIxZ3FzaHg0UW16V2xtNGNHSk5p?=
 =?utf-8?B?T1NIWXF5d1hWMmNGY0pYS2Jsc2xPTXpiWkVwSmRCei9jaS9zalAvNldGZTBo?=
 =?utf-8?B?WFBhZVBycS9JamdJYXFCRzVROHRmdWNsS3hBVDhNbTFiNldxampkalpyQ01N?=
 =?utf-8?B?RFE3NDRlRXUwcnM3N2Y3ZFpxclIrc3RMQmtMT051M1RycWQ3VWhidHB5d3Iz?=
 =?utf-8?B?cEZxNEVXVk9KUzAvNUROUmYrUEFyL3l2eUVCUjd1eHpKVVMxMHgvK1pmL0ZS?=
 =?utf-8?B?ZUsxWklmRWZvYVptMXhjeGF4V2FMdlJrWi9YNzQ4ZTZ6dUNabXJpZy8rWkg4?=
 =?utf-8?B?WFowbFF3cG5wVDVXQUR2cm5XeVdGdWplb1JpUVNia2xuaGExdU8zTjdtUzly?=
 =?utf-8?B?SjZHL0VkV1d6bkc3QlhFZFBMV1ZMcVh4UnZKdUV2azRtcHA3dDFaUXhnRS9j?=
 =?utf-8?B?MFdYVkpDSlVxUHNNU09uUnVKMkt2YzRjSjdVR00rQ0Vpc0UwOStWQi9wcVov?=
 =?utf-8?B?VTBwZzZRSUJTeUg3c3dWSHViSmM4YUwvRzVSZjdzdGUvVnVRTExZWkQ5NFJV?=
 =?utf-8?B?L1ZFZ2tKNzRYaWc5cy9kNEZIcXdPK3VodjVCNTF0NUpwZm1tZU9YNlpORUhG?=
 =?utf-8?B?MG9jcXRiWXM2WElrZXc5Y1BrY2RzVWdrQlQyUk04OVc4V1lyRm9DU1E5MjJu?=
 =?utf-8?B?YVR6SFNxMytSdnhEWnFIeVhmWVJqak4wSkdmSEIvVEVDcmFjRzhPamxHaW5D?=
 =?utf-8?B?K1J1aXV5alIrMW9yYi9EMjFnbUZ0VGlFTzRDWmRYdTFZSndVZ3d5WGltNlFZ?=
 =?utf-8?B?OVBXSUJYY3BLc1ZERVlWc3B6VTYrcGdrMzVTbjNveE40eDhHSHFwT0RaK3Jj?=
 =?utf-8?B?V21NRTJJUkhvSm9FQVdHL1lLZW9iK1E0TE42Zm5BRU1pd245ajhoUEwwTFRh?=
 =?utf-8?B?YjM1T1VBUFNCZC9zYmVVS0JIa3lncSs1L2tCWGorYU95YlluYXZJS214alFh?=
 =?utf-8?B?WExCbnFJS1RWZ2pjaXlpZlpFc0RvWUNuMWpIanpXaGZiZHFVa0FLMEk4WE01?=
 =?utf-8?B?Qk1tWmtiK1VYSlQ0NU9QUGU2WkRCclBLWWNScEFCWFFrSnAyOG1CaHBNNHZW?=
 =?utf-8?B?dGFlcUNDb3A0blhoSFRtWVNHV3hLQXU0QnBwY1RvVkp4bnNaVVZ1YWdGZ1Uz?=
 =?utf-8?B?MWRKcGtVVGZGRjZTY0hJZmhWRE1EbHJLSkx3NmRLeDB5dlpZRytNa2p0MDVI?=
 =?utf-8?B?WE5pQUhBOFUvVUxoakRjdjBnclJ0Z2NlM3JHbjBQS3pQWjB4WXRDMmtQcGtj?=
 =?utf-8?B?TE9rZDZwc0x1TmJ2elhyRVY5dmtyMHhvMXRmOXhuazJjckhaMXdpU3NxeC9h?=
 =?utf-8?B?S2h6bjN2anJ4WmsvTVovOW15RDJZclhOMWY4cWNPQTd3RlJ1TEZXdElHaGNE?=
 =?utf-8?B?YWN6cUcvTEFnT3Z4MVJWNUJXc2p4OEhtL0dLeEtKTG5YL0tuZTVGVnA2VlBy?=
 =?utf-8?B?bjlHWGpWcnlQWitGKzUyUndUYzMzczFhcStGZk1RbDJKcnlWajQ1ZnEwK21K?=
 =?utf-8?B?cTBCdHJ1ZzEzK0dvM3hveDJ6UmkyWmlXdmtpTWtaUk9rWnBZRDJIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df846b44-61e9-4740-3ec2-08de852b2c5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:16:00.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk04zZVoRBh8sf/sdctj+aVPHLV4lrhl3GkneneRIPq0Sh2EZ/csKGoEXT0J7RrT/LHXhrG70qBaA84fROUYcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9821
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



On 3/18/26 14:13, vitaly prosyak wrote:
>     The file uses igt_main(), igt_fixture(), igt_subtest(), IGT_TEST_DESCRIPTION(),
>     and igt_assert*() -- this is a test, not a tool. IGT tools (e.g., intel_gpu_top,
>     amd_hdmi_compliance) typically have a regular main() with argument parsing. If
>     this is intentionally a test that requires manual visual confirmation, it should
>     go in tests/ (perhaps tests/amdgpu/), not tools/. If it must be a tool, decouple
>     it from the test framework.
> 
>     Alternatively, if the intent is to keep the igt_main() pattern (as
>     amd_hdmi_compliance.c does), then IGT_TEST_DESCRIPTION() is acceptable but the
>     patch description should clarify this is a manual-verification test binary placed
>     in tools/ because it requires human interaction and shouldn't run in CI.

Thank. I will fix it in V2 after I can rebase to another WIP patch series.
