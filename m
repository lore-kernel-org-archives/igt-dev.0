Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16FC6E830
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 00:54:16 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 3 Jun 2021 00:54:06 +0000
Message-ID: <5812d2ab06dcb2837295b719dd97f1042367edc1.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-8-alan.previn.teres.alexis@intel.com>
 <YLf62cMQj4H4C/YW@intel.com>
In-Reply-To: <YLf62cMQj4H4C/YW@intel.com>
Content-Language: en-US
Content-ID: <B30103FC6715AD4EA9F1CE77F3150D4C@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 07/17] Add MI_SET_APPID instruction
 definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2021-06-02 at 17:40 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:34AM -0700, Alan Previn wrote:
> > Add MI_SET_APPID instruction and param definitions
> > 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  lib/intel_reg.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> > index ac1fc6cb..46b5da20 100644
> > --- a/lib/intel_reg.h
> > +++ b/lib/intel_reg.h
> > @@ -2546,6 +2546,15 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> > SOFTWARE.
> >  #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
> >  #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
> >  
> > +#define MI_SET_APPID                    (0x0E << 23)
> > +#define APPID_CTXSAVE_INHIBIT           (1 << 8)
> > +#define APPID_CTXREST_INHIBIT           (1 << 9)
> > +#define DISPLAY_APPTYPE                 (0)
> > +#define TRANSCODE_APPTYPE               (1)
> > +#define APPTYPE(n)                      (n << 7)
> > +#define APPID(n)                        (n & 0x7f)
> 
> What about sorting the bits?
> 
What do u mean by "sorting the bits"? if u mean swap
APP_CTXSAVE_INHIBIT with APP_CTXREST_INHIBIT so we work from MSB down,
then sure, i will fix that. If i have misunderstood, could u paste some
psuedocode? (so i understand correctly)

> anyway
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> > +
> > +
> >  /* Dword 0 */
> >  #define MI_VERTEX_BUFFER		(0x17<<23)
> >  #define MI_VERTEX_BUFFER_IDX(x)		(x<<20)
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
