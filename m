Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61566E092
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Sep 2021 15:22:04 +0000 (UTC)
Date: Tue, 28 Sep 2021 18:17:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVMyCdS6F8WovgKm@platvala-desk.ger.corp.intel.com>
References: <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
 <DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <CAJUqKUoXc4g8QCKUBJAi5opMD31KW7ei2o2mA9ozHF0UV9qSFg@mail.gmail.com>
 <DM4PR12MB529578D5A447184B322867638BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <YVLdSqQs7ok5+PIX@platvala-desk.ger.corp.intel.com>
 <0e047200-f40a-daa8-80d8-4745da3b9430@amd.com>
 <YVMeQSv4SOgPhN6f@platvala-desk.ger.corp.intel.com>
 <0aadb8c4-1329-4241-a65a-1348c7b5b692@amd.com>
 <20210928144347.iv3dxo4rmu7u42c7@outlook.office365.com>
 <CAJUqKUo5ehK7zFSGXehd6oWmsWJu3ku2v9PT_vx_4HCj1Ord6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJUqKUo5ehK7zFSGXehd6oWmsWJu3ku2v9PT_vx_4HCj1Ord6A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 10:48:17AM -0400, Mark Yacoub wrote:
> On Tue, Sep 28, 2021 at 10:43 AM Rodrigo Siqueira
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> > Hi,
> >
> > I also tested it using vkms and vc4.
> >
> > I already applied the V1 in the upstream.
> >
> > Thanks
> > Siqueira
> >
> > On 09/28, Aurabindo Pillai wrote:
> > >
> > > On 9/28/21 9:53 AM, Petri Latvala wrote:
> > > > On Tue, Sep 28, 2021 at 09:35:10AM -0400, Aurabindo Pillai wrote:
> > > > > On 9/28/21 5:15 AM, Petri Latvala wrote:
> > > > > > On Mon, Sep 27, 2021 at 07:10:45PM +0000, Pillai, Aurabindo wrote:
> > > > > > > Skipping using the continue statement has the side effect of this
> > > > > > > subtest being absent from the list of subtests, when running the
> > > > > > > test executable with paramter --list-subtest. Is that okay ?
> > > > > > It's not okay btw. When you're not in an igt_fixture or an
> > > > > > igt_subtest, you cannot use anything that touches the hardware or the
> > > > > > running system in any way.
> Hi Petri, can you elaborate more on this. I'm curious to understand
> what you mean. I'm slightly confused.

All subtests must be enumerable regardless of hardware, basically.

In other words, you cannot do

igt_fixture {
  variable_assigned_in_fixture = value;
}

if (variable_assigned_in_fixture)
  igt_subtest("only-exists-sometimes") {}


-- 
Petri Latvala
