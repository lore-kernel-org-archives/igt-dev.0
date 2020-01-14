Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200110115320.1284901-1-chris@chris-wilson.co.uk>
 <06e82c0a-3752-6d30-0aa0-0bb9993b5bae@linux.intel.com>
 <157899692591.27314.10652294075559860834@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <831fd3bf-031d-5b0a-ae73-6fc1ffa6051d@linux.intel.com>
Date: Tue, 14 Jan 2020 10:21:31 +0000
MIME-Version: 1.0
In-Reply-To: <157899692591.27314.10652294075559860834@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] i915/perf: Find the associated
 perf-type for a particular device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 14/01/2020 10:15, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-14 10:09:15)
>>
>> On 10/01/2020 11:53, Chris Wilson wrote:
>>> -uint64_t i915_type_id(void)
>>> +static char *bus_address(int i915, char *path, int pathlen)
>>> +{
>>> +     struct stat st;
>>> +     int len = -1;
>>> +     int dir;
>>> +     char *s;
>>> +
>>> +     if (fstat(i915, &st) || !S_ISCHR(st.st_mode))
>>> +             return NULL;
>>> +
>>> +     snprintf(path, pathlen, "/sys/dev/char/%d:%d",
>>> +              major(st.st_rdev), minor(st.st_rdev));
>>> +
>>> +     dir = open(path, O_RDONLY);
>>> +     if (dir != -1) {
>>> +             len = readlinkat(dir, "device", path, pathlen - 1);
>>> +             close(dir);
>>> +     }
>>> +     if (len < 0)
>>> +             return NULL;
>>> +
>>> +     path[len] = '\0';
>>
>> In the realm of hypothetical but an assert that no truncation occurred
>> would be good.
>>
>> if (len == pathlen - 1)
>>          return NULL;
>>
>> ?
>>
>> Although it is not clear to me from man readlinkat how do we distinguish
>> between truncation and exact fit.
>>
>> Or you were counting on failure at a later step if truncation occurred?
> 
> I did not expect a partial match to ever succeed. We at least know for
> the moment the names are fixed.
> 
>> Maybe try stat(2) in this wrapper to be sure function returns a valid path?
> 
> That would have the same danger of a partial match.

True, it would need more string validation - that the returned string 
matches the PCI bus address format of xxxx:yy:zz. Failure at a later 
step works for now I guess.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

> I think the foolproof solution here is having pmu_name in
> /sys/class/drm/cardN/pmu_name. (Or rather
> /sys/dev/char/%d:%d/device/pnu_name. :)

True.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
