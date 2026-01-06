Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1B9CD0423
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 00:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3B210E0C0;
	Tue,  6 Jan 2026 00:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JjY7zLK2";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013048.outbound.protection.outlook.com
 [40.93.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDA310E0C0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 00:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0BC28KaEzojHvfJ369wDvZ+zlxPBQxrO1BHA6MZ1CAldRF1cKcnsfbo/YX4iIris9L0brPwJU5+xzs7+AqgdNjua9T4P0S+AYxz+dn4hC7i9LgclwfS7pSZVqjB3HYKbsHe7phvVWV5aHKDFxD3k2nUp9AegIcDybXayr/VDIqQaoMjJSoSLcOGXNthoJSh/PQZ9SYJw5HVfP2vrTe4xnOb34dTWDdx4N45x9E8QvNRlT5jdlK7ndzsKHFFI7E7RjM7mGWvdYKsBNnzKHr/N17n3bgYJH/gJue/QTDm/OzrNJpWpFQYz0h6YfV1RK8bIYaEuwneowVgrIIqpi1ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW34cAEp9KTmGwwssks+R/PU247TU2OZfbs9MtzYLgw=;
 b=oAs8T5rhcGFPTKy5F7AEqBY9HIwnSNP2qRlaXSnq4MKqSmRtSk2v3YOuzFIU9qyxC51eDBcpdwT7eoTVu5Vk0eCbzaO2xSbr898TLZar4rzbdpNxoev0TDLx8T5xy0MFh/wUrVmu/AUxi7lI5F+VouGkgF2k3sAuk6CXVQOkV3FcHrudVTb6W5vJYofk7iC9L8L8fAs+T7HWZQLArN5QPnOZzl3fLysMmxePfnfXywJ95XcfOLUXCmVe5yfNcSS7djVhyFZRkAmTU9TQJr5mPyvN2fI2RsWle7RXeiYJcWM7zueLJY/mMp7+OW5HkL2ngOJlGSDEkzO4VWoLvD8nFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW34cAEp9KTmGwwssks+R/PU247TU2OZfbs9MtzYLgw=;
 b=JjY7zLK2XoiQHQo/np9ww19lvEyvQ1RPyAjgCNJ6Un8d6hc2IsLiZnqwY3ZL/tGnqMyLQQnhAPiBjo51+6fs3tWcixkEr+ZSHnxd0U0n1XMiVMn4seYYB1RWDL/myqto9O/j/W70YKYrPoSNrXPdSwJyL+6CX8Tf3YOtyAM2gzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 00:33:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 00:33:00 +0000
Message-ID: <89138fc0-ec31-48be-befb-8b3d105e8ea5@amd.com>
Date: Mon, 5 Jan 2026 17:32:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/intel_pat: include fcntl.h for O_RDONLY
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
References: <20260105181936.231376-1-x.wang@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260105181936.231376-1-x.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::34) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8e77c3-a1b8-4f92-0c73-08de4cbb254a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlBnd3lTVUdRcW9vWkYrUDVZSUQwZE5uZ2Q5aC82T2tmTUVJYXRIWTg3VDJD?=
 =?utf-8?B?R2dSczVqS0tyR28rT0pvL29ManJobGdUTWdEMjU0ay9kMVZBM1VwaGRBajZm?=
 =?utf-8?B?bzF0NFoycklKSmlOa0N6L05sYnJtTktpTmZvaFdNT0VqODZ4T2I0WDg3SC9w?=
 =?utf-8?B?UFpFYzBGTmszVlcwOXU2NnByREF2ZHBFam9sTW91T0d4MWpFaUpEZVJGVm16?=
 =?utf-8?B?ZFRqaTA5Mkt4VGRhdFZ1TkNvZUVLYnFoRlExL0VZdHA2bHVjUktCRzFsWDZv?=
 =?utf-8?B?dHBhK3djREN5elcxMzdEemdEVFErTWh3NnltZE5Rb3hKbDdkaGl2cUZmTjBk?=
 =?utf-8?B?OU4xcGJKT2ZOVkJFb0x6Y29YbFkvazBCeUdRUmNvYW1idEtkc2ZOeGJiVnNr?=
 =?utf-8?B?MkE3MS9XZDJJbDhQSDFGWUFaZWRxVmdhVGd4dVpTS1pGdTBvOXY4UlVhZVhk?=
 =?utf-8?B?K1U3UER3T1NLMWx1WlRXRGZaLzBnYzMxRUNVQnZxR0xHRmJ5bUIyNkdjVU5o?=
 =?utf-8?B?UTIwY1VjRlYyS1JCSFc1WThFWkNNZ0p0RUVUUXRtY3MxcUhkZER2dGNGaDZh?=
 =?utf-8?B?R2RIelVlSkdxSHhmVVluS0NtTzVPYU9UVFp5MkxtcG4xV3ZHOU5RRzJzRC9v?=
 =?utf-8?B?VVlsY0VpeG9NRkt6b0xaSGMvZjZZakxkeGtqWVUvOUtFZ2RpWkdvV1hJTjhF?=
 =?utf-8?B?bll2NGpPZ1JKWDBNNkdqWGIyTFBqcjRMZkxncE8xNE5LUjhYbDZBOTFmU0pC?=
 =?utf-8?B?NWF3RDcyMFVGN3NsSEFiTE5aVGQ5ZUtHZkRmU3R5ZTY2MkhEb3czLzZtSitH?=
 =?utf-8?B?ZzJhUnZGS25NaVFUTkc3cE1KOVQwRWEvS1VZUUJkMGo2cm9aK1F6aXBsdVhK?=
 =?utf-8?B?cXA2RjZzeThSWjBPQjNTUkJDeFY3R2k2RjNxMy9sVkRRWVV5Z0FLOHptbmk5?=
 =?utf-8?B?a3ViY0Y3WFhZbVU3Q1B6U210V0ZWaklCMW5sV0lMVEM5elJ5b2V1eVArUGdZ?=
 =?utf-8?B?V09kTDB3VitQeE14c2QraTZDVnhNWHgyVkJmQ2Q1ZmJnamw4dDFvSHJYRmFD?=
 =?utf-8?B?aDBHK0w4OU1XeUlDWG1ZcnhQMWhWVTFBc3JvdHhPbld2Z3VYc1VnWEVHbTVG?=
 =?utf-8?B?MGxKWS9Qcll6RUJQV0kxQ3J2OTFNT1dKUzI5YUZkVE1VZ1FmOWRjSnd5RmRZ?=
 =?utf-8?B?NXdnR0dvZGtzWHF6NzVlK0lnTStreG5tRWJiQ1A1aVJZQmExNVZlRjE0UmVJ?=
 =?utf-8?B?QXRoQ3JjWDdwSnNKYmN1Z3NFK1BoeVVoNlZSQmJsT1pXNWZrOEQyYnVMTElv?=
 =?utf-8?B?NmFtWnJ5Y2Z5QmREY1gvS2cvekVCMzlsencyb3VPQTVDMFRtWnBKcmZ2TEI4?=
 =?utf-8?B?RTFsV2Y0ODZ6aCtvRUJiMzJ4VEp0TEdSNHpjOUFUYXEyR1Vha3Eza0N2c3Vj?=
 =?utf-8?B?WmJ6d29LYm1Ua2FtVktPZ1FZT3RzelZnT0JXZ1R4WUw4UUZnTisrN3RpTEgv?=
 =?utf-8?B?NlFUeGxvQ3piVzh3SFlES011VG9XK3dWaC9OWEpuTS9tczcrd3VsakUyWG9i?=
 =?utf-8?B?cThweHlWMkh6NXhrVVJMUFdUZW1vcjU1UHc0MExHTXQ4UkpHQkFTclpEcEh0?=
 =?utf-8?B?blBHT1FyTy9uYlRBWUxIRWR6Y0dFOGtyNmRQNmlEM2ZVdUd6WldiOHpIL2ht?=
 =?utf-8?B?TjV3TEhTZTYzd2dTd0dCMCtad3Zpd2RiK1Z1RzFZOUpyOGxFNkt6cXVyc1RI?=
 =?utf-8?B?WFpzRlpDNE1EcUdzUFRxZDVHK2FRekVEdlNIZ2lZMlllL3dNdTNOOVBBcUE5?=
 =?utf-8?B?STZpY0ZETkw2SDl4dEZjUlhKV3JCTXZaUTh1ZnFuWlA4VDNvN0IwN0ZqV0I0?=
 =?utf-8?B?ekxHTDcvOHZxTHRmZWRLYXE3c1JMUjJsb2pCcnpveHkzU1VNNFhzMkI1c2Jn?=
 =?utf-8?Q?dJfh886HrOzqQDe6tWfGvAwYoiA5OGnt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmthRFdJaWJvU0xZbGd5bDJObFA5QnNaQ0xuUWw1ZktjYVU2Wnd0aGwycTY5?=
 =?utf-8?B?T0ZObVQwc1czeTBmWXh6TE0yZkVvQ1FCNkRrUStVeXN3djdoMkR4WHgrRkdY?=
 =?utf-8?B?NHVXNWVBLzR6cXVjc0lkSFRrZ0IvNFFqQnRJOVRWcEFyOEh6L0VMTTQ1eCty?=
 =?utf-8?B?SzZIbENYT1pKOG9YdUxkV3hzZEtvN2FZY2IveVA0SXlhTEJMbFVEQW1CblVS?=
 =?utf-8?B?M0w2NG9abElmODZ4andNdHhERy9vam9kU1oxOHN3NkJPUFk2UHp5ckI3QjVo?=
 =?utf-8?B?VDZZblpTVmVxUjJ1T2JKalJtR1hHamNoRjRYUGY3amdhTTNQZlJnb1JmdDRv?=
 =?utf-8?B?WVUxQXlvTVgwZXdEZm1CZU53WWlNT1FVbENveXlyWlZyWVpENFJ5UHVYTFVH?=
 =?utf-8?B?STdaN2pYaS9OU0llZGFPdHhTV28xVXRjS0cxWWN4MlRxRW1RWFB3WVpXNWcy?=
 =?utf-8?B?cTV4OE95WklIeThMT1NsR3JFUzdrMHZCWWtndjJXUVd1a0RQeXhuTXhjNmxE?=
 =?utf-8?B?cU1UNTZYbzQ2NkJjakV1eWg3MXVSMkpIK3h2T1FJRlpYNUhFR2M2N2lDeWNW?=
 =?utf-8?B?Z1I3T0JIbWhoTW1rRjkvdTBYelVSMjZYcFl0Qy91RjZIVk55anJaRFBIQWln?=
 =?utf-8?B?MEhhWGw5RW1WdDFqblhKVzlTTk5nek5XT2RFS1U3VmROV2liRUdpMzhvc09u?=
 =?utf-8?B?Z2l5emZvdTlaalphLzBkUG1WNXpOK08xVzNOOFZkYVZBcGdSZ3pPUFFzdjB4?=
 =?utf-8?B?RDJPMmtqMURzWkhJekdNR215dFk4TFhPamVldUpFKzNXSUNsTURBdzJCd1JB?=
 =?utf-8?B?RWJvbXdreUVwYjVFN29kUkN3K211cFZlaVZsZERYTXJsNzl0czlwV0kybmI0?=
 =?utf-8?B?TVpXYUhsSmtKL2ZzYXg2SGRkMGZGdTQybDNGa0ZBc2xKeFN0dEFkVUtOL0lY?=
 =?utf-8?B?UEVpMEwrUDNxWm1XUWYvQyt5eEcyUnpUVGNOejdmajBNU1JycE1pejhPNjVr?=
 =?utf-8?B?S2p3MUVFZnJJRTV3SUVDWjVkcE1oN2VGNlNDS2RwNzJ5TW13czl0RDlhbjR3?=
 =?utf-8?B?Wi80bUNBYUJGbHhnSk9wZ3VhSEVYWVdkVVFCM0U2VWdJMGV1c1JoWWNSejU0?=
 =?utf-8?B?b2o3VklxTWN6MWxZZXRNUUx0VDlBdTlNQUVVaWdWSXQ4N3d6cDJIWS9iQVdu?=
 =?utf-8?B?QXhZTm1wY1hjRGpsVU5YMGY1UmZ6YU1GbFYzcUpyMVZObVE4QnBrRUUrdWYy?=
 =?utf-8?B?cGpPZzhVMUhEL3l2NkU2Rm8rdjNqczlZNWttRjNGcnZPVUF5eUw2UEZoZ3dJ?=
 =?utf-8?B?c2RlWS9jMmhwMWVucHRLZ25OVUZ1bnBMS2oxcGFSbVJNUTNsVHJHNS9Da1RM?=
 =?utf-8?B?S3NPRmRxaXBFWUI0MUdkeHZicG0vbUsrTFZrQWo3blpCUXo4WE9UeVBldGV2?=
 =?utf-8?B?b0p3MkUrU0dBcFNjaWNOQjh5VVhMREl1bEhwOFo0NVRzS0JPbk1UMXJsNDVi?=
 =?utf-8?B?N3FUT0JTR0xscWtSNU5PWVZDcUo5K2txeG5CeklBVTVYWGhOQnJUcjBSUis3?=
 =?utf-8?B?NHcxUHd6ZlBNUE5kVUhTQTVNWk81SlArN0FDQU9lYzloZytPL0s0SmV3dmpu?=
 =?utf-8?B?a08zVG1nZ3d5d2VBUWhqejZmQWlWajdYTlZXSFRLQXJQWVZ1aitMZUM5OWVh?=
 =?utf-8?B?Sm1pdUNZR3RjT0ZTOTNmWUlGcm1GN3I5NUFWSVVtVS8zOHg0RU5DVTc2UElt?=
 =?utf-8?B?RzNtbU52UUZEZFJUbjdmTTFxSU9VOXhoVno4eFRYd3YxWUxER3Brbng3UVZO?=
 =?utf-8?B?a2NoR3BxZGd5SWEvSnIxQ2dtZktraWtBS0x3RmNpWjlCUGJmZm42aExGM2lZ?=
 =?utf-8?B?SUswbmlzdVhPS3FUNW5iTjdMTFIvbHFDNUtBRVRObUVNM0xydEQ5cnJuM2NJ?=
 =?utf-8?B?Y1RHa0Fvc2xFTllMRURHYlJUdXpva2tick9jVld5YkFRaWozcXFNUG9LOGZF?=
 =?utf-8?B?anJiQnhpejhvenRlNldlMGNsSjZSaTQ3LzhidUZBK05HRDlIenpTTHdQamR2?=
 =?utf-8?B?QXpVSGRpVHYwMWVvUS9NKzllWVlZaERaZHhBOExJb2djWElQNjRNL1BCdEVj?=
 =?utf-8?B?dzNlTTJNVDM1Ynd5TVlTWjU5cXRwY0pzclQrVEtXSjcxMUszUHFDWUFmbXNR?=
 =?utf-8?B?TDZZbDNZYk1oWEVoYUxWcTR1bURXZUJWT3dLS1RXdFhBWFdQV3dHcWRWRUR3?=
 =?utf-8?B?WHBRQVJOZXhpMkdWT1ZMWW1YRkxITnFaTmtROUtCaWVqUzJnd29SZGxIL21Y?=
 =?utf-8?B?Y1RlR0wvZm5RQjVRTDRadDl4UXR4VXNnNXFVQit1ZDRNcmYvdTJPQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8e77c3-a1b8-4f92-0c73-08de4cbb254a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 00:33:00.3115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKzt9xBJ5dXdAc9TM3hT4ffP0dzV8tCPqoVzhVgtM8oHB/PmuUE1pgbECzj75PA2SbXsEhSxRZiAvjzMWRtfOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
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


Tested-by: Alex Hung <alex.hung@amd.com>

On 1/5/26 11:19, Xin Wang wrote:
> Add the missing include to make builds reliable across
> environments (e.g. container/CI builds).
> 
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577836
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/intel_pat.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 127f2160a..9815efc18 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <fcntl.h>
>   #include "igt.h"
>   #include "intel_pat.h"
>   

