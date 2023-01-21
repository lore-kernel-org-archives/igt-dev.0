Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208810E10A
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Jan 2023 05:28:49 +0000 (UTC)
Message-ID: <ab1a4f9a-05f5-4590-2f3d-35a45c71bf51@intel.com>
Date: Sat, 21 Jan 2023 10:58:44 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
 <20230112073537.27890-4-swati2.sharma@intel.com>
 <e905e151fc0bb6c67f034752a7c428040c66ff47.camel@intel.com>
 <cd098a3b-adeb-8a77-17e9-8bc82543c750@intel.com>
 <c8bee171603f926096dd99e6369c78dc3f97f367.camel@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <c8bee171603f926096dd99e6369c78dc3f97f367.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/8] lib/dsc: Add helpers for VDSC
 YCbCr420 debugfs entry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20-Jan-23 4:32 PM, Hogander, Jouni wrote:
> On Wed, 2023-01-18 at 22:06 +0530, Swati Sharma wrote:
>>
>>
>> On 13-Jan-23 1:47 PM, Hogander, Jouni wrote:
>>>> + * Returns: 1 on success or negative error code, in case of
>>>> failure.
>>> 0 is usually success, < 0 is error. This is also in coding style
>>> document. I see igt_force_dsc_enable is also using 1. Maybe you
>>> should
>>> fix that as well in a separate patch.
>>>    
>> This ret value is returned from igt_sysfs_write() which returns the
>> number of bytes written, or -errno on error.
>>
>> I guess we can't change this.
>>
> 
> No, igt_sysfs_write is logical. It returns bytes written or < 0 on
> error. What you could do is to check ret value of igt_sysfs_write and
> return 0 if igt_sysfs_write succeeded.

ohh, okay got it.
Will make those changes. Thanks!

> 
> BR,
> 
> Jouni Högander
> 

-- 
~Swati Sharma
