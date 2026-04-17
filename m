Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853DF99C6D
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 23:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC9810EAE1;
	Fri, 17 Apr 2026 23:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jAXhWk5R";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8578E10EAE1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 23:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGL02VNuyT9u3yG3AWEuW5wL001KLjEPjhdCWgtiHwkXuhUimrn4jcy+TdRxFent2zrmUVQWkNvllkhnVg5apRuF4E8Q323GlF6i9J/mHvapPI9CIPA+qftFKweglomtBahMmYksmLB7GKA6b07+cNYl1XaS15jjRz6a52J9pynkM+2Ix84IzCFZOSe9jamGNiNtyi9FDLz69sz30EMw6Aci3pedXTPxAhvbpAm7s4wDCxAAkG47/g7wuVIMlorSVksvnBIDV7ibwYJvb4PzdQntp1h0018SYc5m1/SnXnJgSdaHP+XhhMHHa1RME9RCmOBT873kzsCP95vh7lTC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc2L6LOdyE8TXK62v4m6/lMk2jf/Ifoi6jPm3q3J4m8=;
 b=NkllpBvsNvtwGyJyeYqK4gOHks0O3Qy5Sa66YbcgKUqcYEBwPssNTAXvir/W4WFmJg8bFTc5n60unGmSPkUaHrbL8tBTkYelZ0fA3qK60d5jYpPxAjP/Z1ZWcAsji1KzYRmgHjKVXSu1bDaLriAWPEdWuD2mW3s+h1b++MHeuBSHO60vlJGgj3heGyK0bfqN/BYOqDtF+4ww9M8uyRsvNgFEw0VR0zWKNWjDe4HbN2g+xVFE6Rj0waKLHPpTXBLNaMKT8l96UdKXcspRkbmHpQOc+heQJMWFuJBLYXiyJAQ+TkjQttWVcqwx33d6z1+GCFBh2mHUuO/KRCklrPH6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc2L6LOdyE8TXK62v4m6/lMk2jf/Ifoi6jPm3q3J4m8=;
 b=jAXhWk5RmcGlPGv0TMs3SxcVih5ShZoRxTU24Ku7H+5pd194vz6itL0pIRJWL4ZcHJAuamLbigkBCMQ/TQ0vJUaQT86Txrno+C/a0LjA9lVexxuclU7458zrNFmKbGtYlUDAcpqcqG0IRNJ1OqDHUyR+9mcX3aydMLMTcuMhBWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 23:36:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 23:36:33 +0000
Message-ID: <6ac2399c-3950-4aa1-810f-0ccb4783d43a@amd.com>
Date: Fri, 17 Apr 2026 17:36:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 1/5] lib/igt_hdr: Move HDR helpers from kms_hdr
 into shared library
