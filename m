Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA1C982FA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 07:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26D710E405;
	Wed, 23 Sep 2026 07:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpow5mBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A429510EF41
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790148951; x=1821684951;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o6EgkNFDnDw4l6sF1OeHVz8M4DHhh8lwkj0h2LJVnyw=;
 b=mpow5mBAHHZPwzCnnvF+B03Lw9euwRjk1lp4f8ov3ik02lzX4M4Cas0J
 0Gqm/OaLgEfky1FFzpAwFDXEVIsZilYkX0ArpTByu7sGOx3GI96OUq8HN
 fZ2mJZ31rxnGC5rQ4VvKze3NY9SlxfaaE58seaJYqmtCQ9xkZWcT0wDHo
 5JXr5PVKKzgiT4bajPtxAcaNdLIaVX3W53FwYqvgcb17Doq1teTDp3mtN
 GNsbXe/JC425jr4tQUltk9f3HONakHZrPTQJf/XcCan8ifztHfG2YHVki
 P+g7H2/535MPVUWd8y/VBJDE2y03aqas4SPbgM0o3Ah62Z6WlRMLV5Ahm w==;
X-CSE-ConnectionGUID: rFTxKj6vRgm4cNB6XYvBBw==
X-CSE-MsgGUID: zzGr+CIkSfmSf1fp+IB94w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1321291"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1321291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 00:35:48 -0700
X-CSE-ConnectionGUID: kMjCVNOcQ/mEp8YL2FAa9w==
X-CSE-MsgGUID: 9ioWM63HT9WYNGExLqNlgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="272979531"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 00:35:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 00:35:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 00:35:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 00:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4eh6G9Td5JLl6MklwyzcBVmhuoUQCWpEyqT6NylqbySIo76zqV+iRKmXcxyTjor5VDNAYaFoKZiZ2FVibk1J3TSPyqFx998d6N+xXnr4ZQeY3nGvHT3frZaONIkiNBHO96ANQ6aZvue5Gu/DNpo27HQhTIW0Clkaorlk4xSdGVyvleSOAAvQSMB7ZItGw5S9eb8L+pHBcll4f1EaJEG/qTV/BW132+wDjV9AKeeY89YSm+zhV5qMrIQYY6EoBkhXvh4nlWIxmGuWU25EK0rWA37wrg9NJjrhf3fofPxLKeJL6xCdmi/tzrok3Sadaxfkne/L4ZDEvFnSlKi3q6HFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9d30rc/hMi8rYDiXet6zst51CpyAidMlIPQgG7J6zM=;
 b=K8LbpJSxPhA0o3dVc/NTiDEsNetgZtPiBl6sjHLOWzpokC79xQpRCtIA+3CqF+yLhSWYgr9MuRvpAKuupCo7GCRDdqa5nMkH4HVyNIshTnL9jr9C9syxAX03ihL0zJYVhRiDO7AGOVQcryI3x/nfFCAitZxKB/lbwGHtt68d/aES8ch824wyWxGHrqLbefwZxkKMmB/qIOJAj1Jc//TjZ70lTPM0WvEKLH3sDhnkwuDY+3Q3lns/opr/kIggIPXw7EjjXngK8e3EEH+46yJ4x+vVx2KEEdB9BlbKvmuxjDhdnTzzDThzorF8Ln1chYD931KdcObIC6tjRO/M0pQgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 07:35:44 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 07:35:44 +0000
