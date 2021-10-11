Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B088F897E3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 05:57:47 +0000 (UTC)
Message-ID: <0d52e0ce-439f-11fb-7341-f98f36e45dee@intel.com>
Date: Mon, 11 Oct 2021 11:27:25 +0530
Content-Language: en-US
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-7-manasi.d.navare@intel.com>
 <34c4fba2-55ef-07fa-67ef-6bd3f5a94730@intel.com> <YWBMtOfZjPEwNoL9@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <YWBMtOfZjPEwNoL9@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 06/14] tools/intel_display_poller: Add
 async flip test mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "Navare, Manasi D" <manasi.d.navare@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/8/2021 7:20 PM, Ville Syrjälä wrote:
> On Mon, May 17, 2021 at 12:28:00PM +0530, Karthik B S wrote:
>> On 3/2/2021 2:07 AM, Navare, Manasi D wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Test various things using mmio async flips. These are present since
>>> g4x, except g4x does not seem to have a working flipdone interrupt.
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    lib/intel_reg.h              |  3 ++
>>>    tools/intel_display_poller.c | 83 +++++++++++++++++++++++++++---------
>>>    2 files changed, 66 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
>>> index ac1fc6cb..7b543109 100644
>>> --- a/lib/intel_reg.h
>>> +++ b/lib/intel_reg.h
>>> @@ -2330,6 +2330,9 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>>>    
>>>    #define PIPEEDPCONF		0x7F008
>>>    
>>> +#define DSPAADDR_VLV		0x7017C /* vlv/chv */
>>> +#define DSPBADDR_VLV		0x7117C /* vlv/chv */
>>> +#define DSPCADDR_CHV		0x7417C /* chv */
>>>    #define DSPACNTR		0x70180
>>>    #define DSPBCNTR		0x71180
>>>    #define DSPCCNTR		0x72180
>>> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
>>> index be237221..d6a77d35 100644
>>> --- a/tools/intel_display_poller.c
>>> +++ b/tools/intel_display_poller.c
>>> @@ -144,16 +144,35 @@ static uint32_t dspoffset_reg(uint32_t devid, int pipe)
>>>    		return PIPE_REG(plane, DSPABASE);
>>>    }
>>>    
>>> -static uint32_t dspsurf_reg(uint32_t devid, int pipe)
>>> +static uint32_t dspsurf_reg(uint32_t devid, int pipe, bool async)
>>>    {
>>>    	int plane = pipe_to_plane(devid, pipe);
>>>    
>>> +	if (async && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)))
>>> +		return PIPE_REG(plane, DSPAADDR_VLV);
>>> +
>> Hi,
>>
>> Would this be correct when we try async flip on Pipe C on CHV? It would
>> return 0x7217C whereas the required return is 0x7417C? Please correct me
>> if I'm missing something here.
> Sorry, forgot to reply to this. This handled through pipe_offset[].
>
> #define PIPE_REG(pipe, reg_a) (pipe_offset[(pipe)] + (reg_a))
> ...
> if (IS_CHERRYVIEW(devid))
> 	pipe_offset[2] = 0x4000;
>
Thank you for the clarification. I had missed this condition and only 
checked the definition.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>
