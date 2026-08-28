Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B4C61DB9
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 13:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102EB10E15A;
	Fri, 28 Aug 2026 13:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4nU6zyMF";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013037.outbound.protection.outlook.com
 [40.107.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54C510E4A5
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 13:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adRzBkdckfB8q0/Wei04tk63K+ZHa6XGcnseUKadS6KeSt+Gblye9ngmbHsLzXRIww5Hot4Q22y0dT6T44mqAdKK26oxvfTq78e1sUbL0askThDqtXR841EZjc2L7j3LZEKY3qWtleEOMtn2zGiYnaGlttJ7jF51XZAkAzprNOjFxST9HEeMOMERUVxZlS52NCzM0rCT8btnoD9gzBKxcCYTaDw2B57ddqIpm0QaVR0EMV1JTQYiwKOJ7j5QMiDW0X5zpSYRDjqp4ZKcqAtbiEVO4b6t8SWIfX+V3qQQyKvybCgjZFS0Hp70j68yZ9/Af3OnDzqeDJdk+nlE3MgYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxoN6vHqiWFupaM9xTvwT//U8ZyOZ0f0S5esAF9Prd0=;
 b=KW4dkK80WpOH1mCxW5zLKh68lTkQ6+kjm96lZjl8XgknSp4gYUAx9XwHhL45svHTYrFjfMJtQSInDNbJegG0G6JcjETJSaeSwStoKbAdfwT5CNrUFNNh6VU+oTmHmEgAvUGm2JLfvE9dm7LVWkIJr90VyXziY456hJnTitm5ybTtD1V6obdCKaGpqlSrME8onSka47s+iBGkFb6NnXhDshQj7OjRvzqUmseIyzxcbaXwY3xhy/TkXwUgvka6oErykgeTEhHUWH6BGr5D8eRsPofnJgjH2WFBKkpBco2TSVkBD2AVi2HhunoKLORTrkRZRp4EQ2KRwcqcYXdpCZcV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxoN6vHqiWFupaM9xTvwT//U8ZyOZ0f0S5esAF9Prd0=;
 b=4nU6zyMFnNsp7O5mokD4Z0eE2JhYEwFAQi/tKU0kJTxk7W+RYMBM0ywc5pez+cz+SXBBXvhojo62tSEWEeBoMiY68R58GBMLrwiqFzV1mIKTx9TpRovSvjCSown1AiPgu1UW3Owgwnc+GhbyjKU51UlR/bP1qaJN9MX8/uHGINQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:35:14 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:35:14 +0000
Message-ID: <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
Date: Fri, 28 Aug 2026 09:35:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 chaitanya.kumar.borah@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Mark Broadworth <Mark.Broadworth@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::25) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: f9131f1c-2707-4905-bbc8-08df050930cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 7H9Qx2BLokO15aqF+iZYC5RCSEncn6C534pKY2Sbm6bQCerT6kSbt8y+AwyyqlrVBS6VpOB+LB+8UmgDA2S34kYuh2O4jS9jIuu6BEgE57BSjgdk8CZ+M1DsbpV3hEt4T3zXgCNaEzUrlWeJDdF7YIPkAqShrVSgaa+hTCcNISmsm7ki8eTLBe4bqaWYt8EU4oPJ4uad3zg3fYL6VCA7GIxNBY+WGVcR2MJknJTp864iP9NzL/yueS2J2fuQYJOwERml93wPdjvjsioidSCwuLv6OCSZM5AEN+mNw/RwOLhnxqAiifkl4m6BqFWE2kYwR4FHi1AaxpHwJb/SokQFU3+Ymaa/BdmOxMZCwu0BowjnnB7v3dBh6JkxFhkqg84U79zywti7H7LT2X//1KTco8GN3bfqRYBBO/cfvccFrIB03/Z0ie9Y/ANMZ2xls+P6CvXIvkhu26v65Rhpz5xRuQaYJo7VjVMJ9FHlP18uw+09j4Dn4JMrSMZoZ5qLk2OEZm5H1clQkHFS4roOBRKotzzSIKnks9sqsGbPHr5xjFWm3QeDTMwbVPSg/zmRtGH0IRA8gthDcQopbh61w0skjblfaozeuV6t3bJyZOvgucr/BLPPl8auD3PX1tLFavUeRbLFSWgB8Xe775e8nlkTdS7jYo6dW7k65CUD46G+c8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhaUXNqY0JoY3VCTkpWUGJoMm44L2hMVGZxa1ppa0JFdmYwd1ZNaG1pRUdU?=
 =?utf-8?B?eHplL1JiL0prNGEwNzFGZmFPK1VTZHBPWlV5Mk9xQkUwNUFkelRLWmxTcGpC?=
 =?utf-8?B?NnFhamhFWUNNNVZWazAwTlRxQVF0TzNIdWVqWUtlUTNxZWQ3Y2RCSlgzRFor?=
 =?utf-8?B?QndwMmc5ZVBMY0ZXQ1Nuczk5M1pLVisrYmRHRGpKMUxlZGdxdXR6Yk9aZ1d4?=
 =?utf-8?B?YXJZNzZ1SThlamZQVzFoTVhkQk5oSFJxR2tUTjJtVkJSUlgyZjk2bklacVdi?=
 =?utf-8?B?SE5Ba1FqczdFbi81VTU1Y29GTC84ejljVlZnQUtkcnpsekM0akFFUnhyeUp3?=
 =?utf-8?B?QkdabTBTYm5tdkZhakxqVDlUalNpYVFLVkNOTFJOTmNBcDQ2WVdkKzBCWE9G?=
 =?utf-8?B?dnhidnAxNWpBejJEdUlDTW9tNEdMK2ZuYmRqVnV2WWxsd1JTZnBUWXhPTnRP?=
 =?utf-8?B?M2w3bjVQditnUUgvWFZYdEdBZkFOZXBDM0t0d2FRT0pkTjZxZUxOdk5Wbko4?=
 =?utf-8?B?Z29OdHA2Q3hTeTM5UzVWWVFXOGVyTlFQOExMd1FlZ3B6a2pGK29COGJPbHFr?=
 =?utf-8?B?K3IxSmJjRVdHN3RQY01JWmo2UXJUZjU5VTBiaWpBOWwydVdOdGM2bEIrUHpB?=
 =?utf-8?B?ZEV6bXNQNFdHM3ZaLzR6c0JUc21qMy9BaWkzTWhIOW1JRDk3dDBSMVhSNTJI?=
 =?utf-8?B?QjRRN29JMVdWYjgzMUtUKzhzYmtPaXF2dUJRSHczQ2ZDdEZzTEFwZ1Q0bkJi?=
 =?utf-8?B?dUJKU1ltUmRhamxyZ3ZLL21jVG92clFtbmhqM0lWZHovMXJmejkyUERiaitX?=
 =?utf-8?B?UjVaVURKYlJPVFNrQjNwWHU1RzJJNzZKYk9vejZjckFXZ0J4ZGpoSURBNmdr?=
 =?utf-8?B?Q0xCRkZmR09rbEtBWnNHeElJN2kxNFZkRDNsUG5PaHNhcWIzaHg5MWIvdUE4?=
 =?utf-8?B?R2U4YlV4eGo5MlZ2TzFDREVtNTBIQ3pmNHU1L0E3UjI2WnhjMWJvSXkramhx?=
 =?utf-8?B?dHZPSlVFTnRDeCtvQ2ppWU81RG5iSnBRak03VnFZRjB4bFB1UERhNWRYdmNp?=
 =?utf-8?B?b2drL2NJREx4a3I5ZUxuUjlyL2NVQm5iVzRCWk0vbFcrbFl1QitYRmVSYjM2?=
 =?utf-8?B?bytOUFZ2SEQ2ZzZWQVM2cGorUlpGSVhTZ0kxZXcyR3ZIdHhja0NQa3RXakh6?=
 =?utf-8?B?Z1RwM2x2amFMajZpWUFwWVNpbzV1bUtTaGxYZ3dhbWNsMURtWllYUXFVQnNJ?=
 =?utf-8?B?cStXRWFHSkFFYnVDUlljSHoyKy9BNngzbHp4S2d6YThqVUg3M0hqMDNKRzdQ?=
 =?utf-8?B?THBxSzdHeW5qTlNSa1NJTER0c0FQQjQ1TVQ3ZlZ4UEs4VGRaOEZsak9Eanlx?=
 =?utf-8?B?TXRIaTRNcEgxVlFJYTc2eVBNSXBYYXMrLzZNbkE1VXVnMEs2eUFPMHZua2gr?=
 =?utf-8?B?U1RhVVEreVpMUTl2MUREMENvMzk4bG9xbmdvUkF3emRhV081bVNZTmJ3bTVI?=
 =?utf-8?B?MTZTS3MzV09DTThPNkxlYTFkNWxCTW5jeXBkOFViYlpqZnhnSTZ4dDZEYXY3?=
 =?utf-8?B?UVMzbFkzWTlITjFQSFBGbDBxVUV1WTU4cjl3djdrcjhTdnpDME16bU84WENW?=
 =?utf-8?B?TWdiT2gvMXd2bUJaU0UyQnRWcUtnemIxZ1QwOVFIbGdkRG40RUt1enZCSFJo?=
 =?utf-8?B?dHNxVkI3czJjeTNCVnpKWDhxQnUweXpjOEFzMk1qcHFDejlVV242eDBOOGRj?=
 =?utf-8?B?eVVBcGNNM253ckplWmJjVlF0WFUzanNaYTdLTUhEeFVQaVpSdnM0Q1U0TnFE?=
 =?utf-8?B?RGpUVHRub0QyWDdLVzlLbnhjUGk5SStsYm1nSnpuRGd5OU1zV2JPUWl1QlBz?=
 =?utf-8?B?dkEwcEhLV0xtVnRJYVFVenF0UVVLU2hPRkU4YnFESlJIS2hMUU9Sa2E2Y3ZI?=
 =?utf-8?B?M0FLZlFKdVR4OG43UVJkMEg0M1hHNGJCMERHUEhYV09QenZoQlB3L1g1MUEx?=
 =?utf-8?B?TlRqeUxyM1kxR2VCb25tN2tSWmxIdzFGL0FIMms3c0Vwb3p3SDBRRHVMelB4?=
 =?utf-8?B?MTg4QlNDY09ReUQvNXFrY3FrNmVUWk9DLzZkVG8wTWJscWgxQ2xjbXR5VDlN?=
 =?utf-8?B?VVJKemdwRkV2MzZQclB1NWl0eVM0R3RGVUxzS0k1QzNLa1EreVhwaWIxaVg2?=
 =?utf-8?B?NzJvTEZsWjExVnA1SmVBZklDUDBHRGZnc1RhRFNFcERoOE1pdUtHVVRCUU5R?=
 =?utf-8?B?TWtyeWhIQkpJbDRDbjl2R0tuSldmWWthVEVEZFFVVGQyTmlZR0NIOVBHZnd2?=
 =?utf-8?B?VGs4UVVNYUl4bUlHWWRhUm5kZEY3enl5VlpQR0pZbFJhZHZjRXVyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9131f1c-2707-4905-bbc8-08df050930cd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:35:14.4217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ihc5o2DKGPOfePC1ybDpM4VYcD7zvYQw+wqEBUApGtnJW6hBOsBLd7DzVU7Ru82DM0JPGYFL0pUMqLVG7TjkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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