To: igt-dev@lists.freedesktop.org
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
 <20260417213818.2050571-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260417213818.2050571-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 66197002-9d39-4a3f-9af7-08de9cda2885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: toFeLs6zfNYwQAA6CwbKoA0wBRwyhe0IyXhNtOu5P3SlJDwxndnkeEJtoJd9+lmlNbMmDSoJyFwwHgLHehxwUoQNLLHOV1HhArYT60wZnNDlZt8aV7jpeY+7Y1dxmn+sWu5FrM5GlGI8G6VPMHCDMmu9Wt7Od0bfk7tJkRPL79Kz0abkEGDpyg7HFmjr4x+1lgWJ1TlrNkxi/OMRSn7gxTNfQTYysG2lKleZ0YwbUJ8mA4ETDoYM15DWbfZDeBgRsbbgxJMUCHwiVoDw2ojYoQd/eZuvvbg87PaYK8qZQWt3JmUK3fEfWMYUHsdh++uGDkBABlTvnbhlTiQG0UkUQs5PrKV3iE+Ek+FDDIl6giJ+FevVdsCM1Qd06wRsUispxjcf+HcPV9j8az24z50eTrTO13aDDyxrT23T28pdL4az9L2CWbNx1PsqoDHFbw9+XzSmzd+beKO/VStgEES+0kzwL3E4dgobBXmQL4xN/WZDMdPwcIrNwB+vnhW1TxHBTVPzIJ1ngdqQgC4ddlaDe7PBgiqLyn3kMZNaKJsqnRVQhZmZPwvbFbxlIECUwo+2s8kxbfDw+uqG0RcVpx5B8kYBvy5a2tMEkZC8c7XhIpBvu8rbFnvrEtKYesxA9VjE/Ia9LaoGHJfuXx9b1pME/accX0Oct/z9pfd6e9M7zVEMjSMklnU3EtFS3HdyG9adIUVZHezgmvirmFXauUHGGshL1cuN+2AvaGBZ1UT4O5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SERxT3ZiK283eUl4NUxhcDlPbjlmYitTOHFCeXNwdTRIYi9uaEZDODZpbU80?=
 =?utf-8?B?VWx6NGIzZzFJWTRteWt6VEFmd2pobElXbHExZEQ1VFdabzBxWE9mblQwdmRH?=
 =?utf-8?B?RXh5ZllGQmdhcEtrdFVDVFBJV3YvWG1weldaZkoyM3U3RzNGTXRKN3VZME9L?=
 =?utf-8?B?UHkxUUs1TG5ScGo2Z21tUkdjb3MwenNvdXUvREc0QTZKM2oxNFE3K0V3b01x?=
 =?utf-8?B?bXM2djhEckNNUDdjVndPbmtHSnd5WVM2NTVrN1l1dVBJQ2JlamZyRmZOZnVZ?=
 =?utf-8?B?MlN5QTl0ZU0xQ0NSQ1ptTkJxRVBQWXF4MXlxMXhXVGZzeTU0R1ZRWlQ5VWdN?=
 =?utf-8?B?cUVXV2dlUllxZGorclNMNUZlSlVsNHdHaURkekYybjBhS1pZUkJSR0NreUxx?=
 =?utf-8?B?c09CUXFLMnlnR2lVcS81YkluV3h1ZENpV3pTbDQ0ZDhmLzRVSnZ4MWg5clda?=
 =?utf-8?B?S28vZFZFZjJ1ek9mckZwY0RlYUJuc1FnbUZOZnQ1QjlNbThuc1YvRy9ZOFZH?=
 =?utf-8?B?elRST0JEWUFOZHcxUHIva1FCL0tDZk9ueE1nSlNhTXl3U0dUOXlyaUxVc1Zy?=
 =?utf-8?B?UW9lSXZUc3FWL2QxcE54WTFGblZvVnFyVi9wZnVCdkpZOE1yY1lsTktYbHRa?=
 =?utf-8?B?MnBudXdVNStEQlM1cmZURDFxd2c2TVBrN2d4Z1ZDR3ZSRklud1g1U3NLZDRP?=
 =?utf-8?B?OGRQZ09zL3Raa2lyd3BrK2lRL1dqUTBFMDRmdmV3VWxreExHdGNhRHZBYnF1?=
 =?utf-8?B?c2N6aW52VEpISHFyWER0eTBkMnF2blhENHFKWXZsbkZyMG9TR2gyYWQ3NEhy?=
 =?utf-8?B?akQ2WExtemt2TWRZYTMvUnFFZi9MRTZVbFhiQVFKUmYvcWlkeHBvUFpWUlVP?=
 =?utf-8?B?SnB5NjZlNXExY29ZeEFLU0llNFd5OHNSRlVCR3FiZU02aGVQWERnM0tadDc5?=
 =?utf-8?B?S0VwQy9qTlFVWFJCMlFiRUxLN0orcWFOQzZrN01DS1ZFVHZvSmpna3ZaRmFR?=
 =?utf-8?B?VUJuMktaZGkwT0pMOGM5SWN4YXcveHRwZHQwaGFFT3dVeFJ4WHAwaFRTd1Mr?=
 =?utf-8?B?QmtVOE5zVEc2d01hMlRKMlRJR2xVSEp3V1dlQUJMaTZydEpqRWlxeVk2dmhK?=
 =?utf-8?B?eUVzRGxwT3d1M2c4N1A2S2piKy9iejh0SDJWZVJQMkxReXc5TXRBdmh0K095?=
 =?utf-8?B?UVBRQUFEMFBaUUxWaWFaVWF5aGQvem5TKzBLU29ycDNFbXRlY29YNTNtWTYw?=
 =?utf-8?B?eTdOWlVQblEya2ZMQzVjQVZrQlRnRXg1aEpjazNlWGFsL3dyeEtwY2g4ajlE?=
 =?utf-8?B?NW5oWEZRTkU2VElnQ0NxRElvN2RoN1llTHBoTlREZXR3d1FDQURFNEJBR0o0?=
 =?utf-8?B?Yy9ITjgvUG52Z2E3UXdXTmZhVzIvajRjUXZRMWoyb2txVGFSSVVjTVJaaFlO?=
 =?utf-8?B?cDJHL3RNQmk5SUd2QjFNTTlQOW9xdExnMjExdjZ3eHN6Q01zRDFoTzVrUzBO?=
 =?utf-8?B?VDhGeXpUMjFmQW5DSkF6aWNRa3F2bkdiSS9mRjB0ZjRwdytoQk9UUVlWNndY?=
 =?utf-8?B?U244MXZzdFhrcmMrcDdkZzh5QTFwdVpRWFVnZU85Q2hoU05rSFNiM2VXeUJr?=
 =?utf-8?B?WnV3NmJSOUJiZlE2VkowZzFjU0ZMOFdMT1hodGl3Z1V1RWlFQmlyTDBjV3RM?=
 =?utf-8?B?clJpRnE2cVdBbEJtR2h2Ulp1ODJiNEd3QUVOWTJGOERyZmdrbjlTYVoxakEw?=
 =?utf-8?B?YklvckFBL0lHUGpXTm52TUw0cDVKL1lOK2NHSTRCMkdzOUprMFEwMmZXakt4?=
 =?utf-8?B?UHhpS25YenR6cE5uWmFGdzVTeC9kU3VSd3ozS2JkMmxMeXBRaWYvRzBUTyt0?=
 =?utf-8?B?TWFhZUtTVytFT2JLSGxJaGVNUkl0YXBmUU9NVHpwUVJONUt1MjYxS2toVUVj?=
 =?utf-8?B?eUdzMkg3MEIwTzJ3c2NrYmJHOFdXeVRKSFpLZ1dwQmZUTzgxWTEzcmloMTA3?=
 =?utf-8?B?OXBkTlFKeWpPb3FOV3o5MDdvQzRqbHRYY3pyUjcydXNobEpGZEttRFYxcllq?=
 =?utf-8?B?ZitUcHZqZDM0OFJKOXoxRWdDeG8xbXFmZU82eWpDV2RhM1IwYnJ6SkViejh5?=
 =?utf-8?B?dllZY2RqdGhZN09iQktVWkRvSHA4cld5N0l5SUkxam1ESkJVK2hzbHJvSm1I?=
 =?utf-8?B?eUo2TlluemZCbWNFeGxteTdMUnA1UkgxWDI4YWpzcnpaUUQvblkwY1J2MmhY?=
 =?utf-8?B?NnlCRWRudnhBQ2RXMENtcUF6ZDNmR3JtNW5uVUowN3BtNmdGTXgvRXpLanhC?=
 =?utf-8?B?NTREazJYS2ZqQUpHa25NODNPYUk4ODBpS3l3WjI4NzY1ZjR5bUhFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66197002-9d39-4a3f-9af7-08de9cda2885
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 23:36:33.2549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2Itl2Myn+Ni0dN5ylAyyvLLoHAg7xaKsmm9czrX0cLLZdgH4T/7JtS7xDzWlrvOm8oLpQWqF93Mpxf5UTs33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
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



