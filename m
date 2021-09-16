Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20210915215558.2473428-1-John.C.Harrison@Intel.com>
 <20210915215558.2473428-2-John.C.Harrison@Intel.com>
 <YUMHcIsB1+9UmWKV@platvala-desk.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e4f66112-8628-0870-81a3-622838cdd86a@intel.com>
Date: Thu, 16 Sep 2021 10:27:41 -0700
In-Reply-To: <YUMHcIsB1+9UmWKV@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 1/1] tests/i915/query: Query,
 parse and validate the hwconfig table
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT-Dev@lists.freedesktop.org, Intel-GFX@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Slawomir Milczarek <slawomir.milczarek@intel.com>, Matthew Brost <matthew.brost@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 9/16/2021 01:59, Petri Latvala wrote:
> On Wed, Sep 15, 2021 at 02:55:58PM -0700, John.C.Harrison@Intel.com wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Newer platforms have an embedded table giving details about that
>> platform's hardware configuration. This table can be retrieved from
>> the KMD via the existing query API. So add a test for it as both an
>> example of how to fetch the table and to validate the contents as much
>> as is possible.
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   include/drm-uapi/i915_drm.h |   1 +
>>   lib/intel_hwconfig_types.h  | 106 +++++++++++++++++++++++
>>   tests/i915/i915_query.c     | 168 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 275 insertions(+)
>>   create mode 100644 lib/intel_hwconfig_types.h
>>
>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>> index b9632bb2c..ae0c8dfad 100644
>> --- a/include/drm-uapi/i915_drm.h
>> +++ b/include/drm-uapi/i915_drm.h
>> @@ -2451,6 +2451,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_ENGINE_INFO	2
>>   #define DRM_I915_QUERY_PERF_CONFIG      3
>>   #define DRM_I915_QUERY_MEMORY_REGIONS   4
>> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>>   /* Must be kept compact -- no holes and well documented */
> Please update i915_drm.h with a copy from the kernel and state in the
> commit message which kernel commit sha it's from. If this change is
> not in the kernel yet, add this token to lib/i915/i915_drm_local.h
> instead.
>
>
Neither side is merged yet. My understanding is that all sides need to 
be posted in parallel for CI to work. Once green and reviewed, the 
kernel side gets merged first. Then the IGT/UMD patches get updated with 
the official kernel headers, reposted and then merged.

John.