On 2026-08-28 07:04, vitaly prosyak wrote:
> Added Alex
> 
> Hi Kamil
> 
> On 2026-08-28 05:58, Kamil Konieczny wrote:
>> Hi Swati,
>> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
>>> Rename the AMD-specific HDMI compliance utility to a generic
>>> igt_hdmi_compliance binary and update the build rule.
>>>
>>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
>>> that operation on Intel devices until a driver-supported interface
>>> for selecting the pixel encoding is available.
>>>
>>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> I will forward this to few AMD GPU dev to make sure it will
>> work for them, +cc
>> Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Harry Wentland <harry.wentland@amd.com>
>> Mark Broadworth <Mark.Broadworth@amd.com>
>> Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Vitaly, can you forward this to your devs and/or CI team and help
>> us here, please.
>>
> Added push for testing to our internal CI :
> 
> https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/drm/igt-gpu-tools/+/1951
> 
> Hi Harry and Alex,
> I hope you are both having a good week.
> I am not entirely sure if the DAL CI is executing the new remote gerrit correctly. When you have a moment, could you please help me look into this?
> Thank you so much for your time

Not sure, but I think things in `tools` would require a manual run
anyways.

Jerry, can you have a look and review this change?

Harry

> Vitaly
>> Regards,
>> Kamil
>>
>>> ---
>>>  tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>>>  tools/meson.build                                      | 2 +-
>>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>>  rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
>>>
>>> diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
>>> similarity index 99%
>>> rename from tools/amd_hdmi_compliance.c
>>> rename to tools/igt_hdmi_compliance.c
>>> index 2af4c0bab..ece0abd1d 100644
>>> --- a/tools/amd_hdmi_compliance.c
>>> +++ b/tools/igt_hdmi_compliance.c
>>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
>>>  
>>>  	test_init(data, conn_id);
>>>  
>>> -	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>>> -	igt_assert(fd >= 0);
>>> -
>>>  	igt_info("Setting %d on connector id %d\n",
>>>  			pixel_format, data->output->config.connector->connector_id);
>>>  
>>> +	igt_skip_on_f(is_intel_device(data->fd),
>>> +			      "pixel-format forcing is not supported on Intel devices\n");
>>> +
>>> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>>> +	igt_assert(fd >= 0);
>>> +
>>>  	switch (pixel_format) {
>>>  	case 1:
>>>  		entry_name = "force_rgb_output";
>>> diff --git a/tools/meson.build b/tools/meson.build
>>> index fbc6c0a00..68c31da92 100644
>>> --- a/tools/meson.build
>>> +++ b/tools/meson.build
>>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>>>  	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>>>  	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>>>  
>>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>>>  	   dependencies : [tool_deps],
>>>  	   install_rpath : bindir_rpathdir,
>>>  	   install : true)
>>> -- 
>>> 2.25.1
>>>