Message-ID: <d0605fec-0ed4-4cbd-b055-f32ab46ba01f@intel.com>
Date: Wed, 23 Sep 2026 09:35:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tests/intel/xe_sriov_ggtt: Support execution with
 pre-enabled VFs
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
References: <20260922070940.3006983-1-lukasz.laguna@intel.com>
 <20260922070940.3006983-2-lukasz.laguna@intel.com>
 <a844d0faa42e866dee9dbacae0af76e8087d6723.camel@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <a844d0faa42e866dee9dbacae0af76e8087d6723.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0113.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::6) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 201ff8ae-4b31-441e-eb54-08df19454606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|5023799004|11063799006|6133799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: yNIlBKYXYt92solRnJ/ujFt/NLsMPzSyzROi7d2OKA/3339MjrbTnsz6raleszeeRxb1m7UmrEMDphwo/CJweWCd1Juohr1ZIrbzpgzIFBAAcHz0EQ2xrsk299OUpWpq7gieB87eirf+Nf4m/scSkUv0kmGcnrvPquo+yT4UwH7zH9iBbGBy/a5vDgKRPiMX5NAswaJyPNRAyx7NgJP+2phVrQxSEqw5hggUfdAobhLyFtqS33gpFMezKhwhv3uG2YGjVqDzjPfe/3LY5aW3kb7+v4doqmNIkIm7FozOkIKmnxhlDbsGpeyC5wvI7b46htNg04gZzkkF8+3ymX0tJsqE6FS4yzOu/A0EE1RPjxUsuRpVzw5Xgq+Tq9NuwrWBSqC9zQKe6GLGKcOCTjnLmxphSZQ4dhsS+J2q844/yPbljlWLiD/MfCsYWyFLx1lnC4Pc+G/Ja+o0vpyskjkZxjfoYSzCZ9FCq15i+bIbbA5DcVz5KtS1lKsrMZfNooE5S/Omkj2cKQmuIeYMc4FTtXwUQch5EEme8qi2J9fwC13K8GgXkR6zxdkL91eYchICPs+hq/k9r8MtsspKCKWL8xO1hfQqwhQAqKxY3yQ4mD769owZBldOq8vmRCFKhxeiFzsE/B+yIhmMPF6XbFJK5SXdbboakM6TnPdq5IqTO6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndnQTBwdzB4ZUkzNUYrK3hSaG5BRUFPSy9jaXJCeHAzQU9yanZqRWY1Tm5Q?=
 =?utf-8?B?SHd2M3JOdTR4K2JLaVhjK2pnbE54ckFub0ZWTFFzRVFWTTlKa1NQNFpyVUZE?=
 =?utf-8?B?bk4xaE5mZ1VMYUUvZ21idXhvV01vb3RUc2FOZEFONFhqTHgwVk44RmI2Skww?=
 =?utf-8?B?T0tyK1Rodm1yWThhQnkwUUpOVkNvdGRaQUFlaWVleTllVC84YUJxaytRZWNr?=
 =?utf-8?B?alBENkNPeUIxTG1zMmtlY1pkYWY2aUwxcEJGcWN2YmR3TVNjMHMvVkJTTFNx?=
 =?utf-8?B?Nng3VHQ5aXFVQlFVbFBVay9RSUZITHpUYWE0eFQxOTV6SmdhSGNma3VLZXMr?=
 =?utf-8?B?UlZ5RHFYMGpVQURacUI4RGMxRGlwSXRnTnhrWWpHRmNCLzRGbjB0cTBDcVdo?=
 =?utf-8?B?QjM2TW9ZMVVxS0ZES3AxSi9MRXorcHJuVElpN29aTDJzZlRlK3hhWSt5SjFM?=
 =?utf-8?B?b3BOVCtDVG92eXIzMXpsMUpLOGlHemdiUWVNSk5aL0ZDcUpRd2kzTUJRc2hB?=
 =?utf-8?B?RktwVkozaWxnWVl4blVGbm14bVRSenVYb2xmNHNDOHIvcFBTa2RHZmtmVEJi?=
 =?utf-8?B?dzEzZzN2cGluWDZ3L0d3Unlic2s4a3BvTksvNnVJSFpKMVJxdkJNc3gyaFRI?=
 =?utf-8?B?b3c4QnpUd0hFdDBUMVZhWG9MZHYyb25iWjFOK2tMb2dXSGpDbzU0ajhWT0th?=
 =?utf-8?B?Zm45aU5nQ3BtNjVFYlNtQU9HNkxsTm5UUnY1aWo0RUhrTVlucDNsMzNNdkF0?=
 =?utf-8?B?SXBVUkp3UGhCeXlKR2YwTXJZQmhBTW9NZERtVEI4STM0OEpqZmhRVUZsNkZy?=
 =?utf-8?B?QUdPOUFXa0tJc1dYa0p4TmFhdjRCNGtrTEdYcHFiU0VwWC9jVkV1Z014WU9v?=
 =?utf-8?B?NlM5NmE0M084WFpsbXl3OTM4S3d0VjVTVGpRaU9HeEgvdnA5NXY5WFBaYU1E?=
 =?utf-8?B?V2Zmbkh6RHNEbUtyamRnQ0hFa3dyZWwzNDBxcFFqWkR0RzUxQzJhaFQyZitH?=
 =?utf-8?B?RXE4YkVWK0pTMEh5KzM4ZlFZSUlrUEh1b1lHcmNqdVE1V0tDbGNBYVowQzVa?=
 =?utf-8?B?Y0ZaUDRIRE0yeTJsVlpUd25GRW5RK214WGF5RGNST1ZJVXpxbGhhU0FwRlR3?=
 =?utf-8?B?N2x1cFEzZzY5SFBpRDlST3I2SDc0YXplbGdwWGJxU2NBdEtDL3NoQ01OcmpP?=
 =?utf-8?B?MExUeG9vKzhMWU5wbitxZ0NvSWdBOEprWUhDckJCcEdheUJqdFNLczJJVnVy?=
 =?utf-8?B?N1VGMFVNV1pwK3Q0YnFYRDU1azErOVRpRHN1SXh5Lzl2NjVXTEdjSVIreVNm?=
 =?utf-8?B?a2NBU0dNQ1FmWGJsN0lOcVR3d2h4bmlEVnhBbU1XR1ZaZDNwcUw0SHE2WDdu?=
 =?utf-8?B?V3UzTGZDcDFsb2dpcXArR0JvYm9rb1N1clN2K1A0bzl6Y1Bjd0ZVMktJVW5M?=
 =?utf-8?B?RWw2SkxPTjlYR2FGWHRJOEVMTXlNKzVUa2dxYy9tblNrWHR6ZEJ3UkE0bGN1?=
 =?utf-8?B?d00wT2d4OWlDVC9lcW5BWmlzRnVJc1IvL1JTRC9pd2o1MzVlcEduZ1ZLaDlW?=
 =?utf-8?B?UHlFMGQwaWZGMDdjYmlqRW0rYUdKMTZ5RWVZeWVodXNTOVhiT29tVmR0Qk9H?=
 =?utf-8?B?MVU0bS8wWGdVaGs5bjBWb2VxbW5UZkw1dzdXVzBsc3ptTWNqckpsdEd2RmEz?=
 =?utf-8?B?eXl4eFhmSXVGaHdpeEt1V216aHVCbEpTSVd3MGUyOGYvT1lsWHg1MjA4ZWVm?=
 =?utf-8?B?ZDZJS2hnNDh1NG55cVlDZWRiOUFRVXIyUStjdERVTEhmRUpiWkxERUVFOHZV?=
 =?utf-8?B?bWxBcnNJOU5aYnYxVnpPOU1kb1FrWmJCa2RrY0VnemU4TVlGSmYrOWRDNUpx?=
 =?utf-8?B?R1pjU1RJMHowQVRtcWxGdlg0RmN2cnc2ZG5sQWdSR1NoVDhyclF2TnpjN1Rw?=
 =?utf-8?B?Ylk5bWxwRFFzTUdKVEpmMHZINWVsSVV5d0ttV2E5Y0VKY0liQnFZNkxRMmxt?=
 =?utf-8?B?K0gwY2t2bnd2bkYyd2V0SXR4by8wY1pWNlptMUxlNWVCMFI3S1dhK243bDFZ?=
 =?utf-8?B?UUhxMFpSbUI3SFBxVHhLMFYzOHV3MWFOdUJGbU5GamFJYVp3NURmaUxaMlBF?=
 =?utf-8?B?Qzh4cTM0MEZyK3RFZHFlV2tRMDNUbktHemVoYXV0MFljVlZPdUxJOVBXRFc0?=
 =?utf-8?B?MEdZekt1cDJtVjBVdUZuRHNMUGVOOGpzalo1VHVZYTN2OG5uS2RadlZMMHBO?=
 =?utf-8?B?WnZ4T2hnTVQwaTR5ZUlVL3lIanpUN3UxeXYrRi84eDJjQXA0SGp2ZFY3dWxE?=
 =?utf-8?B?Rno4eWdHQ0hsaWpBWWRzMFBsbThTSTZiTG0vNmJwY05BYW9xM0xrUT09?=
