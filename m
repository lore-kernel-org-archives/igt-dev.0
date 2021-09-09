Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 9 Sep 2021 08:30:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt v3 0/3] Initial igt tests for drm/msm
 ioctls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 11:02:42AM -0700, Rob Clark wrote:
> On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> > plenty more we can add, but need to start somewhere.
> >
> > Rob Clark (3):
> >   drmtest: Add DRIVER_MSM support
> >   msm: Add helper library
> >   msm: Add submit ioctl tests
> 
> If there are no more comments on this series, could somebody push it?

Ah, I was expecting you to do it yourself. Merged now.


-- 
Petri Latvala
