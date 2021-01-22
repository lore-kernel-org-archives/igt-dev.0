Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210121181005.762333-1-tvrtko.ursulin@linux.intel.com>
 <161126484631.3166.17704076104258866952@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <92e11d23-a4f8-da09-5f90-6a0b0ca6614f@linux.intel.com>
Date: Fri, 22 Jan 2021 11:36:48 +0000
MIME-Version: 1.0
In-Reply-To: <161126484631.3166.17704076104258866952@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel-gpu-top: Support for
 client stats
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 21/01/2021 21:34, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-01-21 18:10:05)
>> +static struct clients *init_clients(const char *drm_card)
>> +{
>> +       struct clients *clients = malloc(sizeof(*clients));
>> +       const char *slash;
>> +       ssize_t ret;
>> +
>> +       memset(clients, 0, sizeof(*clients));
>> +
>> +       if (drm_card) {
>> +               slash = rindex(drm_card, '/');
>> +               assert(slash);
>> +       } else {
>> +               slash = "card0";
>> +       }
>> +
>> +       ret = snprintf(clients->sysfs_root, sizeof(clients->sysfs_root),
>> +                      "/sys/class/drm/%s/clients/", slash);
>> +       assert(ret > 0 && ret < sizeof(clients->sysfs_root));
> 
> Afaict, igt_device_card_match_pci et al are not guaranteed to fill in
> dev->drm_card and may leave it blank instead of finding the
> corresponding /dev/dri/cardN.

I did the rest but this is giving me trouble - can't see locally that it 
doesn't populate it. Do you know how to trigger that?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