X-Exchange-RoutingPolicyChecked: DTuDzb/YDIiJevMzRHav1wIpUCWPFhPgEbqHDTKYMjn5Vp2lF3btYe2oMo9o03+O39ZlW2s9ApGorIRAPh3on0zqYA07MiInrX8uZFF3cAf3M/CVtaLL4jOuYgT75QtBpGzRJcoWUPL7F7ZZHVnQL6pg/dBEK6IxkQq7HSY213W8JfSQTtqKVx1zcR6a+zgqQ83FIu0efr5l1cLesCcQZDomPI/CS8Ntgd2dcDyKK7h5hD8LMYtmOzeHfMBQfurf1qQvYds/S75dtNA5kGXPQVr4Y655rcb98x01mVrsUj8bfEf95Yyxon2TJJYXicuTbnJZkITNjdSYrvyfNfaY/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 201ff8ae-4b31-441e-eb54-08df19454606
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:35:43.7743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c166F7IZxcWrDo0CjRZ/Ry/XUj3QMV7Cys5qImSvRNPzwI09XE6sWdN7zCRYcO9CAVa+fxm+q9fZPgbOECZ/xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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


On 9/22/2026 21:32, Summers, Stuart wrote:
> On Tue, 2026-09-22 at 09:09 +0200, Lukasz Laguna wrote:
>> Allow the pf-check-vfs-ids subtest to run in environment where VFs
>> are
>> already enabled. To do that, the VFS_ENABLED=1 environment variable
>> needs to be set.
>>
>> When VFs are pre-enabled, the pf-check-vfs-id subtest uses the
>> existing
>> VF, while other subtests that require test managed VF enabling are
>> skipped.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v2:
>>   - install exit handler (Marcin),
>>   - s/skip_when_using_existing_vfs/require_test_managed_vfs (Marcin).
>> ---
>>   lib/igt_sriov_device.c      | 26 +++++++++++------
>>   tests/intel/xe_sriov_ggtt.c | 56 +++++++++++++++++++++++++++++------
>> --
>>   2 files changed, 61 insertions(+), 21 deletions(-)
>>
>> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>> index 6c9fbdf70..26b775b3c 100644
>> --- a/lib/igt_sriov_device.c
>> +++ b/lib/igt_sriov_device.c
>> @@ -550,6 +550,7 @@ bool intel_is_vf_device(int fd)
>>   struct sriov_exit_handler_ctx {
>>          int pf;
>>          bool autoprobe;
>> +       unsigned int num_vfs;
>>          igt_sriov_exit_cleanup_fn cleanup_fn;
>>          void *cleanup_data;
>>   };
>> @@ -572,7 +573,12 @@ static void sriov_exit_handler(int sig)
>>          if (sriov_exit_ctx.pf < 0)
>>                  return;
>>   
>> -       igt_sriov_disable_vfs(sriov_exit_ctx.pf);
>> +       if (!sriov_exit_ctx.num_vfs) {
>> +               igt_sriov_disable_vfs(sriov_exit_ctx.pf);
>> +       } else {
>> +               if (igt_sriov_get_enabled_vfs(sriov_exit_ctx.pf) !=
>> sriov_exit_ctx.num_vfs)
>> +                       igt_warn("Test modified number of enabled
>> VFs\n");
>> +       }
>>   
>>          if (sriov_exit_ctx.cleanup_fn)
>>                  sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
>> @@ -587,17 +593,17 @@ static void sriov_exit_handler(int sig)
>>   /**
>>    * igt_sriov_install_exit_handler - Install best-effort SR-IOV
>> cleanup handler
>>    * @pf: PF device file descriptor
>> - * @cleanup_fn: Optional callback invoked after VF disable
>> + * @cleanup_fn: Optional callback
>>    * @cleanup_data: Opaque callback data
>>    *
>>    * Registers a process-exit cleanup routine for SR-IOV tests. The
>> handler runs
>> - * from normal and signal-triggered exits (when possible), disables
>> VFs,
>> - * invokes @cleanup_fn if provided (passing signal number, or 0 on
>> normal
>> - * exit), and restores the original autoprobe setting captured at
>> - * installation time. Tests that perform full explicit teardown
>> should call
>> - * igt_sriov_clear_exit_handler() once that teardown succeeds. An
>> internal
>> - * duplicate of @pf is kept so cleanup remains usable even if the
>> caller closes
>> - * the original DRM fd before process exit.
>> + * from normal and signal-triggered exits (when possible), disables
>> VFs if no VFs
>> + * were enabled at installation time, invokes @cleanup_fn if
>> provided (passing
>> + * signal number, or 0 on normal exit), and restores the original
>> autoprobe
>> + * setting captured at installation time. Tests that perform full
>> explicit
>> + * teardown should call igt_sriov_clear_exit_handler() once that
>> teardown
>> + * succeeds. An internal duplicate of @pf is kept so cleanup remains
>> usable even
>> + * if the caller closes the original DRM fd before process exit.
>>    */
>>   void igt_sriov_install_exit_handler(int pf,
>>                                      igt_sriov_exit_cleanup_fn
>> cleanup_fn,
>> @@ -616,6 +622,7 @@ void igt_sriov_install_exit_handler(int pf,
>>   
>>          sriov_exit_ctx.pf = pf_dup;
>>          sriov_exit_ctx.autoprobe =
>> igt_sriov_is_driver_autoprobe_enabled(pf_dup);
>> +       sriov_exit_ctx.num_vfs = igt_sriov_get_enabled_vfs(pf_dup);
>>          sriov_exit_ctx.cleanup_fn = cleanup_fn;
>>          sriov_exit_ctx.cleanup_data = cleanup_data;
>>   
>> @@ -632,6 +639,7 @@ void igt_sriov_clear_exit_handler(void)
>>   {
>>          sriov_exit_handler_release_fd();
>>          sriov_exit_ctx.autoprobe = false;
>> +       sriov_exit_ctx.num_vfs = 0;
>>          sriov_exit_ctx.cleanup_fn = NULL;
>>          sriov_exit_ctx.cleanup_data = NULL;
>>   }
>> diff --git a/tests/intel/xe_sriov_ggtt.c
>> b/tests/intel/xe_sriov_ggtt.c
>> index bcd763eb0..d9b3ccdbb 100644
>> --- a/tests/intel/xe_sriov_ggtt.c
>> +++ b/tests/intel/xe_sriov_ggtt.c
>> @@ -47,6 +47,8 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV GGTT");
>>   
>>   #define SRIOV_GGTT_TC(__name)  .test = __name, .name = #__name
>>   
>> +static bool use_existing_vfs;
>> +
>>   struct ggtt_test_data {
>>          int pf_fd;
>>          struct xe_mmio mmio;
>> @@ -399,8 +401,10 @@ static void init_subtest(int pf_fd, int vf_id,
>> uint8_t tile,
>>          uint16_t dev_id = intel_get_drm_devid(pf_fd);
>>          unsigned int nr_ranges, main_gt;
>>   
>> -       igt_sriov_disable_driver_autoprobe(pf_fd);
>> -       igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +       if (!use_existing_vfs) {
>> +               igt_sriov_disable_driver_autoprobe(pf_fd);
>> +               igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +       }
>>   
>>          /* refresh PCI state */
>>          igt_pci_system_reinit();
>> @@ -437,7 +441,8 @@ static void fini_subtest(struct
>> xe_sriov_provisioned_range *range,
>>                  xe_mmio_access_fini(&test_data->pf_mmio);
>>          xe_mmio_access_fini(&test_data->mmio);
>>   
>> -       igt_sriov_disable_vfs(test_data->pf_fd);
>> +       if (!use_existing_vfs)
>> +               igt_sriov_disable_vfs(test_data->pf_fd);
>>   }
>>   
>>   #define for_each_pte_test(tc__, testcases__) \
>> @@ -663,6 +668,12 @@ static void skip_on_mtl_vf(int pf_fd)
>>                        "On MTL VF there is no access to GGTT through
>> MMIO, skip\n");
>>   }
>>   
>> +static void require_test_managed_vfs(void)
>> +{
>> +       igt_skip_on_f(use_existing_vfs,
>> +                     "This subtest cannot be run with existing
>> VFs\n");
>> +}
>> +
>>   static int opts_handler(int opt, int opt_index, void *data)
>>   {
>>          switch (opt) {
>> @@ -691,6 +702,7 @@ static const char help_str[] =
>>   
>>   int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>>   {
>> +       unsigned int enabled_vfs;
>>          bool autoprobe;
>>          uint8_t tile;
>>          int pf_fd;
>> @@ -699,27 +711,40 @@ int igt_main_args("", long_opts, help_str,
>> opts_handler, NULL)
>>          {
>>                  pf_fd = drm_open_driver(DRIVER_XE);
>>                  igt_require(igt_sriov_is_pf(pf_fd));
>> -               igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>> +               use_existing_vfs =
>> igt_check_boolean_env_var("VFS_ENABLED", false);
> Bit of a flyby here... I don't understand why we aren't just using the
> existing VFs in all cases that aren't doing explicit enable/disable
> testing? If we're worried individual cases might behave differently on
> a freshly enabled VF vs a pre-existing VF, why don't we just ensure CI
> is randomizing the test ordering and catch via CI instead of having
> completely separate executions?

Many SR-IOV tests do more than just run with some VFs present. They 
intentionally cover specific num_vfs configurations, some also depend on 
specific provisioning. If a test doesn't require a fixed VF count, we 
usually pick a random num_vfs when running in CI (dynamic numvfs-random).

We also want to keep the test objective separate from environment 
recovery. We prefer to have a test validating behavior in a setup it 
owns and then clean up, than first try to change VF state left by 
previous tests. Otherwise a failure may come from stale VF configuration 
rather than from the tested feature.

Thanks,
Lukasz

>
> Thanks,
> Stuart
>
>> +               enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
>> +               igt_require(use_existing_vfs ? enabled_vfs > 0 :
>> enabled_vfs == 0);
>>                  autoprobe =
>> igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>>                  igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
>>          }
>>   
>>          igt_describe("Verify that the VF ID in the GGTT PTE has been
>> correctly assigned");
>> -       igt_subtest_with_dynamic("pf-check-vfs-ids")
>> -               for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +       igt_subtest_with_dynamic("pf-check-vfs-ids") {
>> +               if (use_existing_vfs) {
>>                          xe_for_each_tile(pf_fd, tile)
>> -                               igt_dynamic_f("numvfs-%u-tile-%u",
>> num_vfs, tile)
>> -                                       pf_check_vfs_ids(pf_fd, tile,
>> num_vfs);
>> +                               igt_dynamic_f("numvfs-%u-tile-%u",
>> enabled_vfs, tile)
>> +                                       pf_check_vfs_ids(pf_fd, tile,
>> enabled_vfs);
>> +               } else {
>> +                       for_each_sriov_num_vfs(pf_fd, num_vfs) {
>> +                               xe_for_each_tile(pf_fd, tile)
>> +                                       igt_dynamic_f("numvfs-%u-
>> tile-%u", num_vfs, tile)
>> +                                               pf_check_vfs_ids(pf_f
>> d, tile, num_vfs);
>> +                       }
>> +               }
>> +       }
>>   
>>          igt_describe("Verify on PF the modifiability of GGTT PTE
>> assigned to VFs");
>> -       igt_subtest_with_dynamic("pf-check-vfs-pte")
>> +       igt_subtest_with_dynamic("pf-check-vfs-pte") {
>> +               require_test_managed_vfs();
>>                  xe_for_each_tile(pf_fd, tile)
>>                          igt_dynamic_f("tile-%u", tile)
>>                                  pf_check_vfs_pte(pf_fd, tile);
>> +       }
>>   
>>          igt_describe("Verify of modifiability of GGTT PTE owned by
>> VF");
>>          igt_subtest_with_dynamic("vfs-check-own-pte") {
>>                  skip_on_mtl_vf(pf_fd);
>> +               require_test_managed_vfs();
>>                  for_each_sriov_vf(pf_fd, vf_id)
>>                          xe_for_each_tile(pf_fd, tile)
>>                                  igt_dynamic_f("vf%u-tile-%u", vf_id,
>> tile)
>> @@ -730,6 +755,7 @@ int igt_main_args("", long_opts, help_str,
>> opts_handler, NULL)
>>          igt_subtest_with_dynamic("vfs-check-other-vfs-pte") {
>>                  igt_require(igt_sriov_get_total_vfs(pf_fd) > 1);
>>                  skip_on_mtl_vf(pf_fd);
>> +               require_test_managed_vfs();
>>                  for_each_sriov_vf(pf_fd, vf_id)
>>                          xe_for_each_tile(pf_fd, tile)
>>                                  igt_dynamic_f("vf%u-tile-%u", vf_id,
>> tile)
>> @@ -739,6 +765,7 @@ int igt_main_args("", long_opts, help_str,
>> opts_handler, NULL)
>>          igt_describe("Verify the non-availability of VF to GGTT PTEs
>> owned by PF");
>>          igt_subtest_with_dynamic("vfs-check-pf-pte") {
>>                  skip_on_mtl_vf(pf_fd);
>> +               require_test_managed_vfs();
>>                  for_each_sriov_vf(pf_fd, vf_id)
>>                          xe_for_each_tile(pf_fd, tile)
>>                                  igt_dynamic_f("vf%u-tile-%u", vf_id,
>> tile)
>> @@ -746,9 +773,14 @@ int igt_main_args("", long_opts, help_str,
>> opts_handler, NULL)
>>          }
>>   
>>          igt_fixture() {
>> -               igt_sriov_disable_vfs(pf_fd);
>> -               /* abort to avoid execution of next tests with
>> enabled VFs */
>> -               igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
>> "Failed to disable VF(s)");
>> +               if (use_existing_vfs) {
>> +                       if (igt_sriov_get_enabled_vfs(pf_fd) !=
>> enabled_vfs)
>> +                               igt_warn("Test modified number of
>> enabled VFs\n");
>> +               } else {
>> +                       igt_sriov_disable_vfs(pf_fd);
>> +                       /* abort to avoid execution of next tests
>> with enabled VFs */
>> +                       igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_f
>> d) > 0, "Failed to disable VF(s)");
>> +               }
>>                  autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd)
>> :
>>                             
>> igt_sriov_disable_driver_autoprobe(pf_fd);
>>                  igt_abort_on_f(autoprobe !=
>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