On 4/17/26 15:38, Swati Sharma wrote:
> +void igt_hdr_disable(igt_output_t *output)
> +{
> +	igt_hdr_set_metadata(output, NULL);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
> +}
> +
> +void igt_hdr_enable(igt_output_t *output)
> +{
> +	struct hdr_output_metadata meta;
> +
> +	/* Fill HDR metadata and enable it on the output */
> +	igt_hdr_fill_st2084(&meta);
> +	igt_hdr_set_metadata(output, &meta);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
> +}

There are warnings during compilation, and there are fixed by PATCH 4 
"lib/igt_hdr: Add helpers to enable and disable HDR on an output".

[11/927] Compiling C object lib/libigt-igt_hdr_c.a.p/igt_hdr.c.o
../lib/igt_hdr.c:203:6: warning: no previous prototype for 
‘igt_hdr_disable’ [-Wmissing-prototypes]
   203 | void igt_hdr_disable(igt_output_t *output)
       |      ^~~~~~~~~~~~~~~
../lib/igt_hdr.c:209:6: warning: no previous prototype for 
‘igt_hdr_enable’ [-Wmissing-prototypes]
   209 | void igt_hdr_enable(igt_output_t *output)
       |      ^~~~~~~~~~~~~~

How about squashing patch 4 to patch 1?
