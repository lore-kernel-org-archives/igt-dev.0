Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90D10EAA5
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 16:10:03 +0000 (UTC)
Message-ID: <77a5b9bb-6951-0cf7-fd19-09c0cff19601@intel.com>
Date: Fri, 20 Jan 2023 21:39:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20230120144500.29821-1-swati2.sharma@intel.com>
 <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
 <Y8qz8KK5DsFHW3Oe@platvala-desk.ger.corp.intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <Y8qz8KK5DsFHW3Oe@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] Revert VDSC lib changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20-Jan-23 9:02 PM, Petri Latvala wrote:
> On Fri, Jan 20, 2023 at 04:47:58PM +0200, Petri Latvala wrote:
>> On Fri, Jan 20, 2023 at 08:15:00PM +0530, Swati Sharma wrote:
>>> This reverts
>>>      commit 2a611c37bd170763052bf6c17aa2d48cf09a63c1
>>>      commit 65202cbc6109f17cf786a95947f4ee9223aec6b8
>>>      commit b6984b946ba66f6bb0452b223fe188429ddeab34
>>>      commit bbc2a5ceadb656552c5bcf95a19ce2b292a78128
>>>
>>> Series broke git pipeline, revert above commits.
>>>
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>
>> The ultimate root cause is gitlab CI using Debian buster and thus
>> libdrm 2.4.97. Until that's changed (soon) #include <stddef.h> and
>> maybe some others need to be liberally applied all around.
>>
>> Thanks for the quick revert.
>>
>> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> Gitlab pipeline for this series was a success, go ahead and merge.

Done.
> 
> 

-- 
~Swati Sharma
